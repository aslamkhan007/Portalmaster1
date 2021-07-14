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
using System.Net.Mime;
using System.Threading;
using System.ComponentModel;


public partial class Payroll_ActionArea : System.Web.UI.Page
{
    Connection obj = new Connection();
    Connection obj1 = new Connection();
    Functions objfun = new Functions();
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
    SendMail sm = new SendMail();




    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!IsPostBack)
        {
            Control parent = pnlHidden.Parent;
            ViewState["indx"] = parent.Controls.IndexOf(PnlGuestHouse);
            Locationbind();
            MyTasks();

            ddlApproved_AccomodateStay.Items.Clear();
            string Plant = string.Empty;

            Plant = (string)objfun.FetchValue("SELECT DISTINCT Plant FROM dbo.Jct_Payroll_GuestHouse_List WHERE STATUS='A' and HOD='" + Session["Empcode"].ToString() + "'").ToString();
            
            objfun.FillList(ddlApproved_AccomodateStay, "Exec Jct_Payroll_GuestHous_Fetch '" + Plant + "'");

        }
    }

    public void MyTasks()
    {
        FetchRecordPending();
        if (DrpLvStatus.SelectedItem.Value == "SalaryAdvance")
        {

            /* The below if condition is added to show authrorized sanction amount to only below HODS
             * 
             */
            if (Session["Empcode"].ToString() == "9000000102" || Session["Empcode"].ToString() == "9000000355" || Session["Empcode"].ToString() == "9000000974")
            { Panel1.Visible = true; }
        }
        else
        {
            Panel1.Visible = false;
        }

        if (DrpLvStatus.SelectedItem.Value == "PF")
        {
            if (Session["Empcode"].ToString() == "9000000537" || Session["Empcode"].ToString() == "9000000371" || Session["Empcode"].ToString() == "9000000295" || Session["Empcode"].ToString() == "9000000077")
            {
                Panel2.Visible = true;
                Panel3.Visible = true;
            }

            if (Session["Empcode"].ToString() == "9000000093" || Session["Empcode"].ToString() == "9000000537" || Session["Empcode"].ToString() == "9000000097" || Session["Empcode"].ToString() == "9000000295" || Session["Empcode"].ToString() == "9000000355")
            {
                Panel3.Visible = true;
            }

        }
        else
        {
            Panel2.Visible = false;
            Panel3.Visible = false;
        }



        if (DrpLvStatus.SelectedItem.Value == "Reimbursements")
        {
            if (Session["Empcode"].ToString() == "9000000537" || Session["Empcode"].ToString() == "9000000371" || Session["Empcode"].ToString() == "9000000334" || Session["Empcode"].ToString() == "9000000089" || Session["Empcode"].ToString() == "9000000453")
            {
                lnkReset0.Visible = true;
            }
        }
        else
        {
            lnkReset0.Visible = false;
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
        Cmd.Parameters.Add("@Param", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Value;
        Cmd.Parameters.Add("@Param1", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Text;
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
        //SqlCommand sqlCmd = new SqlCommand("SELECT Name,SName FROM Jct_PayrollPortal_ActionCategory  WHERE STATUS = 'A' ORDER BY NAME ", obj.Connection());
        SqlCommand sqlCmd = new SqlCommand("Jct_PayrollPortal_ActionCategory_Fetch",obj.Connection());
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@ECode", SqlDbType.VarChar, 15).Value = Session["Empcode"].ToString();
        sqlCmd.Parameters.Add("@CatgF", SqlDbType.Char, 1).Value = "Y";
        SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DrpLvStatus.Items.Clear();
        DrpLvStatus.DataSource = ds;
        DrpLvStatus.DataTextField = "SName";
        DrpLvStatus.DataValueField = "NAME";
        DrpLvStatus.DataBind();

    }
    protected void DrpLvStatus_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        MyTasks();
        string isHOD =  string.Empty ;

        isHOD = (string) objfun.FetchValue("Exec Jct_payrollportal_GHReq_HOD_Validate '" + Session["Empcode"].ToString() + "'" ).ToString();
        if (isHOD.ToUpper() == "Y" && DrpLvStatus.SelectedItem.Text.ToLower() == "ghrequest")
        {
            PnlGuestHouse.Visible = true;
            //if (Page.Controls.IndexOf(GridExtTask) >= 0)
            //{

            //}
            //Control parent = pnlHidden.Parent;
            ////ViewState["indx"] = parent.Controls.IndexOf(PnlGuestHouse);

            //if (parent != null && parent.Controls.IndexOf(pnlHidden) >= 0)
            //{
            //    parent.Controls.AddAt(parent.Controls.IndexOf(pnlHidden), PnlGuestHouse);
            //}
        }
        else
            PnlGuestHouse.Visible = false;
        
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
        string script1 = string.Empty;
        //SqlTransaction tran;
        //tran = obj.Connection().BeginTransaction();
        try
        {
            foreach (GridViewRow gvRow in GridExtTask.Rows)
            {
                string AutoID = string.Empty;
                string RequestAmt = string.Empty;
                CheckBox chkRemove = (CheckBox)gvRow.FindControl("chkCheck");
                Decimal SanctionedAmt = 0;
                if (chkRemove.Checked == true)
                {
                    rowIndex = (int)gvRow.RowIndex;
                    RequestAmt = gvRow.Cells[6].Text.Replace("&nbsp;", "");
                    AutoID = gvRow.Cells[1].Text.Replace("&nbsp;", "");

                    if (DrpLvStatus.SelectedItem.Value.ToLower() == "salaryadvance")
                    {
                        //COMMENTED ON 27 DEC 2018 TO INITIALISE NEW HIERARCHY 
                        //if ((Session["Empcode"].ToString() == "9000000806" || Session["Empcode"].ToString() == "9000000094" || Session["Empcode"].ToString() == "9000000128" || Session["Empcode"].ToString() == "9000000974"))
                        if (Session["Empcode"].ToString() == "9000000102" || Session["Empcode"].ToString() == "9000000355" || Session["Empcode"].ToString() == "9000000974")
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
                        cmd1.Parameters.Add("@AuthBy", SqlDbType.VarChar, 10).Value = Session["Empcode"].ToString();
                        cmd1.Parameters.Add("@Area", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Value;
                        cmd1.ExecuteNonQuery();
                    }

                    if (DrpLvStatus.SelectedItem.Value.ToLower() == "pf")
                    {
                        //if ((Session["Empcode"].ToString() == "9000000806" || Session["Empcode"].ToString() == "9000000094" || Session["Empcode"].ToString() == "9000000128" || Session["Empcode"].ToString() == "9000000974"))
                        if (Session["Empcode"].ToString() == "9000000537" || Session["Empcode"].ToString() == "9000000334" || Session["Empcode"].ToString() == "9000000295" || Session["Empcode"].ToString() == "9000000077")
                        //if (Session["Empcode"].ToString() == "9000000274" || Session["Empcode"].ToString() == "9000000077")
                        {
                            if (Convert.ToDecimal(txtTotAmt.Text) < Convert.ToDecimal(txtLessRefundable.Text))
                            {
                                txtTotAmt.Text = "";
                                txtLessRefundable.Text = "";
                                lblNetPayableAmt.Text = "";
                                string script11 = "alert('Less Refundable Amount Should Not be More than Total Amount !! ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script11, true);
                                return;
                            }
                            //SantionAmountUpdate
                            string sql2 = "Jct_PayrRoll_PFAdvance_Withdrawl_Auth_Update_Data";
                            SqlCommand cmd2 = new SqlCommand(sql2, obj.Connection());
                            cmd2.CommandType = CommandType.StoredProcedure;
                            cmd2.Parameters.Add("@Autoid", SqlDbType.Int).Value = Convert.ToInt32(AutoID);
                            cmd2.Parameters.Add("@PFSanctionAmt", SqlDbType.Decimal, 8).Value = Convert.ToDecimal(txtPFSanctionAmt.Text);
                            cmd2.Parameters.Add("@PFWTotAmt", SqlDbType.Decimal, 12).Value = Convert.ToDecimal(txtTotAmt.Text);
                            cmd2.Parameters.Add("@PFWRefLoanAmt", SqlDbType.Decimal, 12).Value = Convert.ToDecimal(txtLessRefundable.Text);
                            cmd2.Parameters.Add("@AuthBy", SqlDbType.VarChar, 10).Value = Session["Empcode"].ToString();
                            cmd2.Parameters.Add("@Area", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Value;
                            cmd2.ExecuteNonQuery();    
                        }
                                           
                    }
                    
                    // Comented by Ashish Sharma on 20Apr2020 string sql = "Jct_Payroll_Authrisation_Update";
                    string sql = "Jct_Payroll_Authrisation_Update_ashish";
                    SqlCommand cmd = new SqlCommand(sql, obj.Connection());
                    cmd.CommandType = CommandType.StoredProcedure;
                    //      cmd.Transaction = tran;
                    cmd.Parameters.Add("@Autoid", SqlDbType.Int).Value = Convert.ToInt32(AutoID);
                    cmd.Parameters.Add("@AuthorisedBy", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
                    cmd.Parameters.Add("@AuthFlag", SqlDbType.Char).Value = 'A';
                    cmd.Parameters.Add("@Param", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Value;


                    String GHR_Param = string.Empty;
                    if (ddlApproved_AccomodateStay.Items.Count > 0)
                        GHR_Param = "AStay:" + ddlApproved_AccomodateStay.SelectedItem.Value + "Drinks*" + ddlDrinksServed1.SelectedItem.Text;
                    else
                        GHR_Param = "";
                    cmd.Parameters.Add("@GHParam", SqlDbType.VarChar, 20).Value = GHR_Param;
                    
                        
                    //cmd.Parameters.Add("@Remarks", SqlDbType.VarChar, 100).Value = DrpLvStatus.SelectedItem.Value;
                    cmd.ExecuteNonQuery();
                    //string script1 = DrpLvStatus.SelectedItem.Value + "Authorized";
                    
                    if (DrpLvStatus.SelectedItem.Value.ToLower() == "leave3")
                        script1 = DrpLvStatus.SelectedItem.Text ;
                    else
                        //Comented on 13June2020 script1 = DrpLvStatus.SelectedItem.Value;
                        script1 = DrpLvStatus.SelectedItem.Text;

                    RecordInsertStatus = true;                   

                    //if ((Session["Empcode"].ToString() == "9000000453" || Session["Empcode"].ToString() == "9000000334"))
                    //{
                    //Comented on 27June2020 if (DrpLvStatus.SelectedItem.Value == "Leave" || DrpLvStatus.SelectedItem.Value == "Compensatory" || DrpLvStatus.SelectedItem.Value == "Leave1" || DrpLvStatus.SelectedItem.Value.ToLower() == "workfromhome" || DrpLvStatus.SelectedItem.Value.ToLower() == "leave3")
                    if (objfun.CheckRecordExistInTransaction("Select SMS_Notify from Jct_PayrollPortal_ActionCategory where status='A' and name = '" + DrpLvStatus.SelectedItem.Value + "'  and sms_notify='y'") )
                    {

                        ////////sql = "Exec JCT_Payroll_SMS '" + Session["EmpCode"] + "', '" + DrpLvStatus.SelectedItem.Value + "', '" + Convert.ToInt32(AutoID) + "'";
                        ////////dr = obj1.FetchReader(sql);

                        ////////if (dr.HasRows == true)
                        ////////{

                        ////////    dr.Read();

                        ////////    sql = "Dear " + dr["name"].ToString() + ", your " + dr["RequestArea"].ToString() + " for " + dr["days"].ToString() + " day(s) dated from " + dr["FromDate"].ToString() + " to " + dr["ToDate"].ToString() + " has been authorised.";

                        ////////    sm.SendMAILSMS(dr["CellNo"].ToString(), sql);
                        ////////}

                        try
                        {
                            sql = "Exec JCT_Payroll_SMS '" + Session["EmpCode"] + "', '" + DrpLvStatus.SelectedItem.Value + "', '" + Convert.ToInt32(AutoID) + "'";
                            dr = obj1.FetchReader(sql);

                            if (dr.HasRows == true)
                            {

                                dr.Read();
                                sql = "Dear " + dr["name"].ToString() + ", your " + dr["RequestArea"].ToString() + " for " + dr["days"].ToString() + " day(s) dated from " + dr["FromDate"].ToString() + " to " + dr["ToDate"].ToString() + " has been authorised.";
                                sm.SendMAILSMS(dr["CellNo"].ToString(), sql);

                            }
                            dr.Close();
                        }
                        catch (Exception ex)
                        {
                            string script = "alert('" + ex.Message + ". Unable To Send Sms" + "');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                        }

                       try
                        {
                            if (DrpLvStatus.SelectedItem.Value.ToLower() == "leave3" || DrpLvStatus.SelectedItem.Value.ToLower() == "leave4")
                                sendmailGH(Convert.ToInt32(AutoID), "A", Session["EmpCode"].ToString(), DrpLvStatus.SelectedItem.Text);
                            else
                            sendmail(script1, Convert.ToInt32(AutoID));
                        }
                        catch (Exception ex)
                        {
                            string script = "alert('" + ex.Message + ". Unable To Send Email" + "');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                        }
                    }


                    if (DrpLvStatus.SelectedItem.Value == "SalaryAdvance" || DrpLvStatus.SelectedItem.Value == "LeaveEncashment" || DrpLvStatus.SelectedItem.Value == "LTC" || DrpLvStatus.SelectedItem.Value == "Reimbursements" || DrpLvStatus.SelectedItem.Value == "PF")
                    {
                        sql = "Exec JCT_Payroll_SMS_SalaryAdvance '" + Session["EmpCode"] + "', '" + DrpLvStatus.SelectedItem.Value + "', '" + Convert.ToInt32(AutoID) + "'";
                        dr = obj1.FetchReader(sql);

                        if (dr.HasRows == true)
                        {
                            dr.Read();
                            //sql = "Dear " + dr["name"].ToString() + ", your " + dr["RequestArea"].ToString() + " applied on " + dr["ToDate"].ToString() + " of Rs. " + dr["amount"].ToString()  + " is authorised.";
                            sql = "Dear " + dr["name"].ToString() + " your " + dr["RequestArea"].ToString() + " applied on " + dr["ToDate"].ToString() + " of " + dr["amount"].ToString() + " is authorzed";                            
                            sm.SendMAILSMS(dr["CellNo"].ToString(), sql);

                        }
                        dr.Close();
                    }

                    //}
                }
            }

            if (RecordInsertStatus == true)
            {
               // 05June2020 string script = "alert('" + DrpLvStatus.SelectedItem.Value + " Authorized');";
                string script = "alert('" + script1 + " Authorized');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);

                ////////if (DrpLvStatus.SelectedItem.Value == "Leave" || DrpLvStatus.SelectedItem.Value == "Compensatory" || DrpLvStatus.SelectedItem.Value == "Leave1")
                ////////{

                ////////    sql = "Exec JCT_Payroll_SMS '" + Session["EmpCode"] + "', '" + DrpLvStatus.SelectedItem.Value + "', '" + Convert.ToInt32(AutoID) + "'";
                ////////    dr = obj1.FetchReader(sql);

                ////////    if (dr.HasRows == true)
                ////////    {

                ////////        dr.Read();
                ////////        sql = "Dear " + dr["name"].ToString() + ", your " + dr["RequestArea"].ToString() + " for " + dr["days"].ToString() + " day(s) dated from " + dr["FromDate"].ToString() + " to " + dr["ToDate"].ToString() + " has been authorised.";
                ////////        sm.SendMAILSMS(dr["CellNo"].ToString(), sql);
                ////////    }

                ////////}




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
            MyTasks();
        }
        finally
        {
            //tran.Commit();
            obj.ConClose();
        }
    }

    protected void ChkOrderSelAll_CheckedChanged(object sender, EventArgs e)
    {
        Boolean Chk_Status = false;
        CheckBox ChkBoxHeader = (CheckBox)GridExtTask.HeaderRow.FindControl("ChkOrderSelAll");
        Chk_Status = ChkBoxHeader.Checked;
        if ((DrpLvStatus.SelectedItem.Value.ToLower() != "salaryadvance") && (Session["Empcode"].ToString() == "9000000806" || Session["Empcode"].ToString() == "9000000094" || Session["Empcode"].ToString() == "9000000128" || Session["Empcode"].ToString() == "9000000974"))
        {
            foreach (GridViewRow row in GridExtTask.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkCheck");
                ChkBoxRows.Checked = Chk_Status;       
            }
        }
        else //((DrpLvStatus.SelectedItem.Value.ToLower() != "salaryadvance") && (Session["Empcode"].ToString() != "9000000806" || Session["Empcode"].ToString() != "9000000094" || Session["Empcode"].ToString() != "9000000128" || Session["Empcode"].ToString() != "9000000974"))
        {
            //CheckBox ChkBoxHeader = (CheckBox)GridExtTask.HeaderRow.FindControl("ChkOrderSelAll");
            foreach (GridViewRow row in GridExtTask.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkCheck");
                ChkBoxRows.Checked = Chk_Status;
            }
        }
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
                    cmd.Parameters.Add("@Param", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Value;
                    if (!string.IsNullOrEmpty(txtauthremarks.Text))
                    {
                        cmd.Parameters.Add("@Remarks", SqlDbType.VarChar, 100).Value = txtauthremarks.Text;
                    }
                    cmd.ExecuteNonQuery();
                    string script1 = DrpLvStatus.SelectedItem.Value + "Cancelled";
                    //  sendmail(script1, Convert.ToInt32(AutoID));
                    txtauthremarks.Text = ""; 
                }
            }
            MyTasks();
            string script = "alert('" + DrpLvStatus.SelectedItem.Value + " Cancelled');";
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
        Response.Redirect("ActionArea.aspx");
    }

    private void sendmail(string s, int ids)
    {
        try
        {
            string ltype = string.Empty;
            ltype = objfun.FetchValue("SELECT LeaveNature FROM dbo.Jct_Payroll_OnLine_Request WHERE Autoid='" + ids +"'").ToString();
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
             //   url = "http://localhost:51907/LeaveAuthMailFormat.aspx?id=" + ids + "&Code=" + Session["EmpCode"];

               // url = "https://202.164.56.10:8081/LeaveAuthMailFormat.aspx?id=" + ids + "&Code=" + Session["EmpCode"];
			   url = "https://eportal.jctltd.com/LeaveAuthMailFormat.aspx?id=" + ids + "&Code=" + Session["EmpCode"];
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
            SmtpMail.Host = "90.0.1.247";
            SmtpMail.Port = 25;
            SmtpMail.UseDefaultCredentials = false;
            // comented by 27Apr2020 if (ds.Tables[0].Rows[0]["ToIds"].ToString() == "kamal_bhasin@jctltd.com")
	    if ((ds.Tables[0].Rows[0]["ToIds"].ToString() == "kamal_bhasin@jctltd.com") || (ds.Tables[0].Rows[0]["ToId"].ToString() == "kamal_bhasin@jctltd.com"))
            //if (ds.Tables[0].Rows[0]["ToId"].ToString() == "rbaksshi@jctltd.com")
            {
                @from = "approvals@jctltd.com";

                //mail.From = new MailAddress(@from, "Leave Authorization", System.Text.Encoding.UTF8);

                // SmtpMail.Credentials = new System.Net.NetworkCredential(@from, "pass@123");
            }
            else
            {
                @from = "noreply@jctltd.com";
                // mail.From = new MailAddress(@from, "Leave Authorization", System.Text.Encoding.UTF8);
                // SmtpMail.Credentials = new System.Net.NetworkCredential(@from, "nrp@123");

            }



            //if (DrpLvStatus.SelectedItem.Value == "Leave1")
            //{
            //    DrpLvStatus.SelectedItem.Value = "Official Duty";
            //}




            //mail.From = New MailAddress(mailfrom, displayname, System.Text.Encoding.UTF8)

            mail.From = new MailAddress(@from);
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            subject = DrpLvStatus.SelectedItem.Text + " Auhtorization with ID " + ids.ToString();
            bcc = "ashish@jctltd.com,aslam@jctltd.com,rajan@jctltd.com";

            cc = ds.Tables[0].Rows[0]["cc"].ToString();
            //if ( (ltype.ToLower() == "pre joining approval" || ltype.ToLower() == "workfromhome") && mail.From.ToString()=="kamal_bhasin@jctltd.com" )
            if (( ltype.ToLower() == "workfromhome") && mail.From.ToString() == "kamal_bhasin@jctltd.com")
                 cc += ",athapar@jctltd.com,kamal_bhasin@jctltd.com";

            if ( (ltype.ToLower() == "pre joining approval" ) && mail.From.ToString()=="kamal_bhasin@jctltd.com" )
            //if (( ltype.ToLower() == "workfromhome") && mail.From.ToString() == "kamal_bhasin@jctltd.com")
                 cc += ",athapar@jctltd.com";
            //kamal_bhasin@jctltd.com";


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
            SmtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
            SmtpMail.EnableSsl = false;

            Thread email = new Thread(delegate()
                        {
                            //sendmail("ok", 5238);
                            SmtpMail.Send(mail);
                        });
            email.IsBackground = true;
            email.Start();

            /////////////////////////////////////////////////////////////////SmtpMail.Send(mail);
            //   string script = "alert('Mail Sent');";
            //   ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
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


    protected void chkCheck_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)sender;
        GridViewRow gr = (GridViewRow)chk.Parent.Parent;
        //Label1.Text = gr.Cells[1].Text;
        gr.Focus();
        // qry = "Exec Jct_Payroll_Compensatory_Attendance_Match '" + gr.Cells[1].Text + "'";
        string SqlPass = null;
        if (chk.Checked == false)
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            return;
        }
        else
        {
            if (DrpLvStatus.SelectedItem.Value.ToLower() == "reimbursements")
            {
                Response.Redirect("~/ReimUploaddocCheck.aspx?ecode=" + Convert.ToInt64(gr.Cells[10].Text));
                //Convert.ToInt64(gr.Cells[10].Text);
            }
        }

        if (Session["Empcode"].ToString() == "9000000350" || Session["Empcode"].ToString() == "9000000075")
        {
            SqlCommand Cmd = new SqlCommand();
            SqlPass = "Jct_Payroll_Compensatory_Attendance_Match";
            Cmd = new SqlCommand(SqlPass, obj.Connection());
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@Autoid", SqlDbType.BigInt).Value = Convert.ToInt64(gr.Cells[1].Text);

            SqlDataAdapter Da = new SqlDataAdapter(Cmd);
            DataSet ds = new DataSet();
            Da.Fill(ds);

            if (ds.Tables.Count == 0)
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                string script = "alert('No Record Found');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                return;
            }
            else
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            }
            //Label1.Text = GridView1.DataKeys[gr.RowIndex].Value.ToString();
        }
    }

    protected void txtLessRefundable_TextChanged(object sender, EventArgs e)
    {
        if (Convert.ToDecimal(txtTotAmt.Text) < Convert.ToDecimal(txtLessRefundable.Text))        
        {
            txtTotAmt.Text = "";
            txtLessRefundable.Text = "";
            lblNetPayableAmt.Text = "";
            string script11 = "alert('Total Amount Cannot Be Less than Less Refundable Loan !! ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script11, true);
            return;
        }
        else
        {
            lblNetPayableAmt.Text = (Convert.ToDecimal(txtTotAmt.Text) - Convert.ToDecimal(txtLessRefundable.Text)).ToString();
        }
    }
    protected void lnkReset0_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ReimUploaddocCheck.aspx");
    }

 private void sendmailGH(int idx, string ActionTaken, string EmpCode,string param)
    {
        try
        {
            string sql = string.Empty;
            string to = string.Empty;
            string from = string.Empty;
            string bcc = string.Empty;
            string cc = string.Empty;
            string subject = string.Empty;
            string body = string.Empty;
            string url = string.Empty;
            string querystring = string.Empty;
            string Body = string.Empty;
            String ReqStatus;
            SqlCommand cmd;
            SqlDataReader dr;

            if (param.ToLower() == "ghrequest")
                subject = "Guest House Request";

            if (param.ToLower() == "transportrequest") 
                subject = "Transport Requistion Request";
            
            //subject = "Guest House Requisition";
            url = "https://eportal.jctltd.com/GHPerforma.aspx?id=" + idx + "&Act=" + ActionTaken + "&Code=" + EmpCode;
            Body = GetPage(url);
            //Body = "Guest House Requisition has been submitted.";
            //to = "saini@jctltd.com";
            //Comented on 05June2020 sql = "exec Jct_Payroll_Leave_Auth_GH_FetchEmailID '" + idx + "','" + ActionTaken + "','" + EmpCode + "' ";
            sql = "exec Jct_Payroll_Leave_Auth_GH_FetchEmailID '" + idx + "','" + EmpCode + "','" + ActionTaken + "','" + param + "' ";
            cmd = new SqlCommand(sql, obj.Connection());
            obj.ConOpen();
            dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                dr.Read();
                to = dr["ToEmail"].ToString();
                bcc = dr["BCCs"].ToString();
                cc = dr["CCs"].ToString();
                ReqStatus = dr["CurStatus"].ToString();
            }
            dr.Close();
            obj.ConClose();

            //to = "ashish@jctltd.com";
            //bcc = "ashish@jctltd.com";
            @from = "adminservices@jctltd.com";

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(@from);
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
            SmtpClient SmtpMail = new SmtpClient("exchange2k7");
            SmtpMail.Send(mail);


            if (ActionTaken.ToUpper() == "A")
            {
                try
                {
                    //'sql = "Exec JCT_Payroll_GH_SMS_Alert '" + Session["EmpCode"] + "', '" + DrpLvStatus.SelectedItem.Text + "', '" + idx + "'";
                    sql = "Exec JCT_Payroll_GH_SMS_Alert '" + idx + "','" + DrpLvStatus.SelectedItem.Text + "'";
                    dr = obj1.FetchReader(sql);
                    if (dr.HasRows == true)
                    {

                        dr.Read();
                        //sql = "Dear " + dr["name"].ToString() + ", your " + dr["RequestArea"].ToString() + " for " + dr["days"].ToString() + " day(s) dated from " + dr["FromDate"].ToString() + " to " + dr["ToDate"].ToString() + " has been authorised.";
                        sql = "GuestHouse Request " + idx + " . Click " + url + " to see details. ";//GuestHouse Request " + idx + " with ref ID * has been *."with ref ID ";
                        sm.SendMAILSMS(dr["Cell"].ToString(), sql);

                    }
                    dr.Close();
                }
                catch (Exception ex)
                {
                    string script = "alert('" + ex.Message + ". Unable To Send Sms" + "');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                }

            }




        }
        catch (Exception ex)
        {
            //lblError.Text = "Error : " + ex.Message;
            return;
        }
       
    }

 protected void ddlApproved_AccomodateStay_SelectedIndexChanged(object sender, EventArgs e)
 {
     if (ddlApproved_AccomodateStay.SelectedItem.Text.ToLower() == "other")
     {
         TxtOther.Visible = true;
         reqd_TxtOther.Enabled = true;
         
         //Control parent = pnlHidden.Parent;

         //if (parent != null && parent.Controls.IndexOf(pnlHidden) >= 0)
         //{
         //    int indx;
         //    indx = (int)ViewState["indx"];
         //    parent.Controls.AddAt(indx, PnlGuestHouse);
         //}
     }
     else
     {
         TxtOther.Visible = false;
         reqd_TxtOther.Enabled = false;
     }
 }
}
