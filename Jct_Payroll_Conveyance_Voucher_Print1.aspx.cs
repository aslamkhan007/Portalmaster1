using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Payroll_Jct_Payroll_Conveyance_Voucher_Print : System.Web.UI.Page
{
    Connection obj = new Connection();
    Functions obj1 = new Functions();
    int requestID;
    int CheckEligile = 0;
    string jctsr_no;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }


}