using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Jct_Payroll_Screen_Record : System.Web.UI.Page
{
    Connection obj = new Connection();
    //Functions obj1 = new Functions();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            if (Session["Empcode"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }
        }
    }
    protected void txtEmployee_TextChanged(object sender, EventArgs e)
    {
        try
        {
            string employeecode = txtEmployee.Text.Split('|')[1].ToString();
            txtEmployee.Text = employeecode;
        }
        catch (Exception exception)
        {
            txtEmployee.Text = "";
            string script = "alert('Please Select Record From List');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
        }
    }

    protected void lnksave_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "JCT_Payroll_Employee_User_Employee_Search";
            SqlCommand cmd = new SqlCommand(sql, obj.Connection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;

            cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = txtEmployee.Text;

            cmd.ExecuteNonQuery();
            SqlDataAdapter Da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            Da.Fill(ds);
            grdDetail.DataSource = ds.Tables[0];
            grdDetail.DataBind();

            if (ds.Tables[0].Rows.Count > 1)
                Panel1.Visible = true;

            grdDetail.UseAccessibleHeader = true;
            grdDetail.HeaderRow.TableSection = TableRowSection.TableHeader;
            // grdDetail.HeaderRow.CssClass = "gridh1";

            grdDetail.FooterRow.TableSection = TableRowSection.TableFooter;

            TableCellCollection cells = grdDetail.HeaderRow.Cells;
            cells[0].Attributes.Add("data-class", "expand");

            cells[1].Attributes.Add("data-hide", "phone,tablet");
            cells[5].Attributes.Add("data-hide", "phone,tablet");
            cells[6].Attributes.Add("data-hide", "phone,tablet");
            cells[7].Attributes.Add("data-hide", "phone,tablet");
            cells[8].Attributes.Add("data-hide", "phone,tablet");
            cells[9].Attributes.Add("data-hide", "phone,tablet");


            //cells[4].Attributes.Add("data-hide", "phone,tablet");





            if (ds.Tables[0].Rows.Count == 0)
            {
                string script = "alert('No Record Found');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                return;
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
        //Response.Redirect("Jct_Payroll_Screen_Record.aspx");
        try
        {
            string sql = "JCT_Payroll_Employee_User_Employee_Search_Re";
            SqlCommand cmd = new SqlCommand(sql, obj.Connection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;

            cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = txtEmployee.Text;

            cmd.ExecuteNonQuery();
            SqlDataAdapter Da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            Da.Fill(ds);
            grdDetail.DataSource = ds.Tables[0];
            grdDetail.DataBind();

            if (ds.Tables[0].Rows.Count > 1)
                Panel1.Visible = true;

            grdDetail.UseAccessibleHeader = true;
            grdDetail.HeaderRow.TableSection = TableRowSection.TableHeader;
            // grdDetail.HeaderRow.CssClass = "gridh1";

            grdDetail.FooterRow.TableSection = TableRowSection.TableFooter;

            TableCellCollection cells = grdDetail.HeaderRow.Cells;
            cells[0].Attributes.Add("data-class", "expand");

            cells[1].Attributes.Add("data-hide", "phone,tablet");
            cells[5].Attributes.Add("data-hide", "phone,tablet");
            cells[6].Attributes.Add("data-hide", "phone,tablet");
            cells[7].Attributes.Add("data-hide", "phone,tablet");
            cells[8].Attributes.Add("data-hide", "phone,tablet");
            cells[9].Attributes.Add("data-hide", "phone,tablet");


            //cells[4].Attributes.Add("data-hide", "phone,tablet");





            if (ds.Tables[0].Rows.Count == 0)
            {
                string script = "alert('No Record Found');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", script, true);
                return;
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

    protected void onRowCreate(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            int colSpan = e.Row.Cells.Count;

            for (int i = (e.Row.Cells.Count - 1); i >= 1; i -= 1)
            {
                e.Row.Cells.RemoveAt(i);
                e.Row.Cells[0].ColumnSpan = colSpan;
            }

            e.Row.Cells[0].Controls.Add(new LiteralControl("<ul class='pagination pagination-centered hide-if-no-paging'></ul>"));
        }
    }
}