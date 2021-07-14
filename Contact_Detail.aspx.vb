Imports System.Data
Imports System.Data.SqlClient

Partial Class ContactDetail
    Inherits System.Web.UI.Page
    Dim Obj As New Connection
    Dim objFun As Functions = New Functions
    Dim Cmd As New SqlCommand
    Dim Qry As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Companycode") = "jct01ltd"
        TextBox1.Attributes.Add("onkeypress", "return clickButton(event,'" + Button1.ClientID + "')")
        If IsPostBack = False Then
            'If (Session("empcode") <> "") Then
            'Else
            '    Response.Redirect("~/login.aspx")
            'End If
            Grid()
        End If
    End Sub
    Protected Sub Grid()
        Qry = "EXEC JCT_EMPG_MISTEL '" & Session("Companycode") & "'"
        ViewState.Add("Qry", Qry)
        objFun.FillGrid(ViewState("Qry"), GridView1)
    End Sub
    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        objFun.FillGrid(ViewState("Qry"), GridView1)
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Qry = "SELECT CardNo,Name,Designation,Deptname AS [Department],isnull(convert(varchar,nullif(Int_Off,0)),'') AS [Int Off No],isnull(convert(varchar,nullif(Int_Res,0)),'') AS [Int Res No],isnull(convert(varchar,nullif(EPB_OFF,0)),'') AS [EPBX OFF NO],isnull(convert(varchar,nullif(EPB_RES,0)),'') AS [EPBX RES NO],Mobile FROM JCT_FUSION_MISTEL WHERE  " & DropDownList1.SelectedValue & "  LIKE '%" & TextBox1.Text & "%' and name<>'' ORDER BY name"
        ViewState.Add("Qry", Qry)
        objFun.FillGrid(ViewState("Qry"), GridView1)
    End Sub
    Protected Sub LnkFetch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LnkFetch.Click
        Qry = "SELECT CardNo,Name,Designation,Deptname AS [Department],isnull(convert(varchar,nullif(Int_Off,0)),'') AS [Int Off No],isnull(convert(varchar,nullif(Int_Res,0)),'') AS [Int Res No],isnull(convert(varchar,nullif(EPB_OFF,0)),'') AS [EPBX OFF NO],isnull(convert(varchar,nullif(EPB_RES,0)),'') AS [EPBX RES NO],Mobile FROM JCT_FUSION_MISTEL WHERE  " & DropDownList1.SelectedValue & "  LIKE '%" & TextBox1.Text & "%' and name<>'' ORDER BY name"
        ViewState.Add("Qry", Qry)
        objFun.FillGrid(ViewState("Qry"), GridView1)
    End Sub
    Protected Sub LnkShowAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LnkShowAll.Click
        Grid()
    End Sub

    Protected Sub HoverImages()

    End Sub
    'Dim series As Series
    '    For Each series In Chart1.Series
    'Dim pointIndex As Integer
    '        For pointIndex = 0 To series.Points.Count - 1
    ''Step pointIndex + 1
    'Dim toolTip As String = ""

    '            toolTip = "<IMG SRC=" + Trim(series.Points(pointIndex).AxisLabel) + ".jpg>"

    '            series.Points(pointIndex).MapAreaAttributes = "onmouseover=""DisplayTooltip('" + toolTip + "');"" onmouseout=""DisplayTooltip('');"""

    '        Next
    '    Next

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Dim toolTip As String = ""

        toolTip = "<IMG width = 90px height = 120px SRC=empgateway/emp_images/" + Trim(e.Row.Cells(0).Text) + ".jpg>"
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' e.Row.Cells(0).Visible = False

            e.Row.Attributes.Add("onmouseover", "DisplayTooltip('" + toolTip + "');")
            e.Row.Attributes.Add("onmouseout", "DisplayTooltip('');")
        End If


    End Sub
End Class





















































































































