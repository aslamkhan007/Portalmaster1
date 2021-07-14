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

    //working well for base 
    //[System.Web.Services.WebMethod]
    //public static void SaveUser(User[] user, User[] user1, FamilyDetails[] user2 )
    //{
    //    foreach(var myval in user2)
    //    {
    //        string a = myval.Name;
    //    }
    //}

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
        //public List<FamilyDetails> FamilyDetails { get; set; }
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
        public string CurrentSecondaryMobileNo { get; set; }        
        public string CurrentPincode { get; set; }
        public string CurrentPrimaryLandline { get; set; }
        public string CurrentEmailID { get; set; }
        public bool CurrentSubmitStatus { get; set; }
        public string SelectedUser { get; set; }
    }

    public class PermanentAddress
    {
        public string PermanentAddress1 { get; set; }
        public string PermanentAddress2 { get; set; }
        public string PermanentAddress3 { get; set; }
        public string Permanentstate { get; set; }
        public string Permanentcity { get; set; }
        public string PermanentPincode { get; set; }        
        public string PermanentMobile { get; set; }
        public string PermanentSecondaryMobileNo { get; set; }
        public string PermanentPrimaryLandline { get; set; }
        public string PermanentEmailID { get; set; }
        public bool PermanentSubmitStatus { get; set; }
    }

    //public class FamilyDetails
    //{
    //    public string Relation { get; set; }
    //    public string Name { get; set; }
    //    public string dob { get; set; }
    //    public string DisableFlag { get; set; }   
        
    //}

    [System.Web.Services.WebMethod]
    public static MyViewModel GetInitialDetails()
    {
        MyViewModel user = new MyViewModel();        
        user.CurrentAddress = CurrentAddressDetails(MyStaticValues.MyStaticBool);
        user.PermanentAddress = PermanentAddressDetails(MyStaticValues.MyStaticBool);
        //user.FamilyDetails = FamilyDetail(MyStaticValues.MyStaticBool);
        return user;
    }
   
    [System.Web.Services.WebMethod]
    //public static void SaveUser(CurrentAddress user, PermanentAddress user1, FamilyDetails[] user2)
    public static void SaveUser(CurrentAddress user, PermanentAddress user1)
    {
        //foreach (var myval in user2)
        //{
        //    string a = myval.Name;
        //}     
        System.Threading.Thread.Sleep(3000);
        try
        {         
            //SqlConnection con = new SqlConnection("Data Source=misdev;Initial Catalog=jctdev;Persist Security Info=True;User ID=itgrp;Password=power;Connect Timeout = 100000;pooling=true;Max Pool Size=200;MultipleActiveResultSets=True");
            SqlConnection con = new SqlConnection("Data Source=test2k;Initial Catalog=jctdev3;Persist Security Info=True;User ID=itgrp;Password=power;Connect Timeout = 100000;pooling=true;Max Pool Size=200;MultipleActiveResultSets=True");
            con.Open();
            string SqlPass = null;
            SqlCommand cmd = new SqlCommand();
            SqlPass = "jct_payroll_emp_address_detail_PortalPost";
            cmd = new SqlCommand(SqlPass, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "9000000334";
            cmd.Parameters.Add("@CurrentAddress1", SqlDbType.VarChar, 30).Value = user.CurrentAddress1;
            cmd.Parameters.Add("@CurrentAddress2", SqlDbType.VarChar, 30).Value = user.CurrentAddress2;
            cmd.Parameters.Add("@CurrentAddress3", SqlDbType.VarChar, 30).Value = user.CurrentAddress3;
            cmd.Parameters.Add("@Currentcity", SqlDbType.VarChar, 30).Value = user.Currentcity;
            cmd.Parameters.Add("@Currentstate", SqlDbType.VarChar, 30).Value = user.Currentstate;
            cmd.Parameters.Add("@CurrentPincode", SqlDbType.VarChar, 6).Value = user.CurrentPincode;
            cmd.Parameters.Add("@CurrentPrimaryMobileNo", SqlDbType.VarChar, 30).Value = user.CurrentPrimaryLandline;
            cmd.Parameters.Add("@CurrentSecondaryMobileNo", SqlDbType.VarChar, 30).Value = user.CurrentSecondaryMobileNo;
            cmd.Parameters.Add("@CurrentPrimaryLandline", SqlDbType.VarChar, 30).Value = user.CurrentPrimaryLandline;
            cmd.Parameters.Add("@CurrentEmailID ", SqlDbType.VarChar, 35).Value = user.CurrentEmailID;

            cmd.Parameters.Add("@PermanentAddress1", SqlDbType.VarChar, 30).Value = user1.PermanentAddress1;
            cmd.Parameters.Add("@PermanentAddress2", SqlDbType.VarChar, 30).Value = user1.PermanentAddress2;
            cmd.Parameters.Add("@PermanentAddress3", SqlDbType.VarChar, 30).Value = user1.PermanentAddress3;
            cmd.Parameters.Add("@Permanentcity", SqlDbType.VarChar, 30).Value = user1.Permanentcity;
            cmd.Parameters.Add("@Permanentstate", SqlDbType.VarChar, 30).Value = user1.Permanentstate;
            cmd.Parameters.Add("@PermanentPincode", SqlDbType.VarChar, 6).Value = user1.PermanentPincode;
            cmd.Parameters.Add("@PermanentPrimaryMobileNo", SqlDbType.VarChar, 30).Value = user1.PermanentPrimaryLandline;
            cmd.Parameters.Add("@PermanentSecondaryMobileNo", SqlDbType.VarChar, 30).Value = user1.PermanentSecondaryMobileNo;
            cmd.Parameters.Add("@PermanentPrimaryLandline", SqlDbType.VarChar, 30).Value = user1.PermanentPrimaryLandline;
            cmd.Parameters.Add("@PermanentEmailID ", SqlDbType.VarChar, 35).Value = user1.PermanentEmailID;
            int row =   cmd.ExecuteNonQuery();

        }
        catch(Exception ex) {

        }

    }


    //public static void SaveTempFamilyDetail(string Relation, string name, string dob, string DisableFlag)
    //{
    //    SqlConnection con = new SqlConnection("Data Source=test2k;Initial Catalog=jctdev3;Persist Security Info=True;User ID=itgrp;Password=power;Connect Timeout = 100000;pooling=true;Max Pool Size=200;MultipleActiveResultSets=True");
    //    con.Open();
    //    string SqlPass = null;
    //    SqlCommand cmd = new SqlCommand();
    //    SqlPass = "jct_payroll_emp_address_detail_PortalPost";
    //    cmd = new SqlCommand(SqlPass, con);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.Add("@NewEmployeecode", SqlDbType.VarChar, 10).Value = "9000000334";
    //    cmd.Parameters.Add("@Dob", SqlDbType.VarChar, 50).Value = dob;
    //    cmd.Parameters.Add("@NAME", SqlDbType.VarChar, 50).Value = name;
    //    cmd.Parameters.Add("@Relation", SqlDbType.VarChar, 50).Value = Relation;
    //    cmd.Parameters.Add("@DisableFlag", SqlDbType.VarChar, 50).Value = DisableFlag;
    //    int row = cmd.ExecuteNonQuery();
    //    con.Close();
    //}



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
            CurrentAddresss.CurrentPincode = dtrow["CurrentPincode"].ToString();
            CurrentAddresss.CurrentMobile = dtrow["CurrentPrimaryMobileNo"].ToString();
            CurrentAddresss.CurrentSecondaryMobileNo = dtrow["CurrentSecondaryMobileNo"].ToString();
            CurrentAddresss.CurrentPrimaryLandline = dtrow["CurrentPrimaryLandline"].ToString();
            CurrentAddresss.CurrentEmailID = dtrow["CurrentEmailID"].ToString();
            CurrentAddresss.CurrentSubmitStatus = Convert.ToBoolean(dtrow["CurrentSubmitStatus"].ToString());                                    
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
            PermanentAddresss.PermanentPincode = dtrow["PermanentPincode"].ToString();
            PermanentAddresss.PermanentMobile = dtrow["PermanentPrimaryMobileNo"].ToString();
            PermanentAddresss.PermanentSecondaryMobileNo = dtrow["PermanentSecondaryMobileNo"].ToString();
            PermanentAddresss.PermanentPrimaryLandline = dtrow["PermanentPrimaryLandline"].ToString();
            PermanentAddresss.PermanentEmailID = dtrow["PermanentEmailID"].ToString();
            PermanentAddresss.PermanentSubmitStatus = Convert.ToBoolean(dtrow["PermanentSubmitStatus"].ToString());                        
        }
        con.Close();
        return PermanentAddresss;
    }

    //public static List<FamilyDetails> FamilyDetail(string code)
    //{
    //    DataTable dt = new DataTable();
    //    List<FamilyDetails> FamilyDetailss = new List<FamilyDetails>();
    //    string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
    //    SqlConnection con = new SqlConnection(qry);
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("jct_payroll_emp_address_detail_PortalFetch_Insurance", con);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    //cmd.Parameters.Add("@Employeecode", SqlDbType.VarChar, 10).Value = code;
    //    cmd.Parameters.Add("@Employeecode", SqlDbType.VarChar, 50).Value = "9000000334";
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
    //    da.Fill(dt);
    //    foreach (DataRow dtrow in dt.Rows)
    //    {
    //        FamilyDetails abc = new FamilyDetails();
    //        abc.Name = dtrow["Name"].ToString();
    //        abc.Relation = dtrow["Relation"].ToString();
    //        abc.dob = dtrow["dob"].ToString();
    //        FamilyDetailss.Add(abc);
    //    }
    //    con.Close();
    //    return FamilyDetailss;
    //}

}