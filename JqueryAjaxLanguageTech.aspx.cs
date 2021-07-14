using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;
using System.Web.Services;

public partial class JqueryAjaxLanguageTech : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Create the object of SqlCommand.
    //A SqlCommand object allows you to query and send commands to a database
    //WebMethod is used for handling following Operation
    //InsertData WebMethod is used to insert data into the tblEmployee Table.
    [WebMethod]
    public static void InsertData(string name, int age, string address, decimal salary , DateTime dob)
    {
        try
        {
            string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
            SqlConnection con = new SqlConnection(qry);
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblEmployee_Insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmpName", name);
            cmd.Parameters.AddWithValue("@EmpAge", age);
            cmd.Parameters.AddWithValue("@EmpAddress", address);
            cmd.Parameters.AddWithValue("@Salary", salary);
            cmd.Parameters.AddWithValue("@Dob", dob);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
        
    }

    //GetEmpData WebMethod is used to fetch data from the tblEmployee Table.

    [WebMethod]
    public static string GetEmpData()
    {
        string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
        SqlConnection con = new SqlConnection(qry);
        con.Open(); 
        string _data = "";
        SqlCommand cmd = new SqlCommand("sp_tblEmployee_Select", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            _data = JsonConvert.SerializeObject(ds.Tables[0]);
        }
        return _data;
    }

    //Edit WebMethod is used to Edit data from tblEmployee Table.

    [WebMethod]
    public static string Edit(int Id)
    {

        string _data = "";
        string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
        SqlConnection con = new SqlConnection(qry);
        con.Open(); 
        SqlCommand cmd = new SqlCommand("sp_tblEmployee_Edit", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@empid", Id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            _data = JsonConvert.SerializeObject(ds.Tables[0]);
        }
        return _data;
    }

    //Update WebMethod accept Id, Name, Address, Age values. Based on this Id update data in the tblEmployee Table.

    [WebMethod]
    public static void Update(int ID, string name, int age, string address,decimal salary , DateTime dob)
    {

        string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
        SqlConnection con = new SqlConnection(qry);
        con.Open(); 
        SqlCommand cmd = new SqlCommand("sp_tblEmployee_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@EmpId", ID);
        cmd.Parameters.AddWithValue("@EmpName", name);
        cmd.Parameters.AddWithValue("@EmpAge", age);
        cmd.Parameters.AddWithValue("@EmpAddress", address);
        cmd.Parameters.AddWithValue("@Salary", salary);
        cmd.Parameters.AddWithValue("@Dob", dob);
        cmd.ExecuteNonQuery();
        con.Close();

    }

    //Delete WebMethod is used to delete data from the tblEmployee Table.


    [WebMethod]
    public static void Delete(int Id)
    {
        string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
        SqlConnection con = new SqlConnection(qry);
        con.Open(); 
        SqlCommand cmd = new SqlCommand("sp_tblEmployee_Dlete", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@EmpId", Id);
        cmd.ExecuteNonQuery();
        con.Close();
    }

}