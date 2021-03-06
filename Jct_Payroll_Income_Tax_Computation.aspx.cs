using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Payroll_Jct_Payroll_Income_Tax_Computation : System.Web.UI.Page
{
    Connection obj = new Connection();
    string sql = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                rblMeasurementSystem.Visible = false;
                LinkButton1.Visible = false;
                //fetchrecordload();
                FetchRecord();
            }
            catch (Exception ex)
            {
                string script = "alert('" + ex.Message + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            }
            finally
            {
                obj.ConClose();
            }
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
                //string script = "alert('No Record Found');";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                //return;

                rblMeasurementSystem.Visible = true;
                LinkButton1.Visible = true;
                lblcat.Visible = true;
                Label5.Visible = true;
            }
            else
            {
                rblMeasurementSystem.Visible = false;
                LinkButton1.Visible = false;
                lblcat.Visible = false;
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
        finally
        {
            obj.ConClose();
        }
    }



    public void FetchRecord()
    {


        SqlCommand cmd = new SqlCommand("JCt_Payroll_TaxComputation_Portal_view", obj.Connection());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Empcode", SqlDbType.VarChar, 10).Value = Session["EmpCode"];
        //cmd.Parameters.Add("@Empcode", SqlDbType.VarChar, 10).Value = "9000000334";
        //cmd.Parameters.Add("@Empcode", SqlDbType.VarChar, 10).Value = "r-03339";   
        //cmd.Parameters.Add("@YearMonth", SqlDbType.Int).Value = txttodate.Text;
        //cmd.Parameters.Add("@Empcode", SqlDbType.VarChar, 10).Value = txtEmployee.Text;                 
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            while (dr.Read())
            {
                Label1.Text = dr[1].ToString();
                Label2.Text = dr[2].ToString();
                Label3.Text = dr[3].ToString();
                Label4.Text = dr[4].ToString();
                Label6.Text = dr[5].ToString();
                Label7.Text = dr[6].ToString();
                Label8.Text = dr[7].ToString();
                //Label8.Text = dr[8].ToString();
                Label9.Text = dr[8].ToString();
                Label10.Text = dr[9].ToString();

                Label11.Text = dr[10].ToString();
                Label12.Text = dr[11].ToString();

                Label14.Text = dr[12].ToString();
                Label15.Text = dr[13].ToString();
                Label16.Text = dr[14].ToString();
                Label17.Text = dr[15].ToString();
                Label18.Text = dr[16].ToString();
                //Label19.Text = dr[17].ToString();
                Label20.Text = dr[17].ToString();
                //Label21.Text = dr[19].ToString();
                Label22.Text = dr[18].ToString();


                Label24.Text = dr[19].ToString();
                Label25.Text = dr[20].ToString();
                Label26.Text = dr[21].ToString();
                Label27.Text = dr[22].ToString();
                Label28.Text = dr[23].ToString();



                Label29.Text = dr[24].ToString();
                Label30.Text = dr[25].ToString();
                Label31.Text = dr[26].ToString();
                Label32.Text = dr[27].ToString();


                Label33.Text = dr[28].ToString();
                Label34.Text = dr[29].ToString();
                Label35.Text = dr[30].ToString();
                Label36.Text = dr[31].ToString();
                Label37.Text = dr[32].ToString();
                Label38.Text = dr[33].ToString();
                Label39.Text = dr[34].ToString();
                Label40.Text = dr[35].ToString();

                Label41.Text = dr[36].ToString();
                Label42.Text = dr[37].ToString();
                Label43.Text = dr[38].ToString();
                Label44.Text = dr[39].ToString();



                Label45.Text = dr[40].ToString();
                Label46.Text = dr[41].ToString();
                Label47.Text = dr[42].ToString();
                Label48.Text = dr[43].ToString();
                Label49.Text = dr[44].ToString();
                Label50.Text = dr[45].ToString();
                Label51.Text = dr[46].ToString();
                Label52.Text = dr[47].ToString();


                Label53.Text = dr[48].ToString();
                Label54.Text = dr[49].ToString();
                Label55.Text = dr[50].ToString();
                Label56.Text = dr[51].ToString();
                Label57.Text = dr[52].ToString();
                Label58.Text = dr[53].ToString();
                Label59.Text = dr[54].ToString();
                Label60.Text = dr[55].ToString();
                Label61.Text = dr[56].ToString();
                Label62.Text = dr[57].ToString();
                Label63.Text = dr[58].ToString();
                Label64.Text = dr[59].ToString();
                Label67.Text = dr[0].ToString();
                Label66.Text = dr[60].ToString();
                Label68.Text = dr[61].ToString();
                Label69.Text = dr[63].ToString();
                Label70.Text = dr[62].ToString();
                Label71.Text = dr["SURCHARGE"].ToString();



            }
        }
        dr.Close();
        // obj.ConClose();
    }
    protected void lnkreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Jct_Payroll_Income_Tax_Computation.aspx");
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
            //SqlDataAdapter Da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //Da.Fill(ds);
            //GridView1.DataSource = ds.Tables[0];
            //GridView1.DataBind();           
            string script = "alert('Updated');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
            fetchrecordload();

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
}