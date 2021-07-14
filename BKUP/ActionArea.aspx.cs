using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security;
using System.Text;
using Microsoft.VisualBasic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Net.Mail;
using System.Net;

public partial class Payroll_ActionArea : System.Web.UI.Page
{
    Connection obj = new Connection();
    public HelpDeskClass ob = new HelpDeskClass();
    public SqlCommand cmd = new SqlCommand();
    public string qry;
    private int i;
    public SqlDataReader dr;
    private string[] cl = new string[71];
    string Empcode = string.Empty;
    string usercode = string.Empty;
    string sql = string.Empty;
    string to = string.Empty;
    string from = string.Empty;
    string bcc = string.Empty;
    string cc = string.Empty;
    string subject = string.Empty;
    string body = string.Empty;
    string url = string.Empty;
    int check1;

    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!IsPostBack)
        {
            Locationbind();            
            MyTasks();
        }
    }

    public void MyTasks()
    {        
        FetchRecordPending();
        if (DrpLvStatus.SelectedItem.Text == "SalaryAdvance")
        {

            /* The below if condition is added to show authrorized sanction amount to only below HODS
             * 
             */
            if (Session["Empcode"].ToString() == "9000000806" || Session["Empcode"].ToString() == "9000000094" || Session["Empcode"].ToString() == "9000000128" || Session["Empcode"].ToString() == "9000000974")
            { Panel1.Visible = true; }
        }
        else
        {
            Panel1.Visible = false;
        }              
    }

    public void FetchRecordPending()
    {
        EnableControls();
        string SqlPass = null;
        SqlCommand Cmd = new SqlCommand();
        SqlPass = "Jct_Payroll_Leave_Authorisation";
        Cmd = new SqlCommand(SqlPass, obj.Connection());
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
        Cmd.Parameters.Add("@Param", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Text;        
        SqlDataAdapter Da = new SqlDataAdapter(Cmd);
        DataSet ds = new DataSet();
        Da.Fill(ds);

        if (ds.Tables.Count == 0)
        {            
            GridExtTask.DataSource = null;
            GridExtTask.DataBind();
            string script = "alert('No Record Found');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            return;
        }
        else
        {
            GridExtTask.DataSource = ds.Tables[0];
            GridExtTask.DataBind();
        }
    }
    public void Locationbind()
    {
        SqlCommand sqlCmd = new SqlCommand("SELECT Name FROM Jct_PayrollPortal_ActionCategory  WHERE STATUS = 'A' ", obj.Connection());
        sqlCmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DrpLvStatus.Items.Clear();
        DrpLvStatus.DataSource = ds;
        DrpLvStatus.DataTextField = "NAME";
        DrpLvStatus.DataValueField = "NAME";
        DrpLvStatus.DataBind();

    }
    protected void DrpLvStatus_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        MyTasks();
    }
    public void DisableControls()
    {
        lnkConfirmAll.Enabled = false;
        LnkCancel.Enabled = false;
    }
    public void EnableControls()
    {
        lnkConfirmAll.Enabled = true;
        LnkCancel.Enabled = true;
    }
    protected void lnkConfirmAll_Click(object sender, EventArgs e)
    {
        int rowIndex = 0;
        Boolean RecordInsertStatus = false;
        //SqlTransaction tran;
        //tran = obj.Connection().BeginTransaction();
        try
        {
            foreach (GridViewRow gvRow in GridExtTask.Rows)
            {
                string AutoID = string.Empty;               string RequestAmt = string.Empty;
                CheckBox chkRemove = (CheckBox)gvRow.FindControl("chkCheck");
                Decimal SanctionedAmt = 0;
                if (chkRemove.Checked == true)
                {
                    rowIndex = (int)gvRow.RowIndex;
                    RequestAmt = gvRow.Cells[6].Text.Replace("&nbsp;", "");
                    AutoID = gvRow.Cells[1].Text.Replace("&nbsp;", "");
                    if (DrpLvStatus.SelectedItem.Text.ToLower() == "salaryadvance")
                    {
                        if ((Session["Empcode"].ToString() == "9000000806" || Session["Empcode"].ToString() == "9000000094" || Session["Empcode"].ToString() == "9000000128" || Session["Empcode"].ToString() == "9000000974"))
                        {
                            SanctionedAmt = Convert.ToDecimal(txtSanctionAmt.Text);
                            if (SanctionedAmt > Convert.ToDecimal(RequestAmt))
                            {
                                string script11 = "alert('Sanction Amount Should Not be More than Required Amount!! ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script11, true);
                                return;
                            }
                        }
                        //SantionAmountUpdate
                        string sql1 = "Jct_Payroll_SalaryAdvance_SntAmt_Update";
                        SqlCommand cmd1 = new SqlCommand(sql1, obj.Connection());
                        cmd1.CommandType = CommandType.StoredProcedure;
                //        cmd1.Transaction = tran;
                        cmd1.Parameters.Add("@Autoid", SqlDbType.Int).Value = Convert.ToInt32(AutoID);
                        cmd1.Parameters.Add("@SanctionAmt", SqlDbType.Decimal, 8).Value = SanctionedAmt;
                        cmd1.Parameters.Add("@AuthBy", SqlDbType.VarChar, 10).Value =Session["Empcode"].ToString();
                        cmd1.Parameters.Add("@Area", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Text;
                        cmd1.ExecuteNonQuery();
                    }                    
                    
                    string sql = "Jct_Payroll_Authrisation_Update";
                    SqlCommand cmd = new SqlCommand(sql, obj.Connection());
                    cmd.CommandType = CommandType.StoredProcedure;
              //      cmd.Transaction = tran;
                    cmd.Parameters.Add("@Autoid", SqlDbType.Int).Value = Convert.ToInt32(AutoID);
                    cmd.Parameters.Add("@AuthorisedBy", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
                    cmd.Parameters.Add("@AuthFlag", SqlDbType.Char).Value = 'A';
                    cmd.Parameters.Add("@Param", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Text;
                    cmd.ExecuteNonQuery();
                    string script1 = DrpLvStatus.SelectedItem.Text + "Authorized";
                    RecordInsertStatus = true;
                    
                    sendmail(script1, Convert.ToInt32(AutoID));
                }
            }
            
            if (RecordInsertStatus == true)
            {
                string script = "alert('" + DrpLvStatus.SelectedItem.Text + " Authorized');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
               
            }
            else
            {
                string script = "alert('No Record Selected for the Action...!!!');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            }
            MyTasks();
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            //tran.Rollback();
        }
        finally
        {
            //tran.Commit();
            obj.ConClose();
        }
    }

    protected void ChkOrderSelAll_CheckedChanged(object sender, EventArgs e)
    {
        if ((DrpLvStatus.SelectedItem.Text.ToLower() != "salaryadvance") && (Session["Empcode"].ToString() == "9000000806" || Session["Empcode"].ToString() == "9000000094" || Session["Empcode"].ToString() == "9000000128" || Session["Empcode"].ToString() == "9000000974" ))
        { 
            CheckBox ChkBoxHeader = (CheckBox)GridExtTask.HeaderRow.FindControl("ChkOrderSelAll");
            foreach (GridViewRow row in GridExtTask.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkCheck");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }
        else //((DrpLvStatus.SelectedItem.Text.ToLower() != "salaryadvance") && (Session["Empcode"].ToString() != "9000000806" || Session["Empcode"].ToString() != "9000000094" || Session["Empcode"].ToString() != "9000000128" || Session["Empcode"].ToString() != "9000000974"))
          
        {
            CheckBox ChkBoxHeader = (CheckBox)GridExtTask.HeaderRow.FindControl("ChkOrderSelAll");
            foreach (GridViewRow row in GridExtTask.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkCheck");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }

        }
        //else
        //{
        //    CheckBox ChkBoxHeader = (CheckBox)GridExtTask.HeaderRow.FindControl("ChkOrderSelAll");
        //    ChkBoxHeader.Checked = false;
        //    string script = "alert('Salary Advance cannot be authroized Collectively!!!');";
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        //}
    }

    protected void LnkCancel_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow gvRow in GridExtTask.Rows)
            {
                CheckBox chkRemove = (CheckBox)gvRow.FindControl("chkCheck");
                if (chkRemove.Checked == true)
                {
                    int rowIndex = (int)gvRow.RowIndex;
                    string AutoID = gvRow.Cells[1].Text.Replace("&nbsp;", "");
                    string sql = "Jct_Payroll_Authrisation_Update";
                    SqlCommand cmd = new SqlCommand(sql, obj.Connection());
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Autoid", SqlDbType.Int).Value = Convert.ToInt32(AutoID);
                    cmd.Parameters.Add("@AuthorisedBy", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
                    cmd.Parameters.Add("@AuthFlag", SqlDbType.Char).Value = 'C';
                    cmd.Parameters.Add("@Param", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Text;
                    cmd.ExecuteNonQuery();
                    string script1 = DrpLvStatus.SelectedItem.Text + "Cancelled";
                 //  sendmail(script1, Convert.ToInt32(AutoID));
                }
            }
            MyTasks();
            string script = "alert('" + DrpLvStatus.SelectedItem.Text + " Cancelled');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            return;
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }
    }

    protected void lnkReset_Click(object sender, EventArgs e)
    {
        // Response.Redirect("ActionArea.aspx");
        string script = "alert('hi');";
       // ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
    }

    private void sendmail(string s, int ids)
    {
        try
        {
           
            sql = string.Empty;
            to = string.Empty;
            from = string.Empty;
            bcc = string.Empty;
            cc = string.Empty;
            subject = string.Empty;
            body = string.Empty;
            url = string.Empty;
            string Body = string.Empty;
            int emailid = 0;
            string querystring = string.Empty;
            string querystring1 = string.Empty;
            string emailStore = string.Empty;
            sql = "Jct_Payroll_Leave_Auth_FetchEmailID_ashish '" + ids + "','" + Session["EmpCode"] + "'";
            SqlCommand cmd = new SqlCommand(sql, obj.Connection());
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            
           

            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["ToId"].ToString() == "")
                {
                    emailStore = "aslam@jctltd.com";
                }
                else
                {
                    emailStore = ds.Tables[0].Rows[0]["ToId"].ToString();
                }
               // url = "http://localhost:51907/LeaveAuthMailFormat.aspx?id=" + ids + "&Code=" + Session["EmpCode"];

                url = "http://202.164.56.10:8081/LeaveAuthMailFormat.aspx?id=" + ids + "&Code=" + Session["EmpCode"];
                Body = GetPage(url);                
                Int16 i;

                if (emailStore.ToString().Substring(0, 1) == ",")
                {
                    i = Convert.ToInt16(emailStore.Length.ToString());
                    to = emailStore.Substring(1, i);
                }
                else
                    to = emailStore;
            }
            MailMessage mail = new MailMessage();
            //mail.From = New MailAddress(mailfrom, displayname, System.Text.Encoding.UTF8)
            SmtpClient SmtpMail = new SmtpClient();
            SmtpMail.Host = "exchange2k7";
            SmtpMail.Port = 25;
            SmtpMail.UseDefaultCredentials = true;
            //if (ds.Tables[0].Rows[0]["ToIds"].ToString() == "kamal_bhasin@jctltd.com")
            if (ds.Tables[0].Rows[0]["ToId"].ToString() == "rbaksshi@jctltd.com")
            {
                @from = "approvals@jctltd.com";
                // SmtpMail.Credentials = new System.Net.NetworkCredential("approvals@jctltd.com", "pass@123");
                mail.From = new MailAddress(@from, "Leave Authorization", System.Text.Encoding.UTF8);
                //client.Credentials = New System.Net.NetworkCredential(mailfrom, pass)
                SmtpMail.Credentials = new System.Net.NetworkCredential(@from, "pass@123");
            }
            else
            {
                @from = "noreply@jctltd.com";
                SmtpMail.Credentials = new System.Net.NetworkCredential(@from, "nrp@123");
                //  SmtpMail.Credentials = new System.Net.NetworkCredential("noreply@jctltd.com", "nrp@123");
            }
           
           //mail.From = New MailAddress(mailfrom, displayname, System.Text.Encoding.UTF8)

            mail.From = new MailAddress(@from);
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            subject = DrpLvStatus.SelectedItem.Text + " Auhtorization with ID " + ids.ToString();         
            bcc = "aslam@jctltd.com,rajan@jctltd.com,ashish@jctltd.com";

            cc = ds.Tables[0].Rows[0]["cc"].ToString();

            
            if (to.Contains(","))
            {
                string[] tos = to.Split(',');
                for (int i = 0; i <= tos.Length - 1; i++)
                {
                    mail.To.Add(new MailAddress(tos[i]));
                }
            }
            else
            {
                mail.To.Add(new MailAddress(to));
            }

            if (!string.IsNullOrEmpty(cc))
            {
                if (cc.Contains(","))
                {
                    string[] ccs = cc.Split(',');
                    for (int i = 0; i <= ccs.Length - 1; i++)
                    {
                        mail.CC.Add(new MailAddress(ccs[i]));
                    }
                }
                else
                {
                    mail.CC.Add(new MailAddress(cc));
                }
            }

            if (!string.IsNullOrEmpty(bcc))
            {
                if (bcc.Contains(","))
                {
                    string[] bccs = bcc.Split(',');
                    for (int i = 0; i <= bccs.Length - 1; i++)
                    {
                        mail.Bcc.Add(new MailAddress(bccs[i]));
                    }
                }
                else
                {
                    mail.Bcc.Add(new MailAddress(bcc));
                }
            }

            
            mail.Subject = subject;
            mail.Body = Body;
            mail.IsBodyHtml = true;
            mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            SmtpMail.Send(mail);
            string script = "alert('Mail Sent');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            obj.ConClose();
        }
        catch (Exception ex)
        {
            string err = string.Empty;
            err = ex.Message.ToString();
            string script = "alert('" + err + " Error');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            return;
        }
        finally
        {
            obj.ConClose();

        }
    }

    protected string GetPage(string page_name)
    {
        WebClient myclient = new WebClient();
        string myPageHTML = null;
        byte[] requestHTML = null;
        string currentPageUrl = null;
        currentPageUrl = Request.Url.AbsoluteUri;
        currentPageUrl = page_name;
        UTF8Encoding utf8 = new UTF8Encoding();
        requestHTML = myclient.DownloadData(currentPageUrl);
        myPageHTML = utf8.GetString(requestHTML);        
        return myPageHTML;
    }

}
