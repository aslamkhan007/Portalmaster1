using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Linq;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;

public partial class _Default : System.Web.UI.Page
{
    //Dim Obj As Connection = New Connection
    //Dim SqlPass As String
    //Dim empcode As String
    //'DataTable Menus = New DataTable()
    //Dim Dt_EmpData As DataTable
    Connection Obj = new Connection();
    string SqlPass;
    string empcode;
    DataTable Dt_EmpData;
    Hashtable HolidayList;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Empcode"].ToString() == "")
        {
            Response.Redirect("~/login.aspx");
            
        }

        if (!IsPostBack)
        {
            HolidayList = Getholiday();
            Calendar1.Caption = "Calender";
            Calendar1.FirstDayOfWeek = FirstDayOfWeek.Sunday;
            Calendar1.NextPrevFormat = NextPrevFormat.ShortMonth;
            Calendar1.TitleFormat = TitleFormat.Month;
            Calendar1.ShowGridLines = true;
            Calendar1.DayStyle.Height = new Unit(50);
            Calendar1.DayStyle.Width = new Unit(150);
            Calendar1.DayStyle.HorizontalAlign = HorizontalAlign.Center;
            Calendar1.DayStyle.VerticalAlign = VerticalAlign.Middle;
            Calendar1.OtherMonthDayStyle.BackColor = System.Drawing.Color.AliceBlue;
        }


        //BindMenu();
        //else
        //    Response.Redirect("~/Jct_Payroll_Employee_Personal_Info.aspx");
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        //Response.Write("" + e.Day.Date.ToShortDateString());
        if (HolidayList[e.Day.Date.ToShortDateString()] != null)
        {
            Literal literal1 = new Literal();
            literal1.Text = "<br/>";
            e.Cell.Controls.Add(literal1);
            Label label1 = new Label();
            label1.Text = (string)HolidayList[e.Day.Date.ToShortDateString()];
            label1.Font.Size = new FontUnit(FontSize.Small);
            e.Cell.Controls.Add(label1);
        }
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        LabelAction.Text = "Date changed to :" + Calendar1.SelectedDate.ToShortDateString();
    }

    protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
    {
        LabelAction.Text = "Month changed to :" + e.NewDate.ToShortDateString();
    }
    //private void BindMenu()
    //{

    //        Dt_EmpData = GetData("Jct_Payroll_Emp_MonthlyCalender  '" + Session["EmpCode"] + "','01','2018'");

    //        DataView view = new DataView(Dt_EmpData);

    //        this.dlstEmp.DataSource = view;
    //        this.dlstEmp.DataBind();


    //}
    //private DataTable GetData(string query)
    //{
    //    SqlConnection con = new SqlConnection(Obj.Connection().ConnectionString);
    //    DataTable dt = new DataTable();
    //    SqlCommand cmd = new SqlCommand(query);
    //    SqlDataAdapter sda = new SqlDataAdapter();
    //    cmd.CommandType = CommandType.Text;
    //    cmd.Connection = con;
    //    sda.SelectCommand = cmd;
    //    sda.Fill(dt);
    //    con.Close();
    //    return dt;
    //}
    private Hashtable Getholiday()
    {
        Hashtable holiday = new Hashtable();
        SqlCommand cmd = new SqlCommand("exec Jct_Payroll_Holiday_List_ashish '" + Session["Empcode"].ToString() +  "'", Obj.Connection());
        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            holiday[dr["Date"]] =dr["Ocassion"].ToString();
        }
        dr.Close();
        return holiday;
    }
}