using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security;
using System.Text;
using System.Threading;
using Microsoft.VisualBasic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web;
using System.Web.Caching;

public partial class OnlinePFApplyValidate : System.Web.UI.Page
{
    private Connection Obj = new Connection();
    private Functions objFun = new Functions();
    private string SqlPass;
    private string empcode;    
    private DataTable Dt_EmpData;

    protected void Page_Load(object sender, System.EventArgs e)
    {                
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
        Response.AppendHeader("Pragma", "no-cache");
    }

    protected void lnksave_Click(object sender, System.EventArgs e)
    {
        GetData();
    }

    private void GetData()
    {
        try
        {
            string sql = "Jct_Payroll_OnlinePF_ValidateFetch";
            SqlCommand cmd = new SqlCommand(sql, Obj.Connection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UanNo", SqlDbType.VarChar, 15).Value = txtUANNO.Text.ToString();
            cmd.Parameters.Add("@Pass", SqlDbType.VarChar, 12).Value = TextBox1.Text.ToString();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    dr.Close();
                    Response.Redirect("OnlinePFLoanApply.aspx?UANNO=" + txtUANNO.Text);
                }
            }
            else
            {
                dr.Close();               
                string script = "alert('Credentials is Incorrect.!!');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            }
        }
        catch (Exception ex)
        {
            string script = "alert(''" + ex.Message + "'');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        } 
    }    
}


