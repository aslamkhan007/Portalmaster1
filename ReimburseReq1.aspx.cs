using System;
using System.Text;
using Microsoft.VisualBasic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI;
using System.Net.Mail;
using System.Net;
using System.Web.UI.HtmlControls;
using System.Web;
using System.IO;

public partial class ReimburseReq1 : System.Web.UI.Page
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

            //New Code
            Yearmonth();
            string A, B, c;
            int D;
            // 'for DTP1 
            D = DTP2.SelectedIndex + 1;
            A = D.ToString();
            // DTP3.SelectedValue = Now.Year.ToString
            // B = DTP3.SelectedValue
            B = DTP3.SelectedItem.Text;
            if (System.Convert.ToInt32(D) < 10)
            {
                A = "0" + A;
                c = (B + A);
            }
            else
                c = (B + A);
            string CodeYearmonth = Session["empcode"].ToString().Trim() + c.ToString().Trim();
            BindUploadedDocs(CodeYearmonth);
            HtmlForm frm = new HtmlForm();
            frm = (HtmlForm)this.Master.FindControl("form1");
            frm.Enctype = "multipart/form-data";
        }
    }

    public void Yearmonth()
    {
        string Sqlpass = "Jct_Payroll_Reim_Attendence_Month";
        SqlCommand cmd = new SqlCommand(Sqlpass, obj.Connection());
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        if (dr.HasRows == true)
        {
            this.DTP2.SelectedValue = dr[2].ToString();
            DTP3.Text = dr[1].ToString();
        }
        dr.Close();
    }

    protected void btnUpload_Click(object sender, ImageClickEventArgs e)
    {
        SqlTransaction tran = default(SqlTransaction);
        try
        {
            string A, B, c;
            int D;
            // 'for DTP1 
            D = DTP2.SelectedIndex + 1;
            A = D.ToString();
            // DTP3.SelectedValue = Now.Year.ToString
            // B = DTP3.SelectedValue
            B = DTP3.SelectedItem.Text;
            if (System.Convert.ToInt32(D) < 10)
            {
                A = "0" + A;
                c = (B + A);
            }
            else
                c = (B + A);
            string CodeYearmonth = "";
            CodeYearmonth = Session["empcode"].ToString().Trim() + c.ToString().Trim();
            int i = 0;

            //string CodeYearmonth = "";
            //string sqlqry2 = "Jct_Payroll_SalaryCal_Attendence_Month";
            //SqlCommand cmd1 = new SqlCommand(sqlqry2, obj.Connection());
            //cmd1.CommandType = CommandType.StoredProcedure;
            //SqlDataReader dr1 = cmd1.ExecuteReader();
            //if (dr1.HasRows == true)
            //{
            //    while (dr1.Read())
            //    {
            //        CodeYearmonth = Session["empcode"].ToString() + dr1["ToDate"].ToString();
            //    }
            //    dr1.Close();
            //}
            for (i = 0; i <= Request.Files.Count - 1; i++)
            {
                HttpPostedFile PostedFilesk = Request.Files[i];
                if (PostedFilesk.ContentLength == 0)
                {
                    string message = "alert('Empty File OR No File Selected..')";
                    ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", message, true);
                    return;
                }
            }
            
            if (Request.Files.Count == 0)
            {
                string message = "alert('No File Selected For Uploading..')";
                ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", message, true);
                return;
            }

            string sanctionid = CodeYearmonth;
            tran = obj.Connection().BeginTransaction();
            for (i = 0; i <= Request.Files.Count - 1; i++)
            {
                HttpPostedFile PostedFile = Request.Files[i];
                string FileName = System.IO.Path.GetFileName(PostedFile.FileName);
                if (PostedFile.ContentLength > 1000000)
                {
                    string script20 = "alert('File Size Must Not Exceed 1 MB ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script20, true);
                    return;
                }
                FileName = FileName.Replace("#", "");
                FileName = FileName.Replace("@", "");
                FileName = FileName.Replace("$", "");
                FileName = FileName.Replace("&", "");
                FileName = FileName.Replace("^", "");
                FileName = FileName.Replace("%", "");
                FileName = FileName.Replace("..", ".");
                string filepath = "\\Portal New Look2\\Upload\\" + sanctionid + "\\";
                SqlCommand cmd10 = new SqlCommand("Jct_Portal_Reimbursement_Doc_ValidationCheck", obj.Connection(), tran);
                cmd10.CommandType = CommandType.StoredProcedure;
                cmd10.Parameters.Add("BaseDocNo", SqlDbType.VarChar, 20).Value = sanctionid;
                cmd10.Parameters.Add("RefDocFilePath", SqlDbType.VarChar, 2000).Value = filepath;
                cmd10.Parameters.Add("RefDocActFileName", SqlDbType.VarChar, 500).Value = FileName.Replace(" ", "");
                string[] ext = PostedFile.FileName.Split('.');
                //[PostedFile.FileName.LastIndexOf('.') + 1];
                string fileext = ext[ext.Length - 1];
                cmd10.Parameters.Add("RefDocFileExt", SqlDbType.VarChar, 4).Value = fileext;
                cmd10.Parameters.Add("UserId", SqlDbType.VarChar, 10).Value = Session["EmpCode"].ToString();
                cmd10.Parameters.Add("HostId", SqlDbType.VarChar, 50).Value = Request.UserHostName;
                cmd10.Parameters.Add("TYPE", SqlDbType.VarChar, 50).Value = DropDownList20.SelectedItem.Value;
                cmd10.ExecuteNonQuery();
            }
            for (i = 0; i <= Request.Files.Count - 1; i++)
            {
                HttpPostedFile PostedFile = Request.Files[i];
                string FileName = System.IO.Path.GetFileName(PostedFile.FileName);
                FileName = FileName.Replace("#", "");
                FileName = FileName.Replace("@", "");
                FileName = FileName.Replace("$", "");
                FileName = FileName.Replace("&", "");
                FileName = FileName.Replace("^", "");
                FileName = FileName.Replace("%", "");
                FileName = FileName.Replace("..", ".");
                string filepath = "\\Portal New Look2\\Upload\\" + sanctionid + "\\";
                if (!string.IsNullOrEmpty(FileName) & !string.IsNullOrEmpty(filepath))
                {
                    SqlCommand cmd = new SqlCommand("Jct_Portal_Reimbursement_Doc_Insert", obj.Connection(), tran);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("BaseDocNo", SqlDbType.VarChar, 20).Value = sanctionid;
                    cmd.Parameters.Add("RefDocFilePath", SqlDbType.VarChar, 2000).Value = filepath;
                    cmd.Parameters.Add("RefDocActFileName", SqlDbType.VarChar, 500).Value = FileName.Replace(" ", "");
                    string[] ext = PostedFile.FileName.Split('.');
                    //[PostedFile.FileName.LastIndexOf('.') + 1];
                    string fileext = ext[ext.Length - 1];
                    cmd.Parameters.Add("RefDocFileExt", SqlDbType.VarChar, 4).Value = fileext;
                    cmd.Parameters.Add("UserId", SqlDbType.VarChar, 10).Value = Session["EmpCode"].ToString();
                    cmd.Parameters.Add("HostId", SqlDbType.VarChar, 50).Value = Request.UserHostName;
                    cmd.Parameters.Add("TYPE", SqlDbType.VarChar, 50).Value = DropDownList20.SelectedItem.Value;
                    cmd.ExecuteNonQuery();
                    uploadDoc(i, sanctionid);
                }
                else
                {
                    string message = "alert('Please try again .File Uploading not completed.')";
                    ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", message, true);
                }
            }
            tran.Commit();
            BindUploadedDocs(sanctionid);
            string message10 = "alert('File Uploading Completed ')";
            ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", message10, true);
        }

        catch (Exception ex)
        {
            if (ViewState["SanctionID"] == null)
            {
                string message = "alert('" + ex.Message + "')";
                ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", message, true);
            }
            else
            {
                tran.Rollback();
            }
        }
    }

    protected void uploadDoc(int i, string Sanctionid)
    {
        try
        {
            HttpPostedFile PostedFile = Request.Files[i];
            if (PostedFile.ContentLength > 0)
            {
                string FileName = System.IO.Path.GetFileName(PostedFile.FileName);
                string filepath = Server.MapPath("Upload\\") + Sanctionid + "\\";
                //PostedFile.SaveAs(Server.MapPath(filepath));
                if (!Directory.Exists(filepath))
                {
                    Directory.CreateDirectory(filepath);
                }
                FileName = FileName.Replace("#", "");
                FileName = FileName.Replace("@", "");
                FileName = FileName.Replace("$", "");
                FileName = FileName.Replace("&", "");
                FileName = FileName.Replace("^", "");
                FileName = FileName.Replace("%", "");
                FileName = FileName.Replace("..", ".");
                PostedFile.SaveAs(filepath + FileName.Replace(" ", ""));
                //}
            }
        }
        catch
        {
            throw new Exception();
        }
    }

    public void BindUploadedDocs(string sanctionid)
    {
        qry = "Jct_Portal_Reimbursement_Doc_Bind";
        SqlCommand cmd = new SqlCommand(qry, obj.Connection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@DocNo", SqlDbType.VarChar, 20).Value = sanctionid;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        DataList2.DataSource = null;
        DataList2.DataBind();
        DataList2.DataSource = dt;
        DataList2.DataBind();
    }


    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Download")
        {
            //string CodeYearmonth = "";
            //string sqlqry3 = "Jct_Payroll_SalaryCal_Attendence_Month";
            //SqlCommand cmd10 = new SqlCommand(sqlqry3, obj.Connection());
            //cmd10.CommandType = CommandType.StoredProcedure;
            //SqlDataReader dr10 = cmd10.ExecuteReader();
            //if (dr10.HasRows == true)
            //{
            //    while (dr10.Read())
            //    {
            //        CodeYearmonth = Session["empcode"].ToString() + dr10["ToDate"].ToString();
            //    }
            //    dr10.Close();
            //}

            string A, B, c;
            int D;
            // 'for DTP1 
            D = DTP2.SelectedIndex + 1;
            A = D.ToString();
            // DTP3.SelectedValue = Now.Year.ToString
            // B = DTP3.SelectedValue
            B = DTP3.SelectedItem.Text;
            if (System.Convert.ToInt32(D) < 10)
            {
                A = "0" + A;
                c = (B + A);
            }
            else
                c = (B + A);
            string CodeYearmonth = Session["empcode"].ToString().Trim() + c.ToString().Trim();

            string filepath = Server.MapPath("Upload\\") + CodeYearmonth + "\\";
            string strFileName = "";
            strFileName = e.CommandArgument.ToString();
            Response.Redirect("QutationDownloadFile.aspx?filepath=" + filepath + "&FileName=" + strFileName);
        }

        if (e.CommandName == "Delete")
        {
            //string CodeYearmonth = "";
            //string sqlqry3 = "Jct_Payroll_SalaryCal_Attendence_Month";
            //SqlCommand cmd10 = new SqlCommand(sqlqry3, obj.Connection());
            //cmd10.CommandType = CommandType.StoredProcedure;
            //SqlDataReader dr10 = cmd10.ExecuteReader();
            //if (dr10.HasRows == true)
            //{
            //    while (dr10.Read())
            //    {
            //        CodeYearmonth = Session["empcode"].ToString() + dr10["ToDate"].ToString();
            //    }
            //    dr10.Close();
            //}

            string A, B, c;
            int D;
            // 'for DTP1 
            D = DTP2.SelectedIndex + 1;
            A = D.ToString();
            // DTP3.SelectedValue = Now.Year.ToString
            // B = DTP3.SelectedValue
            B = DTP3.SelectedItem.Text;
            if (System.Convert.ToInt32(D) < 10)
            {
                A = "0" + A;
                c = (B + A);
            }
            else
                c = (B + A);
            string CodeYearmonth = Session["empcode"].ToString().Trim() + c.ToString().Trim();
            string strFileName = "";
            strFileName = e.CommandArgument.ToString();
            string filepath = Server.MapPath("Upload\\") + CodeYearmonth + "\\" + strFileName + " ";
            //Response.Redirect("QutationDownloadFile.aspx?filepath=" + filepath + "&FileName=" + strFileName);
            if (File.Exists(filepath))
            {
                SqlCommand cmd = new SqlCommand("Jct_Portal_Reimbursement_Doc_Delete", obj.Connection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("BaseDocNo", SqlDbType.VarChar, 20).Value = CodeYearmonth;
                cmd.Parameters.Add("RefDocFilePath", SqlDbType.VarChar, 2000).Value = filepath;
                cmd.Parameters.Add("RefDocActFileName", SqlDbType.VarChar, 500).Value = strFileName.Replace(" ", "");
                string[] ext = strFileName.Split('.');
                //[PostedFile.FileName.LastIndexOf('.') + 1];
                string fileext = ext[ext.Length - 1];
                cmd.Parameters.Add("RefDocFileExt", SqlDbType.VarChar, 4).Value = fileext;
                cmd.Parameters.Add("UserId", SqlDbType.VarChar, 10).Value = Session["EmpCode"].ToString();
                cmd.Parameters.Add("HostId", SqlDbType.VarChar, 50).Value = Request.UserHostName;
                cmd.Parameters.Add("TYPE", SqlDbType.VarChar, 50).Value = DropDownList20.SelectedItem.Value;
                cmd.ExecuteNonQuery();
                File.Delete(filepath);
                string script = "alert('File Deleted');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                BindUploadedDocs(CodeYearmonth);
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

    protected void DropdownOnSelectedIndexChanged(object sender, EventArgs e)
    {             
        string A, B, c;
        int D;
        // 'for DTP1 
        D = DTP2.SelectedIndex + 1;
        A = D.ToString();
        // DTP3.SelectedValue = Now.Year.ToString
        // B = DTP3.SelectedValue
        B = DTP3.SelectedItem.Text;
        if (System.Convert.ToInt32(D) < 10)
        {
            A = "0" + A;
            c = (B + A);
        }
        else
            c = (B + A);
        string CodeYearmonth = Session["empcode"].ToString().Trim() + c.ToString().Trim();
        BindUploadedDocs(CodeYearmonth);
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
                    string script = "alert('Reimbursements Applied Successfully');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                    //Sendmail();
                    //Sendmail(OvertimeDt);
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
            var SqlPass = "Exec Jct_Payroll_WorkFlow_Mail_To_Fetch_tesing  '" + Session["EmpCode"] + "' , 'Reimbursements' ";
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
            Message.Body = "" + lblEmpname.Text + "," + " " + " " + "With EmployeeCode" + " " + " " + Session["EmpCode"] + " " + " " + "has applied for ConvReim Reimbursement For The Month Of " + "  " + a.ToString() + " " + "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated Payroll Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!! " + EmailTO;
            //Message.Subject = "Application for  Reimbursement  :- " + Convert.ToInt32(ViewState["ID"]) + EmailTO.ToString();
            //Message.To.Add("rajan@jctltd.com");
            Message.Subject = "Application for  Reimbursement  :- " + printgencode;
            Message.To.Add(EmailTO.ToString());
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
        Response.Redirect("Jct_Payroll_Conveyance_Voucher_Print.aspx?empcode=" + Session["EmpCode"]);
    }

}
