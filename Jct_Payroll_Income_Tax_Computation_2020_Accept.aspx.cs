using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Jct_Payroll_Income_Tax_Computation_2020_Accept : System.Web.UI.Page
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
                fetchrecordload();

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