using System;
using System.Text;
using Microsoft.VisualBasic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI;
using System.Net.Mail;
using System.Net;

public partial class PlEncash : System.Web.UI.Page
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
    bool CheckError = false;
    bool CheckRecord = false;
    bool CheckDate = false;
    public int printgencode = 0;

    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!IsPostBack)
        {
            MyTasks();
        }
    }

    public void MyTasks()
    {
        try
        {
            FetchRecordPending();
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            DisableControls();
        }
    }

    public void FetchRecordPending()
    {
        //EnableControls();
        //string SqlPass = null;
        //SqlCommand Cmd = new SqlCommand();
        //SqlPass = "JCT_Payroll_LeaveEncashment_Fetch";
        //Cmd = new SqlCommand(SqlPass, obj.Connection());
        //Cmd.CommandType = CommandType.StoredProcedure;
        ////Cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
        //Cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "9000000334";        
        ////Cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "R-03339";
        //SqlDataAdapter Da = new SqlDataAdapter(Cmd);
        //DataSet ds = new DataSet();
        //Da.Fill(ds);

        //if (ds.Tables.Count == 0)
        //{            
        //    string script = "alert('No Record Found');";
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        //    return;
        //}
        //else
        //{      
        //}

        SqlCommand cmd = new SqlCommand("JCT_Payroll_LeaveEncashment_Fetch", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["Empcode"];
        //cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "9000000334";                      
        con.Open();
        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        dr.Read();
        if (dr.HasRows == true)
        {

            lblYearmonth.Text = dr["Year"].ToString();
            lblEmployeeName.Text = dr["Name"].ToString();
            lblEmployeeCode.Text = Session["Empcode"].ToString();
            lblDepartment.Text = dr["Department"].ToString();
            lblDesignation.Text = dr["Desigantion"].ToString();
            lblBankAccount.Text = dr["AccountNo"].ToString();
            lblBankName.Text = dr["Bankname"].ToString();

            lblPLBalance.Text = dr["PLBalance"].ToString();
            lblLastEncashment.Text = dr["PreviousEncasmentDate"].ToString();
            lblEncashmentDays.Text = dr["EncashDays"].ToString();

        }
        else
        {
            string script = "alert('You are not allowed to Apply PL Encashment!! ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }
        dr.Close();
        con.Close();
    }

    protected void DrpLvStatus_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        MyTasks();
    }

    public void DisableControls()
    {
        lnkapply.Enabled = false;
    }

    public void EnableControls()
    {
        lnkapply.Enabled = true;
    }


    protected void lnkapply_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("JCT_Payroll_LeaveEncashment_Apply", obj.Connection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //con.Open();
            //cmd.Parameters.Add("@year_month", SqlDbType.VarChar, 10).Value = Convert.ToInt32(OvertimeDt);
            cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["Empcode"];
            //cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "9000000334";
            cmd.Parameters.Add("@autoid", SqlDbType.Int).Value = gencode();

            //cmd.Parameters.Add("@EnterPersonName", SqlDbType.VarChar, 30).Value = txtEntpername1.Text;
            //cmd.Parameters.Add("@PersonCompanyName", SqlDbType.VarChar, 30).Value = txtpercomname1.Text;
            //cmd.Parameters.Add("@PersonDesignation", SqlDbType.VarChar, 30).Value = txtperdesg1.Text;
            //cmd.Parameters.Add("@PlaceofEnter", SqlDbType.VarChar, 30).Value = txtplaceenter1.Text;
            //cmd.Parameters.Add("@remarks", SqlDbType.VarChar, 50).Value = txtpurpose1.Text;
            //cmd.Parameters.Add("@DriverName", SqlDbType.VarChar, 25).Value = txtDriverName1.Text;
            cmd.ExecuteNonQuery();
            Sendmail();   
            //con.Close();

            string script = "alert('Leave Encashment Applied Successfully.!! ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            return;
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }
    }

    public void Sendmail()
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
            var SqlPass = "Exec Jct_Payroll_WorkFlow_Mail_To_Fetch  '" + Session["EmpCode"] + "' , 'LeaveEncashment' ";
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
                            //EmailTO = "aslam@jctltd.com";
                            //Message.CC.Add(ViewState["EmployeeFrom"].ToString());
                            //Message.CC.Add("rajan@jctltd.com");
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
            Message.Body = "" + lblEmployeeName.Text + "," + " " + " " + "With EmployeeCode" + " " + " " + Session["EmpCode"] + " " + " " + "has applied for LeaveEncashment" + " " + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!! " + EmailTO;
            //Message.Subject = "Application for  Reimbursement  :- " + Convert.ToInt32(ViewState["ID"]) + EmailTO.ToString();
            //Message.To.Add("rajan@jctltd.com");

            Message.Subject = "Application for  LeaveEncashment  :- " + printgencode;
            Message.To.Add(EmailTO.ToString());

            if (EmailTO != "" & EmailFrom != "" & CheckError == false)
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

    private int gencode()
    {
        try
        {
            int gencode;
            gencode = 0;
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT  MAX(autoid ) FROM  Jct_Payroll_OnLine_Request (nolock)", con);
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

    protected void lnkreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("PlEncash.aspx");
    }
}
