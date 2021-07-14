using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Runtime.Remoting.Contexts;
using System.IO;
using System.Text;
using System.Security.Cryptography;

public partial class Jct_Payroll_User_Detail : System.Web.UI.Page
{         
    protected void Page_Load(object sender, EventArgs e)
    {      
        //MyStaticValues.MyStaticBool = Decrypt(HttpUtility.UrlDecode(Request.QueryString["name"]));       
    }

    private string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        cipherText = cipherText.Replace(" ", "+");
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }

    public static class MyStaticValues
    {
        public static string MyStaticBool { get; set; }
    }

    public class MyViewModel
    {
        public List<FamilyDetails> FamilyDetails { get; set; }
        public CurrentAddress CurrentAddress { get; set; }
        public PermanentAddress PermanentAddress { get; set; }
    }

    public class CurrentAddress
    {
        public string CurrentAddress1 { get; set; }
        public string CurrentAddress2 { get; set; }
        public string CurrentAddress3 { get; set; }
        public string Currentstate { get; set; }
        public string Currentcity { get; set; }
        public string CurrentMobile { get; set; }
        public string Currentlandline { get; set; }
        public string CurrentSecondaryLandline { get; set; }
        public string CurrentEmailID { get; set; }
    }

    public class PermanentAddress
    {
        public string PermanentAddress1 { get; set; }
        public string PermanentAddress2 { get; set; }
        public string PermanentAddress3 { get; set; }
        public string Permanentstate { get; set; }
        public string Permanentcity { get; set; }
        public string PermanentMobile { get; set; }
        public string Permanentandline { get; set; }
        public string PermanentSecondaryLandline { get; set; }
        public string PermanentEmailID { get; set; }
    }


    public class FamilyDetails
    {
        public string Relation { get; set; }
        public string Name { get; set; }
        public string dob { get; set; }      
    }


    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }



    [System.Web.Services.WebMethod]
    public static MyViewModel GetInitialDetails()
    {
        MyViewModel user = new MyViewModel();
        
        user.CurrentAddress = CurrentAddressDetails(MyStaticValues.MyStaticBool);
        user.PermanentAddress = PermanentAddressDetails(MyStaticValues.MyStaticBool);
        user.FamilyDetails = FamilyDetail(MyStaticValues.MyStaticBool);

        return user;
    }


    [System.Web.Services.WebMethod]
    public static void SaveUser(User[] user, User[] user1, FamilyDetails[] user2 )
    {
        foreach(var myval in user2)
        {
            string a = myval.Name;
        }
    }


    [System.Web.Services.WebMethod]
    public static MyViewModel PostInitialDetails(User user)
    {
        MyViewModel setuser = new MyViewModel();
        //user.CurrentAddress = CurrentAddressDetails(MyStaticValues.MyStaticBool);
        //user.PermanentAddress = PermanentAddressDetails(MyStaticValues.MyStaticBool);
        return setuser;
        
    }
    
    public static CurrentAddress CurrentAddressDetails(string names)
    {
        DataTable dt = new DataTable();
        CurrentAddress CurrentAddresss  = new CurrentAddress();
        string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
        SqlConnection con = new SqlConnection(qry);
        con.Open();
        SqlCommand cmd = new SqlCommand("jct_payroll_emp_address_detail_PortalFetch_Current", con);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.Add("@Employeecode", SqlDbType.VarChar, 50).Value = names;
        cmd.Parameters.Add("@Employeecode", SqlDbType.VarChar, 50).Value = "9000000334";
        //cmd.Parameters.Add("@EmployeeName", SqlDbType.VarChar, 10).Value = "raj";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dtrow in dt.Rows)
        {
            CurrentAddresss.CurrentAddress1 = dtrow["CurrentAddress1"].ToString();
            CurrentAddresss.CurrentAddress2 = dtrow["CurrentAddress2"].ToString();
            CurrentAddresss.CurrentAddress3 = dtrow["CurrentAddress3"].ToString();
            CurrentAddresss.Currentstate = dtrow["CurrentState"].ToString();
            CurrentAddresss.Currentcity = dtrow["CurrentCity"].ToString();
            CurrentAddresss.CurrentMobile = dtrow["CurrentPrimaryMobileNo"].ToString();
            CurrentAddresss.Currentlandline = dtrow["CurrentPrimaryLandlineNo"].ToString();
            CurrentAddresss.CurrentSecondaryLandline = dtrow["CurrentSecondaryLandlineNo"].ToString();
            CurrentAddresss.CurrentEmailID = dtrow["CurrentEmailID"].ToString();                        
        }
        con.Close();
        return CurrentAddresss;
    }

    public static PermanentAddress PermanentAddressDetails(string names)
    {
        DataTable dt = new DataTable();
        PermanentAddress PermanentAddresss = new PermanentAddress();
        string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
        SqlConnection con = new SqlConnection(qry);
        con.Open();
        SqlCommand cmd = new SqlCommand("jct_payroll_emp_address_detail_PortalFetch_Permanent", con);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.Add("@Employeecode", SqlDbType.VarChar, 50).Value = names;
        cmd.Parameters.Add("@Employeecode", SqlDbType.VarChar, 50).Value = "9000000334";
        //cmd.Parameters.Add("@EmployeeName", SqlDbType.VarChar, 10).Value = "raj";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dtrow in dt.Rows)
        {
            PermanentAddresss.PermanentAddress1 = dtrow["PermanentAddress1"].ToString();
            PermanentAddresss.PermanentAddress2 = dtrow["PermanentAddress2"].ToString();
            PermanentAddresss.PermanentAddress3 = dtrow["PermanentAddress3"].ToString();
            PermanentAddresss.Permanentstate = dtrow["PermanentState"].ToString();
            PermanentAddresss.Permanentcity = dtrow["PermanentCity"].ToString();
            PermanentAddresss.PermanentMobile = dtrow["PermanentPrimaryMobileNo"].ToString();
            PermanentAddresss.Permanentandline = dtrow["PermanentPrimaryLandlineNo"].ToString();
            PermanentAddresss.PermanentSecondaryLandline = dtrow["PermanentSecondaryLandlineNo"].ToString();
            PermanentAddresss.PermanentEmailID = dtrow["PermanentEmailID"].ToString();
        }
        con.Close();
        return PermanentAddresss;
    }

    public static List<FamilyDetails> FamilyDetail(string code)
    {
        DataTable dt = new DataTable();
        List<FamilyDetails> FamilyDetailss = new List<FamilyDetails>();
        string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
        SqlConnection con = new SqlConnection(qry);
        con.Open();
        SqlCommand cmd = new SqlCommand("jct_payroll_emp_address_detail_PortalFetch_Insurance", con);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.Add("@Employeecode", SqlDbType.VarChar, 10).Value = code;
        cmd.Parameters.Add("@Employeecode", SqlDbType.VarChar, 50).Value = "9000000334";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dtrow in dt.Rows)
        {
            FamilyDetails abc = new FamilyDetails();
            abc.Name = dtrow["Name"].ToString();
            abc.Relation = dtrow["Relation"].ToString();
            abc.dob = dtrow["dob"].ToString();
            FamilyDetailss.Add(abc);
        }
        con.Close();
        return FamilyDetailss;
    }

}