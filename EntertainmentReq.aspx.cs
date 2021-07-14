using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
    
public partial class EntertainmentReq : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["misjctdev"].ConnectionString);
    Connection obj = new Connection();
    string strTo;
    string strFrom;
    string strSubject;
    string SqlPass;
    string Sqlpass1;
    string EmailTO, EmailTO1, EmailFrom, EmailCc, EmailBcc, EmailBcc1, Checkflag, Checkflag1;
    bool CheckError = false;
    bool CheckRecord = false;
    bool CheckDate = false;
    Int64 Auto1;
    int Difference;
    int CountMail = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)

            if (Session["Empcode"] == "")
            {
                Response.Redirect("~/Login.aspx");
            }
    }
    
    protected void lnkapply_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Jct_Payroll_Portal_Entertainment_Apply", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Open();
            cmd.Parameters.Add("@Empcode", SqlDbType.VarChar, 10).Value = Session["Empcode"];
            cmd.Parameters.Add("@YearMonth", SqlDbType.Int).Value = txtyearmnth.Text;
            cmd.Parameters.Add("@EntPerName", SqlDbType.VarChar, 30).Value = txtname.Text;
            cmd.Parameters.Add("@EntCoName", SqlDbType.VarChar, 30).Value = txtGross.Text;
            cmd.Parameters.Add("@PerDesg", SqlDbType.VarChar, 25).Value = txtdesi.Text;
            cmd.Parameters.Add("@EntPlace", SqlDbType.VarChar, 20).Value = placeEntertain.Text;
            cmd.Parameters.Add("@Amount", SqlDbType.Decimal, 6).Value = SadvRequiredAmt.Text;
            cmd.Parameters.Add("@remarks", SqlDbType.VarChar, 50).Value = txtpurpose.Text;
            //cmd.Parameters.Add("@Hostname", SqlDbType.VarChar, 15).Value = Request.ServerVariables["REMOTE_ADDR"];
            cmd.ExecuteNonQuery();
            Sendmail();
            string script = "alert('Entertainment Applied Successfully.!! ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }

        finally
        {
            con.Close();
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
            var SqlPass = "Jct_Payroll_SalaryAdvance_MailTo     '" + Session["EmpCode"] + "'";
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
                            Message.CC.Add("ashish@jctltd.com");
                            //Message.To.Add(EmailTO);
                            Message.Bcc.Add("aslam@jctltd.com");
                        }
                    }
                    Dr.Close();
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                obj.ConClose();
            }
            Message.IsBodyHtml = true;
            Message.Priority = System.Net.Mail.MailPriority.High;
            //Message.Body = "" + txtemp.Text + "," + " " + " " + "has applied for Compensatory Leave" + " " + "For Date " + " " + txtdate.Text + " " + "for" + " " + (txtdays.Text) + " " + "day" + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!!";
            Message.Body = "" + txtname.Text + "," + " " + " " + "has applied for Entertainment Reimbursement" + " " + "For Rs." + " " + (SadvRequiredAmt.Text) + " " + "Only" + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!!";
            Message.Subject = "Application for Entertainment Reimbursement :- " + Convert.ToInt32(ViewState["ID"]) + EmailTO.ToString();

            if (EmailTO != "" & EmailFrom != "" & CheckError == false)
            {
                //Client.Send(Message);
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

    protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void lnkreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("EntertainmentReq.aspx");
    }
}