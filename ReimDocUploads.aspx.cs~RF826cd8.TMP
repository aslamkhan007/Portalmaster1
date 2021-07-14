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

public partial class Payroll_ReimDocUploads : System.Web.UI.Page
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
            Reimtype();
            Locationbind();            
            string CodeYearmonth = Session["empcode"].ToString().Trim() + DrpLvStatus.SelectedItem.Value.Trim();
            BindUploadedDocs(CodeYearmonth);
            HtmlForm frm = new HtmlForm();
            frm = (HtmlForm)this.Master.FindControl("form1");
            frm.Enctype = "multipart/form-data";
        }
    }

    public void Locationbind()
    {
        string sql = "Jct_Payroll_Reim_Attendence_LastFourMonth";
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


    public void Reimtype()
    {
        string sql = "JCT_Payroll_Fetch_Reimbursment_Head";
        SqlCommand cmd = new SqlCommand(sql, obj.Connection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandTimeout = 0;
        cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
        cmd.ExecuteNonQuery();
        SqlDataAdapter Da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        Da.Fill(ds);
        DropDownList20.Items.Clear();
        DropDownList20.DataSource = ds;
        DropDownList20.DataTextField = "ComponentName";
        DropDownList20.DataValueField = "ComponentName";
        DropDownList20.DataBind();
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

    protected void btnUpload_Click(object sender, ImageClickEventArgs e)
    {
        SqlTransaction tran = default(SqlTransaction);
        try
        {          
            string CodeYearmonth = "";
            CodeYearmonth = Session["empcode"].ToString().Trim() + DrpLvStatus.SelectedItem.Value.Trim();
            int i = 0;            
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
                if (PostedFile.ContentLength > 2005000)
                {
                    string script20 = "alert('File Size Must Not Exceed 2 MB ');";
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
                //string filepath = "\\Portal New Look2\\Upload\\" + sanctionid + "\\";
                string filepath = "\\EmpPortal\\Upload\\" +  Session["empcode"].ToString().Trim()  +  "\\" + DrpLvStatus.SelectedItem.Value.Trim() + "\\";                                
                SqlCommand cmd10 = new SqlCommand("Jct_Portal_Reimbursement_Doc_ValidationCheck", obj.Connection(), tran);
                //SqlCommand cmd10 = new SqlCommand("Jct_Portal_Reimbursement_Doc_ValidationCheck", obj.Connection());
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
                //string filepath = "\\EmpPortal\\Upload\\" + sanctionid + "\\";               
                string filepath = "\\EmpPortal\\Upload\\" + Session["empcode"].ToString().Trim() + "\\" + DrpLvStatus.SelectedItem.Value.Trim() + "\\";                                
                if (!string.IsNullOrEmpty(FileName) & !string.IsNullOrEmpty(filepath))
                {
                    SqlCommand cmd = new SqlCommand("Jct_Portal_Reimbursement_Doc_Insert", obj.Connection(), tran);
                    //SqlCommand cmd = new SqlCommand("Jct_Portal_Reimbursement_Doc_Insert", obj.Connection());
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
                string filepath = Server.MapPath("Upload\\" + Session["empcode"].ToString().Trim() + "\\" + DrpLvStatus.SelectedItem.Value.Trim() + " ") + "\\";                
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
        cmd.Parameters.Add("@type", SqlDbType.VarChar, 50).Value = DropDownList20.SelectedItem.Value;
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
            string CodeYearmonth = "";
            CodeYearmonth = Session["empcode"].ToString().Trim() + DrpLvStatus.SelectedItem.Value.Trim();
            string filepath = Server.MapPath("Upload\\" + Session["empcode"].ToString().Trim() + "\\" + DrpLvStatus.SelectedItem.Value.Trim() + " ") + "\\";
            string strFileName = "";
            strFileName = e.CommandArgument.ToString();
            Response.Redirect("QutationDownloadFile.aspx?filepath=" + filepath + "&FileName=" + strFileName);
        }

        if (e.CommandName == "Delete")
        {
            ////string CodeYearmonth = "";
            ////string sqlqry3 = "Jct_Payroll_SalaryCal_Attendence_Month";
            ////SqlCommand cmd10 = new SqlCommand(sqlqry3, obj.Connection());
            ////cmd10.CommandType = CommandType.StoredProcedure;
            ////SqlDataReader dr10 = cmd10.ExecuteReader();
            ////if (dr10.HasRows == true)
            ////{
            ////    while (dr10.Read())
            ////    {
            ////        CodeYearmonth = Session["empcode"].ToString() + dr10["ToDate"].ToString();
            ////    }
            ////    dr10.Close();
            ////}

            //string A, B, c;
            //int D;
            //// 'for DTP1 
            //D = DTP2.SelectedIndex + 1;
            //A = D.ToString();
            //// DTP3.SelectedValue = Now.Year.ToString
            //// B = DTP3.SelectedValue
            //B = DTP3.SelectedItem.Text;
            //if (System.Convert.ToInt32(D) < 10)
            //{
            //    A = "0" + A;
            //    c = (B + A);
            //}
            //else
            //    c = (B + A);
            //string CodeYearmonth = Session["empcode"].ToString().Trim() + c.ToString().Trim();
            //string strFileName = "";
            //strFileName = e.CommandArgument.ToString();
            //string filepath = Server.MapPath("Upload\\") + CodeYearmonth + "\\" + strFileName + " ";
            ////Response.Redirect("QutationDownloadFile.aspx?filepath=" + filepath + "&FileName=" + strFileName);

            //if (File.Exists(filepath))
            //{
            //    SqlCommand cmd = new SqlCommand("Jct_Portal_Reimbursement_Doc_Delete", obj.Connection());
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.Add("BaseDocNo", SqlDbType.VarChar, 20).Value = CodeYearmonth;
            //    cmd.Parameters.Add("RefDocFilePath", SqlDbType.VarChar, 2000).Value = filepath;
            //    cmd.Parameters.Add("RefDocActFileName", SqlDbType.VarChar, 500).Value = strFileName.Replace(" ", "");
            //    string[] ext = strFileName.Split('.');
            //    //[PostedFile.FileName.LastIndexOf('.') + 1];
            //    string fileext = ext[ext.Length - 1];
            //    cmd.Parameters.Add("RefDocFileExt", SqlDbType.VarChar, 4).Value = fileext;
            //    cmd.Parameters.Add("UserId", SqlDbType.VarChar, 10).Value = Session["EmpCode"].ToString();
            //    cmd.Parameters.Add("HostId", SqlDbType.VarChar, 50).Value = Request.UserHostName;
            //    cmd.Parameters.Add("TYPE", SqlDbType.VarChar, 50).Value = DropDownList20.SelectedItem.Value;
            //    cmd.ExecuteNonQuery();
            //    File.Delete(filepath);
            //    string script = "alert('File Deleted');";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            //    BindUploadedDocs(CodeYearmonth);
            //}
        }
    }
    protected void DropDownList20_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindUploadedDocs(Session["empcode"].ToString().Trim() + DrpLvStatus.SelectedItem.Value.Trim());
    }
    protected void DrpLvStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindUploadedDocs(Session["empcode"].ToString().Trim() + DrpLvStatus.SelectedItem.Value.Trim());
    }
    protected void lnksave_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ReimburseReq.aspx");
    }
}