using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class LTC : System.Web.UI.Page
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
        if (Session["Empcode"].ToString() == "")
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            DisComp();
            try
            {
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand("JCT_Payroll_Ltc_Fetch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["Empcode"];
                //cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "9000000334";                      
                con.Open();
                dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows == true)
                {
                    lblSapCode.Text = dr[1].ToString();
                    lblCostCenter.Text = dr[2].ToString();
                    lblEmpname.Text = dr[3].ToString();
                    lblDept.Text = dr[4].ToString();
                    lbldesig.Text = dr[5].ToString();
                    lblGross.Text = dr[6].ToString();
                    SadvRequiredAmt.Text = dr[7].ToString();
                    //txtefffrm.Text = dr[3].ToString();
                    //txtLeaveToDate.Text = dr[3].ToString();
                    //SadvRequiredAmt.Text = dr[3].ToString();
                    //txtpurpose.Text = dr[3].ToString();
                    
                } dr.Close();
                
            }
            catch (Exception ex)
            {
                string script = "alert('" + ex.Message + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                lnkapply.Enabled = false;
                Panel1.Visible = false;
            }
            con.Close();
        }
    }

    private Int64 gencode()
    {
        Int64 ID = 0;
        try
        {
            string str;

            con.Open();
            SqlCommand cmd = new SqlCommand("select max(isnull(Autoid,1010000)) from Jct_Payroll_OnLine_Request", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                {
                    str = dr[0].ToString();
                    if (string.IsNullOrEmpty(dr[0].ToString()))
                    {
                        string script = "alert('Something Went Wrong !! ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                    }
                    else
                    {
                        ID = int.Parse(dr[0].ToString()) + 1;                        
                    }
                }
            }
            dr.Close();
            return ID;
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            ID = 501;
            return ID;
        }
        finally
        {
            con.Close();
        }
    }

    protected void lnkapply_Click(object sender, EventArgs e)
    {
        Int64 ID = 0;
        try
        {            
            //if (Convert.ToDecimal(lblGross.Text) < Convert.ToDecimal(SadvRequiredAmt.Text) || Convert.ToDecimal(SadvRequiredAmt.Text) <= Convert.ToDecimal(0.00))
            //{
            //    string script11 = "alert('Advance Amount Should be less than Maximum Drawn Salary & Should be a Valid Number!! ');";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script11, true);
            //    return;
            //}

            ID = gencode();
            SqlCommand cmd = new SqlCommand("JCT_Payroll_Ltc_Apply", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Open();
            //cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "9000000334";

            cmd.Parameters.Add("@Type", SqlDbType.VarChar, 10).Value = ddlleave.SelectedItem.Text;
            cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["Empcode"];
            //cmd.Parameters.Add("@autoid", SqlDbType.Int).Value = ID; //Convert.ToInt32(ViewState["ID"]);
            cmd.Parameters.Add("@autoid", SqlDbType.Int).Value = 1;

            if (txtefffrm.Enabled == true)
            {
                cmd.Parameters.Add("@efffrmDt", SqlDbType.DateTime).Value = txtefffrm.Text;
            }
            if (txtLeaveToDate.Enabled  == true)
            {
                cmd.Parameters.Add("@effToDt", SqlDbType.DateTime).Value = txtLeaveToDate.Text; ;
            }            
            //cmd.Parameters.Add("@LtaAmt", SqlDbType.Decimal, 6).Value = SadvRequiredAmt.Text;
            cmd.Parameters.Add("@remarks", SqlDbType.VarChar, 50).Value = txtpurpose.Text;
            cmd.Parameters.Add("@Hostname", SqlDbType.VarChar, 15).Value = Request.ServerVariables["REMOTE_ADDR"];
            cmd.ExecuteNonQuery();
            Sendmail(ID);
            //Sendmail(0);
            string script = "alert('LTA/LTC Applied Successfully.!! ');";
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

    public void Sendmail(Int64 ID)
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
            var SqlPass = "Jct_Payroll_WorkFlow_Mail_To_Fetch  '" + Session["EmpCode"] + "','" + ddlleave.SelectedItem.Text + "' ";
            SqlDataReader Dr = obj.FetchReader(SqlPass);
            try
            {
                if (Dr.HasRows == true)
                {
                    Dr.Read();
                    {
                        if (Dr != null && Dr.HasRows)
                        {
                            //EmailTO = Dr["EmailID"].ToString();
                            //EmailTO = Dr["EmailID"].ToString();
                            EmailTO = "aslam@jctltd.com";
                            //Message.CC.Add(ViewState["EmployeeFrom"].ToString());
                            Message.CC.Add("rajan@jctltd.com");
                            Message.To.Add(EmailTO);
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
            //Message.Body = "" + txtemp.Text + "," + " " + " " + "has applied for Compensatory Leave" + " " + "For Date " + " " + txtdate.Text + " " + "for" + " " + (txtdays.Text) + " " + "day" + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!!";

            if (ddlleave.SelectedItem.Text=="LTA")
            { 
            Message.Body = "" + lblEmpname.Text + "," + " " + " " + "has applied for " + "" + ddlleave.SelectedItem.Text + " " + " " + "From Date " + " " + txtefffrm.Text + " " + "To Date " + " " + txtLeaveToDate.Text + " " + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!!";
            }
            if (ddlleave.SelectedItem.Text == "LTC")
            {
                Message.Body = "" + lblEmpname.Text + "," + " " + " " + "has applied for " + "" + ddlleave.SelectedItem.Text + " " + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!!";
            }
            
            Message.Subject = "Application for LTA/LTC :- " + ID;

            if (EmailTO != "" & EmailFrom != "" & CheckError == false)
            { 
                Int64 a = 0;
               Client.Send(Message);            
            }                              
        }
        catch (Exception ex)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Exception", "<script language = javascript>alert('Error Coming.')</script>");
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
        Response.Redirect("LTC.aspx");
    }
    protected void ddlleave_SelectedIndexChanged(object sender, EventArgs e)
    {
        DisComp();
    }

    public void DisComp()
    {
        if (ddlleave.Text == "LTA")
        {
            Label1.Enabled = true;
            Label2.Enabled = true;
            txtefffrm.Enabled = true;
            txtLeaveToDate.Enabled = true;
            RequiredFieldValidator2.Enabled = true;
            RequiredFieldValidator3.Enabled = true;
        }
        else if (ddlleave.Text == "LTC")
        {
            Label1.Enabled = false;
            Label2.Enabled = false;
            txtefffrm.Enabled = false;
            txtLeaveToDate.Enabled = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            txtefffrm.Text = "";
            txtLeaveToDate.Text = "";
        }
    }

}