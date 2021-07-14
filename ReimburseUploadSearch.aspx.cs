using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Drawing;
using System.Web.UI.HtmlControls;

public partial class ReimburseUploadSearch : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["misjctdev"].ConnectionString);
    Connection obj = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {             
            Yearmonth();
            //string A, B, c;
            //int D;            
            //D = DTP2.SelectedIndex + 1;
            //A = D.ToString();            
            //B = DTP3.SelectedItem.Text;
            //if (System.Convert.ToInt32(D) < 10)
            //{
            //    A = "0" + A;
            //    c = (B + A);
            //}
            //else
            //    c = (B + A);
            //string CodeYearmonth = Session["empcode"].ToString().Trim() + c.ToString().Trim();
            //BindUploadedDocs(CodeYearmonth);
            //HtmlForm frm = new HtmlForm();
            //frm = (HtmlForm)this.Master.FindControl("form1");
            //frm.Enctype = "multipart/form-data";
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

    public void BindUploadedDocs(string sanctionid)
    {
        string qry = "Jct_Portal_Reimbursement_Doc_Bind_Report";
        SqlCommand cmd = new SqlCommand(qry, obj.Connection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@DocNo", SqlDbType.VarChar, 20).Value = sanctionid;
        cmd.Parameters.Add("@TYPE", SqlDbType.VarChar, 50).Value = DropDownList20.SelectedItem.Value;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        if (dt.Rows.Count == 0)
        {
        string script = "alert('No Record Found');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }
        DataList2.DataSource = null;
        DataList2.DataBind();
        DataList2.DataSource = dt;
        DataList2.DataBind();
    }


    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Download")
        {
            string A, B, c;
            int D;         
            D = DTP2.SelectedIndex + 1;
            A = D.ToString();         
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
    }

    protected void txtEmployee_TextChanged(object sender, EventArgs e)
    {
        //try
        //{
        //    string employeecode = txtEmployee.Text.Split('|')[1].ToString();
        //    txtEmployee.Text = employeecode;
        //}
        //catch (Exception exception)
        //{
        //    txtEmployee.Text = "";
        //    string script = "alert('Please Select Record From List');";
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        //}
    }

    protected void lnkadd_Click(object sender, EventArgs e)
    {
        try
        {
            FetchRecord();
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }
    }

    public void FetchRecord()
    {       
        string A, B, c;
        int D;      
        D = DTP2.SelectedIndex + 1;
        A = D.ToString();      
        B = DTP3.SelectedItem.Text;
        if (System.Convert.ToInt32(D) < 10)
        {
            A = "0" + A;
            c = (B + A);
        }
        else
            c = (B + A);
        string CodeYearmonth = txtEmployee.Text.Trim() + c.ToString().Trim();
        BindUploadedDocs(CodeYearmonth);
        HtmlForm frm = new HtmlForm();
    }

    protected void lnksave_Click(object sender, EventArgs e)
    {
        try
        {
            FetchRecord();
        }
        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
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
        string CodeYearmonth = txtEmployee.Text.Trim().ToString() + c.ToString().Trim();
        BindUploadedDocs(CodeYearmonth);
    }
}