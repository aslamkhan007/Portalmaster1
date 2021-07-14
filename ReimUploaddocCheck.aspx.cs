using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.VisualBasic;
using System.Collections;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Net;
using System.Text;

public partial class ReimUploaddocCheck : System.Web.UI.Page
{
    Connection obj = new Connection();
    Functions objFun = new Functions();
    string qry;
    string sql;
    SqlConnection con;
    Connection cn;
    string Yearmonthstore;
    string abc;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            Locationbind();
            RejectReasonList();
            if (Request.QueryString["ecode"] != null && Request.QueryString["ecode"] != string.Empty)
            {
                txtefffrm.Text = Request.QueryString["ecode"].ToString();
                lnkapply_Click(sender, e);
            }
        }
    }

    public void RejectReasonList()
    {
        SqlCommand sqlCmd = new SqlCommand("SELECT Reason,Reason FROM Jct_Payroll_ConvReimb_RejectReason  WHERE STATUS = 'A' ORDER BY srno ", obj.Connection());
        sqlCmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddlReasonReject.Items.Clear();
        ddlReasonReject.DataSource = ds;
        ddlReasonReject.DataTextField = "Reason";
        ddlReasonReject.DataValueField = "Reason";
        ddlReasonReject.DataBind();
    }

    public void Locationbind()
    {
        string sql = "Jct_Payroll_Reim_Attendence_LastFourMonth_Ash";
        SqlCommand cmd = new SqlCommand(sql, obj.Connection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandTimeout = 0;
        cmd.Parameters.Add("@employeecode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
        cmd.ExecuteNonQuery();
        SqlDataAdapter Da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        Da.Fill(ds);
        DrpLvStatus.Items.Clear();
        DrpLvStatus.DataSource = ds;
        DrpLvStatus.DataTextField = "Monthyear";
        DrpLvStatus.DataValueField = "Monthyear";
        DrpLvStatus.DataBind();
    }

    public String Yearmonth()
    {
        string Sqlpass = "Jct_Payroll_Reim_Attendence_Month";
        SqlCommand cmd = new SqlCommand(Sqlpass, obj.Connection());
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        if (dr.HasRows == true)
        {
            abc = dr[0].ToString();
        }
        dr.Close();
        return abc;
    }

    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Download")
        {
            string CodeYearmonth = "";
            CodeYearmonth = txtefffrm.Text.ToString().Trim() + DrpLvStatus.SelectedItem.Value.Trim();
            string filepath = Server.MapPath("Upload\\" + txtefffrm.Text.ToString().Trim() + "\\" + DrpLvStatus.SelectedItem.Value.Trim() + " ") + "\\";
            string strFileName = "";
            strFileName = e.CommandArgument.ToString();
            Response.Redirect("QutationDownloadFile.aspx?filepath=" + filepath + "&FileName=" + strFileName);
        }        
    }
   
    public void BindUploadedDocs()
    {
        qry = "Jct_Portal_Reimbursement_Doc_Bind_Ash";
        SqlCommand cmd = new SqlCommand(qry, obj.Connection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@DocNo", SqlDbType.VarChar, 20).Value = txtefffrm.Text.ToString().Trim() + DrpLvStatus.SelectedItem.Value.Trim();
        cmd.Parameters.Add("@type", SqlDbType.VarChar, 50).Value = ".All."; //DropDownList20.SelectedItem.Value;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        if (dt.Rows.Count == 0)
        {
            string script = "alert('No Record Found');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            return;
        }
        DataList2.DataSource = null;
        DataList2.DataBind();
        DataList2.DataSource = dt;
        DataList2.DataBind();
    }

    protected void lnkapply_Click(object sender, EventArgs e)
    {
        try
        {
            DataList2.DataSource = null;
            DataList2.DataBind();
            GridExtTask.DataSource = null;
            GridExtTask.DataBind();

            string CodeYearmonth = Session["empcode"].ToString().Trim() + DrpLvStatus.SelectedItem.Value.Trim();
            BindUploadedDocs();
            FetchRecordPending();
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);       
        }      
    }

    protected void lnkreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ReimUploaddocCheck.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ActionArea.aspx");
    }


    protected void lnkAuth_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow gvRow in GridExtTask.Rows)
            {
                //CheckBox chkRemove = (CheckBox)gvRow.FindControl("chkCheck");
                //if (chkRemove.Checked == true)
                //{
                    int rowIndex = (int)gvRow.RowIndex;
                    string AutoID = gvRow.Cells[0].Text.Replace("&nbsp;", "");
                    string sql = "Jct_Payroll_Authrisation_Update_UploadDoc";
                    SqlCommand cmd = new SqlCommand(sql, obj.Connection());
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Autoid", SqlDbType.Int).Value = Convert.ToInt32(AutoID);
                    cmd.Parameters.Add("@AuthorisedBy", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
                    cmd.Parameters.Add("@AuthFlag", SqlDbType.Char).Value = 'A';
                    cmd.Parameters.Add("@Param", SqlDbType.VarChar, 20).Value = "Reimbursements";
                    cmd.ExecuteNonQuery();
                    GridExtTask.DataSource = null;
                    GridExtTask.DataBind();
                    DataList2.DataSource = null;
                    DataList2.DataBind();
                    HideControls();
                    SendmailAuth(Convert.ToInt32(AutoID));
                    GetNextRecord();
                //}
            }            
            
            string script = "alert('Record Successfully Authorized..');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            return;
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }
    }

    protected void lnkreject_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow gvRow in GridExtTask.Rows)
            {
                //CheckBox chkRemove = (CheckBox)gvRow.FindControl("chkCheck");
                //if (chkRemove.Checked == true)
                //{
                    int rowIndex = (int)gvRow.RowIndex;
                    string AutoID = gvRow.Cells[0].Text.Replace("&nbsp;", "");
                    string sql = "Jct_Payroll_Authrisation_Update_Reimbursment_Reject";
                    SqlCommand cmd = new SqlCommand(sql, obj.Connection());
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Autoid", SqlDbType.Int).Value = Convert.ToInt32(AutoID);
                    cmd.Parameters.Add("@AuthorisedBy", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
                    cmd.Parameters.Add("@AuthFlag", SqlDbType.Char).Value = 'C';
                    cmd.Parameters.Add("@Param", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Value;
                    cmd.Parameters.Add("@Remarks", SqlDbType.VarChar, 100).Value = ddlReasonReject.SelectedItem.Value;
                    cmd.ExecuteNonQuery();
                    GridExtTask.DataSource = null;
                    GridExtTask.DataBind();
                    DataList2.DataSource = null;
                    DataList2.DataBind();
                    HideControls();
                    SendmailCancel(Convert.ToInt32(AutoID));
                    GetNextRecord();
                //}
            }            
            //string script = "alert('Reimbursement For The Month Of " + DrpLvStatus.SelectedItem.Value + " Successfully Rejected..');";
            string script = "alert('Record Successfully Rejected..');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            return;
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }
    }

    public void FetchRecordPending()
    {
        //GridExtTask.DataSource = null;
        //GridExtTask.DataBind();   
        string SqlPass = null;
        SqlCommand Cmd = new SqlCommand();
        SqlPass = "Jct_PayrRoll_ConvReimb_Auth__Reject_FetchData";
        Cmd = new SqlCommand(SqlPass, obj.Connection());
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.Parameters.Add("@Empcode", SqlDbType.VarChar, 10).Value = txtefffrm.Text;
        Cmd.Parameters.Add("@Yearmonth", SqlDbType.Int).Value = Convert.ToInt32(DrpLvStatus.SelectedItem.Value);        
        SqlDataAdapter Da = new SqlDataAdapter(Cmd);
        DataSet ds = new DataSet();
        Da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            GridExtTask.DataSource = null;
            GridExtTask.DataBind();            
            HideControls();
            return;
        }
        else
        {
            GridExtTask.DataSource = ds.Tables[0];
            GridExtTask.DataBind();
            VisibleControls();
        }
    }

    public void VisibleControls()
    {
        Label1.Visible = true;
        ddlReasonReject.Visible = true;
        lnkreject.Visible = true;
        lnkAuth.Visible = true; 
        pnl1.Visible = true;
        GridExtTask.Visible = true; 
    }

    public void HideControls()
    {
        Label1.Visible = false;
        ddlReasonReject.Visible = false;
        lnkreject.Visible = false;
        lnkAuth.Visible = false;
        pnl1.Visible = false;
        GridExtTask.Visible = false;
    }

    string EmailTO, name, empcodess;

    public void SendmailCancel(int autid)
    {
        try
        {

            System.Net.Mail.SmtpClient Client = new System.Net.Mail.SmtpClient();
            System.Net.Mail.MailMessage Message = new System.Net.Mail.MailMessage();
            // ------------------------------------------------------------------------------------------------------------------------------            
            // Severe Name & Prot number
            // ------------------------------------------------------------------------------------------------------------------------------
            Client.Host = "EXCHANGE2k7";
            Client.Port = 25;

            // ------------------------------------------------------------------------------------------------------------------------------
            //if (EmailFrom != "")
            //{
            //    System.Net.Mail.MailAddress From = new System.Net.Mail.MailAddress(EmailFrom);
            //    Message.From = From;
            //}

            System.Net.Mail.MailAddress From = new System.Net.Mail.MailAddress("noreply@jctltd.com");
            Message.From = From;
            // ------------------------------------------------------------------------------------------------------------------------------
            // Send message for To
            // ------------------------------------------------------------------------------------------------------------------------------
            var SqlPass = "Exec Jct_Payroll_Leave_Auth_FetchEmailID_Reject  '" + autid + "' , '" + Session["EmpCode"] + "' ";
            SqlDataReader Dr = obj.FetchReader(SqlPass);
            try
            {
                if (Dr.HasRows == true)
                {
                    Dr.Read();
                    {
                        if (Dr != null && Dr.HasRows)
                        {
                            EmailTO = Dr["EmailID"].ToString();
                            name = Dr["EmployeeName"].ToString();
                            empcodess = Dr["empcodess"].ToString();
                            //YYMonth = Dr["Yearmonth"].ToString();
                            //Message.CC.Add(ViewState["EmployeeFrom"].ToString());
                            //Message.CC.Add("aslam@jctltd.com");
                            //Message.CC.Add("cc");
                            //Message.To.Add(EmailTO);
                            Message.Bcc.Add("aslam@jctltd.com");

                            Message.Bcc.Add("rajan@jctltd.com");
                           


                        }
                    }
                    Dr.Close();
                }
            }
            catch (Exception ex)
            {
                string script = "alert('" + ex.Message + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            }
            finally
            {
                obj.ConClose();
            }
            Message.IsBodyHtml = true;
            Message.Priority = System.Net.Mail.MailPriority.High;            
            //Message.Body = "Dear User </br></br>" + name + "( " + " " + empcodess + " ) " + " " + " <br/><br/> Your " + DropDownList20.SelectedItem.Value + " Reimbursement For The Month Of " + "  " + DrpLvStatus.SelectedItem.Value + " Has Been Rejected Due To " + " " + ddlReasonReject.SelectedItem.Value + " " + "Documents." + "<br/><br/>Please ReSubmit It Before 15th Of This Month <br/><br/><br/><b> Note: All Reimbursements Submitted After 15th Will Be Considered In Next Month </b>   <br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!! ";
            Message.Body = "Dear User </br></br>" + name + "( " + " " + empcodess + " ) " + " " + " <br/><br/> Your " + " Reimbursement For The Month Of " + "  " + DrpLvStatus.SelectedItem.Value + " Has Been Rejected Due To " + " " + ddlReasonReject.SelectedItem.Value + " " + "Documents." + "<br/><br/>Please ReSubmit It Before 15th Of This Month <br/><br/><br/><b> Note: All Reimbursements Submitted After 15th Will Be Considered In Next Month </b>   <br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!! ";
            
            //Message.Subject = DropDownList20.SelectedItem.Text + " Reimbursement Rejection with ID " + autid.ToString();

            Message.Subject = "Reimbursement Rejection with ID " + autid.ToString();

            Message.To.Add(EmailTO.ToString());
            if (EmailTO != "")
            {
                Client.Send(Message);
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "hhh", "<script language = javascript>alert('Error Coming.')</script>");
        }

        finally
        {
        }
    }

    public void SendmailAuth(int autid)
    {
        try
        {

            System.Net.Mail.SmtpClient Client = new System.Net.Mail.SmtpClient();
            System.Net.Mail.MailMessage Message = new System.Net.Mail.MailMessage();
            // ------------------------------------------------------------------------------------------------------------------------------            
            // Severe Name & Prot number
            // ------------------------------------------------------------------------------------------------------------------------------
            Client.Host = "EXCHANGE2k7";
            Client.Port = 25;

            // ------------------------------------------------------------------------------------------------------------------------------
            //if (EmailFrom != "")
            //{
            //    System.Net.Mail.MailAddress From = new System.Net.Mail.MailAddress(EmailFrom);
            //    Message.From = From;
            //}

            System.Net.Mail.MailAddress From = new System.Net.Mail.MailAddress("noreply@jctltd.com");
            Message.From = From;
            // ------------------------------------------------------------------------------------------------------------------------------
            // Send message for To
            // ------------------------------------------------------------------------------------------------------------------------------
            var SqlPass = "Exec Jct_Payroll_Leave_Auth_FetchEmailID_Auth  '" + autid + "' , '" + Session["EmpCode"] + "' ";
            SqlDataReader Dr = obj.FetchReader(SqlPass);
            try
            {
                if (Dr.HasRows == true)
                {
                    Dr.Read();
                    {
                        if (Dr != null && Dr.HasRows)
                        {
                            EmailTO = Dr["EmailID"].ToString();
                            name = Dr["EmployeeName"].ToString();
                            empcodess = Dr["empcodess"].ToString();
                            //YYMonth = Dr["Yearmonth"].ToString();
                            //Message.CC.Add(ViewState["EmployeeFrom"].ToString());
                            //Message.CC.Add("aslam@jctltd.com");
                            //Message.CC.Add("cc");
                            //Message.To.Add(EmailTO);

                            Message.Bcc.Add("aslam@jctltd.com");
                            Message.Bcc.Add("rajan@jctltd.com");                            
                        }
                    }
                    Dr.Close();
                }
            }
            catch (Exception ex)
            {
                string script = "alert('" + ex.Message + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            }
            finally
            {
                obj.ConClose();
            }
            Message.IsBodyHtml = true;
            Message.Priority = System.Net.Mail.MailPriority.High;            
            Message.Body = "Dear User </br></br>" + name + "( " + " " + empcodess + " ) " + " " + " <br/><br/> Your " + " Reimbursement For The Month Of " + "  " + DrpLvStatus.SelectedItem.Value + " Has Been Authorized" + "<br/><br/> <br/><br/><br/><b>  </b>   <br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!! ";            
            Message.Subject = "Reimbursement Authorization with ID " + autid.ToString();
            Message.To.Add(EmailTO.ToString());
            if (EmailTO != "")
            {
                Client.Send(Message);
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "hhh", "<script language = javascript>alert('Error Coming.')</script>");
        }

        finally
        {
        }
    }


    public void GetNextRecord()
    {
        string myNextRecordEmployee;
        SqlCommand cmd = new SqlCommand("Jct_Payroll_Employee_Reimburs_Liability_NextRecord", obj.Connection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@YearMonth", SqlDbType.Int).Value = Convert.ToInt32(DrpLvStatus.SelectedItem.Value);
        cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            while (dr.Read())
            {
                myNextRecordEmployee = dr["EmployeeCode"].ToString();
                txtefffrm.Text = myNextRecordEmployee;
            }
        }
        dr.Close();
        obj.Connection().Close();
    }

}