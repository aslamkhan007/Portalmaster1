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
        var a  = Decrypt(HttpUtility.UrlDecode(Request.QueryString["name"]));
       // var a = Request.QueryString["name"];
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


    [System.Web.Services.WebMethod]
    public static int GetInitialDetails()
    {
        //System.Threading.Thread.Sleep(5000);
        int result = 0;
        string qry = ConfigurationManager.ConnectionStrings["misjctdev"].ToString();
        SqlConnection con = new SqlConnection(qry);
        con.Open();
        SqlCommand cmd = new SqlCommand("Jct_Payroll_PayScale_Master_CheckDesignation", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@empcode", SqlDbType.VarChar, 10).Value = HttpContext.Current.Session;
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            while (dr.Read())
            {
                result = Convert.ToInt16(dr["res"]);
            }
        }
        dr.Close();
        con.Close();
        return result;
    }
}