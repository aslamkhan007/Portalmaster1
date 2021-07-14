using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class AjaxCrud : System.Web.UI.Page
{
    Connection obj = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public class Employee
    {
        //public Employee()
        //{
        //
        // TODO: Add constructor logic here
        //

        public int EmpId;
        public string FName;
        public string LName;
        public string MName;
        public string Email;
        public DateTime Dob;
        public string MaritalStatus;
        public string Hobbies;
        public string HomeMobile;
        public string OfficeMobile;
        public string Address;
        public string Pincode;
        public string State;
        public string Nationality;
        public DateTime Doj;
        public DateTime CreatedDateTime;
        public DateTime ModifiedDateTime;
        //}
    }




    [WebMethod]
    public static void SaveUser(Employee objEmployee) //Insert data in database  
    {

        try
        {
            string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
            SqlConnection con = new SqlConnection(qry);
            con.Open();

            string sql1 = "TblUser_Insert";
            SqlCommand cmd1 = new SqlCommand(sql1, con);

            cmd1.CommandType = CommandType.StoredProcedure;

            cmd1.Parameters.Add("@Fname", SqlDbType.VarChar, 10).Value = objEmployee.FName;
            cmd1.Parameters.Add("@Mname", SqlDbType.VarChar, 10).Value = objEmployee.MName;
            cmd1.ExecuteNonQuery();
            con.Close();

            //SqlCommand Cmd = new SqlCommand();
            //string  SqlPass = "Jct_Payroll_Leave_Authorisation";
            //Cmd = new SqlCommand(SqlPass, obj.Connection());
            //Cmd.CommandType = CommandType.StoredProcedure;
            //Cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
            //Cmd.Parameters.Add("@Param", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Value;
            //Cmd.Parameters.Add("@Param1", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Text;


        }

        catch (Exception ex)
        {
            string script = "alert('" + ex.Message + "');";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            //tran.Rollback();
        }



    }
}