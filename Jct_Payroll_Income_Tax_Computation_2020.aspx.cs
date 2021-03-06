using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class Jct_Payroll_Income_Tax_Computation_2020 : System.Web.UI.Page
{
    Connection obj = new Connection();
    string sql = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FetchRecord();
            rblMeasurementSystem.Visible = false;
            LinkButton1.Visible = false;
            fetchrecordload();
            SelectedType();
           
            
        }
    }

    public void fetchrecordload()
    {
        try
        {
            string sql = "JCt_Payroll_TaxComputation_Accept_view";
            SqlCommand cmd = new SqlCommand(sql, obj.Connection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;
            cmd.Parameters.Add("@empcode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
            cmd.ExecuteNonQuery();
            SqlDataAdapter Da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            Da.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            if (ds.Tables[0].Rows.Count > 0)
            {
                rblMeasurementSystem.Visible = true;
                LinkButton1.Visible = true;
                Label5.Visible = true;
            }
            else
            {
                rblMeasurementSystem.Visible = false;
                LinkButton1.Visible = false;
                Label5.Visible = false;
            }
        }
        catch (Exception ex)
        {
            string script2 = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script2, true);
            return;
        }
        finally
        {
            obj.ConClose();
        }
    }

    protected void lnkreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Jct_Payroll_Income_Tax_Computation_2020_Accept.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "JCt_Payroll_TaxComputation_Accept_Update";
            SqlCommand cmd = new SqlCommand(sql, obj.Connection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;
            cmd.Parameters.Add("@empcode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
            cmd.Parameters.Add("@Type", SqlDbType.VarChar, 10).Value = rblMeasurementSystem.SelectedValue;
            cmd.Parameters.Add("@Hostname", SqlDbType.VarChar, 15).Value = Request.ServerVariables["REMOTE_ADDR"];
            cmd.ExecuteNonQuery();
            string script = "alert('You Have Successfully Submited Your Record');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            fetchrecordload();
            if (rblMeasurementSystem.SelectedValue == "Old")
            {
                Label5.InnerText = "You Have Successfully Selected Old Tax Computation";
            }
            else if (rblMeasurementSystem.SelectedValue == "New")
            {
                Label5.InnerText = "You Have Successfully Selected New Tax Computation";
            }
            Label5.Visible = true;
            SelectedType();
            return;
        }
        catch (Exception ex)
        {
            string script2 = "alert('" + ex.Message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script2, true);
            return;
        }
        finally
        {
            obj.ConClose();
        }
    }

    public void SelectedType()
    {
        messagediv.Visible = false;
        SqlCommand cmd = new SqlCommand("JCt_Payroll_TaxComputation_Accepted_Record", obj.Connection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@empcode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true) 
        {
            while (dr.Read())
            {
                if (dr["CalcRule"].ToString() == "Old")
                {
                    Label5.Visible = true;
                    Label5.InnerText = "You Have Successfully Selected Old Tax Computation";
                    messagediv.Visible = true;
                }
                if (dr["CalcRule"].ToString() == "New")
                {
                    Label5.Visible = true;
                    Label5.InnerText = "You Have Successfully Selected New Tax Computation";
                    messagediv.Visible = true;
                }
            }
        }
        dr.Close();
    }


    public void FetchRecord()
    {
        SqlCommand cmd = new SqlCommand("JCt_Payroll_TaxComputation_Portal_view", obj.Connection());
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.Add("@Empcode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
        //cmd.Parameters.Add("@Empcode", SqlDbType.VarChar, 10).Value = "r-03339";   
        //cmd.Parameters.Add("@YearMonth", SqlDbType.Int).Value = txttodate.Text;
        cmd.Parameters.Add("@sapEmpcode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            while (dr.Read())
            {
                Label1.Text = dr["YearlySalary"].ToString();
                Label2.Text = dr["OtherAlw"].ToString();
                Label3.Text = dr["HouseRent"].ToString();
                Label4.Text = dr["EntAlw"].ToString();
                Label6.Text = dr["Total6"].ToString();
                Label7.Text = dr["HouseRent1"].ToString();
                Label8.Text = dr["RentPaid"].ToString();
                //Label8.Text = dr[8].ToString();
                Label9.Text = dr["Salary10"].ToString();
                Label10.Text = dr["Agg10"].ToString();

                Label11.Text = dr["Hra4050"].ToString();
                Label12.Text = dr["HRAexempted"].ToString();

                //Label14.Text = dr["YearlyUniAlow"].ToString();
                //Label15.Text = dr["Total7"].ToString();
                Label16.Text = dr["Total8"].ToString();
                Label17.Text = dr["Accom75"].ToString();
                Label18.Text = dr["Furinture"].ToString();
                //Label19.Text = dr[17].ToString();
                Label20.Text = dr["Water"].ToString();
                //Label21.Text = dr[19].ToString();
                Label22.Text = dr["LTA"].ToString();


                Label24.Text = dr["Conveyance"].ToString();
                Label25.Text = dr["CarInsurance"].ToString();
                Label26.Text = dr["GratuityIntrestDiff"].ToString();
                Label27.Text = dr["TotalPerks"].ToString();

                //Label28.Text = dr["TotalPerks1"].ToString();

                Label29.Text = dr["Total10"].ToString();
                Label30.Text = dr["Otherincome"].ToString();
                Label31.Text = dr["StdDed"].ToString();
                Label32.Text = dr["Total13"].ToString();

                Label50248.Text = dr["lic"].ToString();
                Label33.Text = dr["Units"].ToString();
                Label34.Text = dr["PFVPF"].ToString();
                Label35.Text = dr["PPF"].ToString();
                // Label36.Text = dr["nsc8"].ToString();
                Label37.Text = dr["nsc8"].ToString();
                Label38.Text = dr["SENIOR"].ToString();
                Label39.Text = dr["HLA"].ToString();
                Label40.Text = dr["Infra"].ToString();
                Label50249.Text = dr["PensionFund"].ToString();

                Label41.Text = dr["SchoolFees"].ToString();

                Label42.Text = dr["Total15"].ToString();

                Label43.Text = dr["Total16"].ToString();
                Label44.Text = dr["test1"].ToString();

                Label45.Text = dr["MedicalInsurance"].ToString();
                Label46.Text = dr["HandiDep"].ToString();
                Label47.Text = dr["HigherEduc"].ToString();
                Label48.Text = dr["PMFund"].ToString();
                Label49.Text = dr["HandiEmp"].ToString();
                Label50.Text = dr["NPS"].ToString();
                Label51.Text = dr["Total23"].ToString();
                Label52.Text = dr["TaxableIncome24"].ToString();


                Label53.Text = dr["TaxableIncome"].ToString();
                Label54.Text = dr["Reb87A"].ToString();
                Label55.Text = dr["cess4per"].ToString();
                Label71.Text = dr["SURCHARGE"].ToString();
                Label56.Text = dr["TotalTaxCess"].ToString();
                Label57.Text = dr["Comput_29TotIncomeTaxAmt"].ToString();
                Label58.Text = dr["Comput_29ATaxDeducted"].ToString();
                Label59.Text = dr["Balance"].ToString();
                Label60.Text = dr["TaxInstallment"].ToString();
                Label61.Text = dr["CessInstalment"].ToString();
                Label62.Text = dr["refund"].ToString();
                Label63.Text = dr["EMPTAX"].ToString();

                //Label64.Text = dr[59].ToString();
                Label67.Text = dr["Empcode"].ToString();
                Label66.Text = dr["FYPeriod"].ToString();
                Label68.Text = dr["EmployeeName"].ToString();
                Label69.Text = dr["Designation"].ToString();
                Label70.Text = dr["Department"].ToString();



                // New Additions Added for New tx calcuation 
                Label5001.Text = dr["Total6N"].ToString();
                Label5002.Text = dr["Total8N"].ToString();
                Label5003.Text = dr["ConveyanceN"].ToString();
                Label5004.Text = dr["Total10N"].ToString();


                Label5005.Text = dr["StdDedN"].ToString();
                Label5006.Text = dr["Total13N"].ToString();
                Label5007.Text = dr["Total15N"].ToString();
                Label5008.Text = dr["Total16N"].ToString();

                Label5009.Text = dr["Total23N"].ToString();

                //Label5010.Text = dr["TotPFSupAmtN"].ToString();

                Label5011.Text = dr["TaxablePFSupN"].ToString();

                Labelrepeat.Text = dr["TaxablePFSupN"].ToString();

                /// new 

                Label5012.Text = dr["TaxableIncomen"].ToString();

                Label5013.Text = dr["Reb87An"].ToString();

                Label5014.Text = dr["cess4pern"].ToString();

                Label5015.Text = dr["SURCHARGEn"].ToString();

                Label5016.Text = dr["TotalTaxCessn"].ToString();

                Label5017.Text = dr["Comput_29TotIncomeTaxAmtn"].ToString();

                Label5018.Text = dr["Comput_29ATaxDeductedn"].ToString();

                Label5019.Text = dr["Balancen"].ToString();

                Label5020.Text = dr["TaxInstallmentn"].ToString();

                Label5021.Text = dr["CessInstalmentn"].ToString();

                Label5022.Text = dr["refundn"].ToString();
                //Label5023.Text = dr["EMPTAXn"].ToString();  14 dec 2020 by lovelesh



                Label50241.Text = dr["GratuityIntrestDiff"].ToString();
                Label50242.Text = dr["Accom75"].ToString();
                Label50243.Text = dr["Furinture"].ToString();
                Label50244.Text = dr["Water"].ToString();
                Label50245.Text = dr["LTA"].ToString();
                Label50246.Text = dr["CarInsurance"].ToString();

                Label50247.Text = dr["TotalPerksN"].ToString();


            }
        }
        dr.Close();
    }


}