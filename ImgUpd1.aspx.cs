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

partial class ImgUpd1 : System.Web.UI.Page
//partial class EImgUpd1 : System.Web.UI.Page
{
    Connection obj = new Connection();
    private Functions objfun = new Functions();
    Functions objFun = new Functions();
    string qry;
    string sql;
    SqlConnection con;
    Connection cn;
    string Yearmonthstore;
    string abc;
    string MyPathFound;
    private string cardNo = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack == true)
        //{

            HtmlForm frm = new HtmlForm();
            frm = (HtmlForm)this.Master.FindControl("form1");
            frm.Enctype = "multipart/form-data";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

        //}
        if ((Session["empcode"].ToString() != ""))
        {
        cardNo = getCarDNo();
        //cardNo = (string)objfun.FetchValue("Exec Jct_payrollportal_GHReq_HOD_Validate '" + Session["Empcode"].ToString() + "'").ToString();
        //cardNo = objfun.FetchValue("SELECT CardNo FROM dbo.JCT_payroll_employees_master WHERE NewEmployeeCode= '" + Session["empcode"] + "' AND STATUS='a' AND Active='Y'");
        //Image5.ImageUrl = @"Emp_Images\" + cardNo + ".jpg";
        //Emp_Images//"
       // Image5.ImageUrl = "Emp_Images//" + cardNo + ".jpg";
        //Image5.ImageUrl = "\\Portal New Look2\\Emp_Images\\" + cardNo + ".jpg";

        //Image5.ImageUrl = "\\Portal New Look2\\Emp_Images\\1385.jpg";
       // Image6.ImageUrl = "Emp_Images//1385.jpg";

        //Image6.ImageUrl = "\\Emp_Images\\" + cardNo + ".jpg";

        //Image6.ImageUrl = @"Emp_Images/" + cardNo + ".jpg";
        //@"C:\Personal\MyFolder\MyFile.jpg";


        //lblid.Text = @"Emp_Images/" + cardNo + ".jpg";
        //Label1.Text = "\\EmpPortal\\Upload\\" + Session["empcode"].ToString().Trim() +"\\";
        //Label2.Text = "\\EmpPortal\\Emp_Images\\";
        //Label3.Text = "\\EmpPortal\\Emp_Images\\" + cardNo + ".jpg";

        Image6.ImageUrl = @"aslamtest/" + cardNo + ".jpg";
        //Image6.ImageUrl = "Emp_Images\\" + cardNo + ".jpg"; 
        }        
    }

    public string getCarDNo()
    {
        return cardNo = (string)objfun.FetchValue("SELECT CardNo FROM dbo.JCT_payroll_employees_master WHERE NewEmployeeCode= '" + Session["empcode"] + "' AND STATUS='a' AND Active='Y'").ToString();
    }

    protected void btnUpload_Click(object sender, ImageClickEventArgs e)
    {
        SqlTransaction tran = default(SqlTransaction);
        //try
        //{
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
            for (i = 0; i <= Request.Files.Count - 1; i++)
            {
                HttpPostedFile PostedFile = Request.Files[i];
                string FileName = System.IO.Path.GetFileName(PostedFile.FileName);
                //string filepath = "Emp_Images\\";
                string filepath = "aslamtest\\" + "\\";
                 
                if (!string.IsNullOrEmpty(FileName) & !string.IsNullOrEmpty(filepath))
                {
                    uploadDoc(i);
                }
                else
                {
                    string message = "alert('Please try again .File Uploading not completed.')";
                    ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", message, true);
                }
            }

            string message10 = "alert('File Uploading Completed ')";
            ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", message10, true);
            //Image6.ImageUrl = "\\Emp_Images\\1385.jpg";
            //Image6.ImageUrl = @"Emp_Images/" + cardNo + ".jpg";
           // Image6.ImageUrl = "\\EmpPortal\\Emp_Images\\" + cardNo + ".jpg";
            

        //}
        //catch (Exception ex)
        //{
            if ((Session["empcode"].ToString() != ""))
            {
                //string message = "alert('" + ex.Message + "')";
                //ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", message, true);
            }
            else
            {
                tran.Rollback();
            }
        //}
    }

    protected void uploadDoc(int i)
    {
        //try
        //{
            HttpPostedFile PostedFile = Request.Files[i];
            if (PostedFile.ContentLength > 0)
            {
                string FileName = System.IO.Path.GetFileName(PostedFile.FileName);
                //string filepath = Server.MapPath("Upload\\");                
                //string abc = "Emp_Images\\";
                string abc = "aslamtest\\" + "\\";
                string filepath = Server.MapPath(abc);
                cardNo = getCarDNo() ;
                //PostedFile.SaveAs(filepath + cardNo + ".jpg");
                //PostedFile.SaveAs(filepath + cardNo + ".jpg");
                //PostedFile.SaveAs(filepath + FileName.Replace(" ", "")); 

                //if (FileName != cardNo + ".jpg")
                //{                    
                //    string script = "alert('Invaild File Name. Please Change File Name to Your CardNo like 1385 ');";
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                //    throw new Exception(script);
                //}

                //else
                //{
                    //PostedFile.SaveAs(filepath + FileName.Replace(" ", ""));
                    PostedFile.SaveAs(filepath + cardNo + ".jpg".Replace(" ", ""));
                    //Image6.ImageUrl = @"Emp_Images/" + cardNo + ".jpg";
                    Image6.ImageUrl = "aslamtest\\" + cardNo + ".jpg"; 
                //}
//                Label2.Text = filepath + cardNo;
  //              Label3.Text  = filepath + cardNo + ".jpg";

    //            string cardNo1 = cardNo + ".jpg";
            
            }
        //}
        //catch
        //{
        //    throw new Exception();
        //}
    }

    protected void DropDownList20_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DrpLvStatus_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void lnksave_Click(object sender, EventArgs e)
    {

    }
}