using System;
using System.Text;
using Microsoft.VisualBasic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI;
using System.Net.Mail;
using System.Net;

public partial class ReimburseReq : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["misjctdev"].ConnectionString);    
    Connection obj = new Connection();
    string EmailTO, EmailTO1, EmailFrom, EmailCc, EmailBcc, EmailBcc1, Checkflag, Checkflag1;
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
    public int printgencode = 0;
    bool CheckError = false;
    bool CheckRecord = false;
    bool CheckDate = false;
    int CheckEligile = 0;

    protected void Page_Load(object sender, System.EventArgs e)
    {
       
if (!IsPostBack)
        {
            CheckEligibility();
            SqlCommand cmd = new SqlCommand("Jct_Payroll_ReimburseReq_EmployeeInfo_Entitlement_Fetch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["Empcode"];
            //cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "9000000537";                      
            con.Open();
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows == true)
            {
                lblEmpname.Text = dr[2].ToString();
                lblDept.Text = dr[1].ToString();
                lbldesig.Text = dr[0].ToString();
                lblEligible.Text = dr[3].ToString();

            }
            else
            {
                string script = "alert('You are not allowed to Apply Reimbursement!! ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            }
            dr.Close();
            con.Close();            
            //this.PnlExtTasks.Collapsed = true;
           if (lblEligible.Text.ToLower() != "notentitled")
            { 
            MyTasks();
            }
           else
            {
                string script = "alert('You are not Entitled for submission of this request!! ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                DisableControls();
            }
        }
    }

    public void CheckEligibility()
    {
        try
        {
            string sql = "Jct_Payroll_reimbursement_Req_Disablebuttons";
            SqlCommand cmd = new SqlCommand(sql, obj.Connection());
            cmd.CommandType = CommandType.StoredProcedure;            
            cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["Empcode"];
            //cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "9000000443";                
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                }
            }
            dr.Close();
        }
        catch (Exception ex)
        {
            CheckEligile = 1;
            DisableControlsTwo();
            //string Scrpt = "alert('" + ex.Message + "');";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", Scrpt, true);
        }
    }

    public void MyTasks()
    {
        FetchRecordPending();
    }

    public void FetchRecordPending()
    {
        EnableControls();
        string SqlPass = null;
        SqlCommand Cmd = new SqlCommand();
        SqlPass = "Jct_Payroll_Portal_Conveyance_Fetch";
        Cmd = new SqlCommand(SqlPass, obj.Connection());
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
        //Cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "9000000047";        
        //Cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "R-03339";
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


    protected void DrpLvStatus_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        MyTasks();
    }

    public void DisableControls()
    {
        lnkConfirmAll.Enabled = false;        
    }


    public void DisableControlsTwo()
    {
        lnkAddreim.Enabled = false;
        lnkPrint.Enabled = false;
    }

    public void EnableControls()
    {
        lnkConfirmAll.Enabled = true;        
    }

    protected void lnkConfirmAll_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow gvRow in GridExtTask.Rows)
            {
                string OvertimeDt = string.Empty;
                CheckBox chkRemove = (CheckBox)gvRow.FindControl("chkCheck");
                if (chkRemove.Checked == true)
                {                 
                    int rowIndex = (int)gvRow.RowIndex;
                    OvertimeDt = gvRow.Cells[1].Text.Replace("&nbsp;", "");
                    string sql = "Jct_Payroll_Portal_Conveyance_Apply";
                    SqlCommand cmd = new SqlCommand(sql, obj.Connection());
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@autoid", SqlDbType.Int).Value = gencode();
                    cmd.Parameters.Add("@Empcode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
                    cmd.Parameters.Add("@YearMonth", SqlDbType.Char).Value = OvertimeDt;                    
                    cmd.ExecuteNonQuery();
            
                    //Sendmail();
					Sendmail(OvertimeDt);


                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "lbviewmore_click();", true);
                    string script = "alert('Reimbursements Applied Successfully');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);

                }
            }
            MyTasks();
            
            return;
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }
    }

    private int gencode()
    {
        try
        {
            int gencode;
            gencode = 0;
            con.Open();
            SqlCommand cmd = new SqlCommand("select max(isnull(Autoid,1000000)) from Jct_Payroll_OnLine_Request (nolock)", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    gencode = int.Parse(dr[0].ToString());
                  
                    if (string.IsNullOrEmpty(dr[0].ToString()))
                    {
                        string script = "alert('Something Went Wrong !! ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                    }
                    else
                    {
                        gencode = int.Parse(dr[0].ToString()) + 1;
                        printgencode = gencode;
                      
                    }
                }

            }
            dr.Close();
            return gencode;
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            return 0;
        }

        finally
        {
            con.Close();
        }
    }

    protected void ChkOrderSelAll_CheckedChanged(object sender, EventArgs e)
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

    
    protected void lnkReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReimburseReq.aspx");
    }


    //public void Sendmail()
	public void Sendmail(string a)
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
            var SqlPass = "Exec Jct_Payroll_WorkFlow_Mail_To_Fetch  '" + Session["EmpCode"] + "' , 'Reimbursements' ";
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
                            //Message.CC.Add(ViewState["EmployeeFrom"].ToString());
                            Message.CC.Add("rajan@jctltd.com");
                            //Message.To.Add(EmailTO);
                            Message.Bcc.Add("aslam@jctltd.com");
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
            //Message.Body = "" + lblEmpname.Text + "," + " " + " " + "With EmployeeCode" + " " + " " + Session["EmpCode"]  +   " " + " " + "has applied for ConvReim Reimbursement" + " " + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!! " + EmailTO;
			Message.Body = "" + lblEmpname.Text + "," + " " + " " + "With EmployeeCode" + " " + " " + Session["EmpCode"]  +   " " + " " + "has applied for ConvReim Reimbursement For The Month Of " + "  "  +a.ToString()    + " " + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!! " + EmailTO;
            //Message.Subject = "Application for  Reimbursement  :- " + Convert.ToInt32(ViewState["ID"]) + EmailTO.ToString();
            //Message.To.Add("rajan@jctltd.com");

            Message.Subject = "Application for  Reimbursement  :- " + printgencode;
            if (EmailTO.Contains(","))
            {
                string[] tos = EmailTO.Split(',');
                for (int i = 0; i <= tos.Length - 1; i++)
                {
                    Message.To.Add(new MailAddress(tos[i]));
                }
            }
            else
            {
                Message.To.Add(new MailAddress(EmailTO));
            }

            //Message.To.Add(EmailTO.ToString());


            if (EmailTO != "" & EmailFrom != "" & CheckError == false)
            {
                Client.Send(Message);
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "Por", "<script language = javascript>alert('Salary Advance Applied Successfully.!!.')</script>");
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
        //Response.Write(myPageHTML);
        return myPageHTML;
    }

    protected void lnkAddreim_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReimbursementAddDetail.aspx");
    }
    protected void lnkPrint_Click(object sender, EventArgs e)
    {        
        //Response.Redirect("Jct_Payroll_Conveyance_Voucher_Print.aspx?YEARMONTH=" + txttodate.Text + "&empcode=" + txtEmployee.Text);
        Response.Redirect("Jct_Payroll_Conveyance_Voucher_Print.aspx?empcode=" + Session["EmpCode"]);
    }
    //protected void lnkReport_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("LiabilityReport.aspx");
    //}
    protected void lnkUPloaddoc_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReimDocUploads.aspx");
    }
}
