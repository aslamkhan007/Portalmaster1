using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class OnlinePFLoanApply : System.Web.UI.Page
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
    string UANNO;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropdownEnableDisable();
            //UANNO = Request.QueryString["UANNO"].ToString();
            UANNO = "100230648460";
            lblUANNo.Text = UANNO;
            SqlCommand cmd = new SqlCommand("Jct_Payroll_PF_EmployeeDetail_Fetch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@Uanno", SqlDbType.VarChar, 15).Value = "100293218287";
            cmd.Parameters.Add("@Uanno", SqlDbType.VarChar, 15).Value = UANNO.ToString();
            con.Open();
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows == true)
            {
                lblEmpname.Text = dr["Name"].ToString();
                lblFatherName.Text = dr["FatherHusbandName"].ToString();
                lblDob.Text = dr["DOB"].ToString();
                lblMobileNo.Text = dr["MobileNo"].ToString();
                lblAddharno.Text = dr["AddharNo"].ToString();
                lblPanNo.Text = dr["PanNo"].ToString();
                lblBankAccountno.Text = dr["AccountNo"].ToString();
                lblIFSCCode.Text = dr["IFSCCode"].ToString();
                lblBankName.Text = dr["Bankname"].ToString();
                lblAddress.Text = dr["BankAddress"].ToString();
                lblCity.Text = dr["BankCity"].ToString();
                lblState.Text = dr["BankState"].ToString();
                lblPFNo.Text = dr["PfNo"].ToString();
                lblDojEPF.Text = dr["DOJEPF"].ToString();
                lblDojEPS.Text = dr["DOJEPS"].ToString();
                lblDOEEPF.Text = dr["DOLEPF"].ToString();
                lblDOEEPS.Text = dr["DOLEPS"].ToString();
                lblLeavingReason.Text = dr["LeavingReason"].ToString();
                lblAddress1.Text = dr["Address1"].ToString();
                lblAddress2.Text = dr["Address2"].ToString();
                lblAddress3.Text = dr["Address3"].ToString();
                lblCityaddress1.Text = dr["City"].ToString();
                lblStateAddress1.Text = dr["State"].ToString();
                lblPinCode.Text = dr["PinCode"].ToString();
            }
            else
            {
                string script = "alert('No Record Found !! ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            }
            dr.Close();
            con.Close();
        }
    }

    protected void lnkapply_Click(object sender, EventArgs e)
    {       
        try
        {
            Int64 ID = 0;
            ID = gencode();
            SqlCommand cmd = new SqlCommand("Jct_Payroll_PF_EmployeeDetail_Apply", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Open();
            cmd.Parameters.Add("@Autoid", SqlDbType.Int).Value = ID; //Convert.ToInt32(ViewState["ID"]);
            cmd.Parameters.Add("@UanNo", SqlDbType.VarChar, 15).Value = lblUANNo.Text.ToString();     
            cmd.Parameters.Add("@LoanType", SqlDbType.VarChar, 25).Value = ddlleave.SelectedItem.Value;

            if (ddlleave.SelectedItem.Value == "Nonrefundable (Advance)")
            {
                cmd.Parameters.Add("@LoanPurposes", SqlDbType.VarChar, 20).Value = dlleavetype.SelectedItem.Value;
            }
            else
            {
                cmd.Parameters.Add("@LoanPurposes", SqlDbType.VarChar, 20).Value = "";
            }

            if (txtAmountApply.Visible == true)
            {
                cmd.Parameters.Add("@RequestAmt", SqlDbType.Decimal, 8).Value = Convert.ToDecimal(txtAmountApply.Text);              
            }
            else
            {
                cmd.Parameters.Add("@RequestAmt", SqlDbType.Decimal, 8).Value = 0;
            }

            cmd.Parameters.Add("@Remarks", SqlDbType.VarChar, 50).Value = txtpurpose.Text;
            //cmd.Parameters.Add("@Hostname", SqlDbType.VarChar, 15).Value = Request.ServerVariables["REMOTE_ADDR"];
            cmd.ExecuteNonQuery();
            //Sendmail(ID);
            string script = "alert('PF Loan Applied Successfully.!! ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            ClearData();
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

    public void ClearData()
    {
        txtpurpose.Text = "";
        txtAmountApply.Text = "";
    }


    private Int64 gencode()
    {
        Int64 ID = 0;
        try
        {
            string str;
            con.Open();
            SqlCommand cmd = new SqlCommand("select max(isnull(Autoid,500)) from Jct_Payroll_OnLine_Request", con);
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
                        //ViewState["ID"] = ViewState["ID"];
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
            var SqlPass = "Jct_Payroll_WorkFlow_Mail_To_Fetch_PFLoan  '" + lblUANNo.Text.ToString() + "','PFLoan'";
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
            //Message.Body = "" + lblEmpname.Text + "," + " " + " " + "has applied for PF Loan" + " " + "For Date " + " " + txtefffrm.Text + " " + "For Rs." + " " + (SadvRequiredAmt.Text) + " " + "Only" + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!!";
            if (ddlleave.Text != "Withdrawal")
            {
                Message.Body = "" + lblEmpname.Text + "," + " " + " " + "has applied for '" + ddlleave.SelectedItem.Value + "'" + " " + "For Rs." + " " + (txtAmountApply.Text) + " " + "Only" + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!!";
            }
            else
            {               
                    Message.Body = "" + lblEmpname.Text + "," + " " + " " + "has applied for '" + ddlleave.SelectedItem.Value + "'" + " "  + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!!";               
            }

            Message.Subject = "Application for '" + ddlleave.SelectedItem.Value + "':- " + ID;
            if (EmailTO != "" & EmailFrom != "" & CheckError == false)
                Client.Send(Message);
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "Por", "<script language = javascript>alert('Salary Advance Applied Successfully.!!.')</script>");
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
        Response.Redirect("login.aspx");
    }
    protected void ddlleave_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropdownEnableDisable();
    }

    public void DropdownEnableDisable()
    {
        if (ddlleave.Text == "Nonrefundable (Advance)")
        {
            dlleavetype.Visible = true;
            Label6.Visible = true;
        }
        else
        {
            dlleavetype.Visible = false;
            Label6.Visible = false;
        }

        if (ddlleave.Text != "Withdrawal")
        {
            txtAmountApply.Visible = true;
            Label1.Visible = true;     
        }
        else
        {
            txtAmountApply.Visible = false;
            Label1.Visible = false;     
        }
    }
}