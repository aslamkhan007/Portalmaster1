Imports System.Data
Partial Class Notice_Board
    Inherits System.Web.UI.Page
    Dim ob As CostModule = New CostModule
    Dim txt(20) As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Menu Generation using XML Data Source----------------------------
        If Not IsPostBack Then
            RegAppHit("JCT00LTD", "Anonymous", "FusionApps", Request.UserHostAddress)

            Dim sql As String = "select ItemCode as text, SDescription 'Desc', LDescription 'LDesc', url, case ParentItem when '' then null else ParentItem end as ParentID from jct_fap_notice_board where status <> 'D'" 'union select 'Home' 'text',Null 'ParentID'"
            '"select 'Home' 'text', null 'ParentID' union select 'News' 'text', null 'ParentID' union select 'JCTLinks' 'text', null 'ParentID' union select 'Coming Up' 'text', 'Home' 'ParentID'"
            Dim ds As DataSet = ob.FetchDS(sql)
            ds.DataSetName = "Menus"
            ds.Tables(0).TableName = "Menu"

            '------------------
            Dim relation As DataRelation = New DataRelation("ParentChild", ds.Tables("Menu").Columns("text"), ds.Tables("Menu").Columns("ParentID"), True)
            relation.Nested = True
            ds.Relations.Add(relation)
            '------------------

            Dim xmlds1 As XmlDataSource = New XmlDataSource
            xmlds1.ID = "xmlds1"
            xmlds1.EnableCaching = False
            'ds.WriteXml("E:/Samplexmlfile.xml")
            xmlds1.TransformFile = "~/FrameTreeTrans.xslt"
            xmlds1.Data = ds.GetXml()
            'xmlds1.XPath = "MenuItems/MenuItem"
            xmlds1.XPath = "/MenuItems/MenuItem"

            treDept.DataSource = xmlds1
            treDept.DataBind()
        End If
  

    End Sub

    Protected Sub treDept_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles treDept.SelectedNodeChanged
        GridView1.DataSource = Nothing
        GridView1.DataBind()
        GridView1.Visible = False

        GridView2.DataSource = Nothing
        GridView2.DataBind()
        GridView2.Visible = False

        lblTitle.Text = ""

        If (treDept.SelectedNode.ChildNodes.Count = 0) Then

            Dim sql As String = "select DataSourceProc2 from jct_fap_notice_board where itemcode = '" & treDept.SelectedValue & "' and status<>'D'"
            Dim item As String = ob.FetchScalar(sql)
            GridView1.DataSource = ob.FetchDS(item)
            GridView1.DataBind()
            GridView1.Visible = True

            sql = "select DataSourceProc from jct_fap_notice_board where itemcode = '" & treDept.SelectedValue & "' and status<>'D'"
            item = ob.FetchScalar(sql)
            GridView2.DataSource = ob.FetchDS(item)
            GridView2.DataBind()
            GridView2.Visible = True

            'lblTitle.Text = treDept.SelectedNode.Text
            lblTitle.Text = ob.FetchScalar("Select ldescription from jct_fap_notice_board where itemcode = '" & treDept.SelectedValue & "' and status<>'D'")

            treDept.SelectedNode.Select()
        Else
            treDept.SelectedNode.Expand()
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow And e.Row.RowIndex > 0 Then

            For j = 0 To 2 'e.Row.Cells.Count - 1
                If e.Row.Cells(j).Text = txt(j) Then
                    e.Row.Cells(j).Text = """"
                Else
                    txt(j) = e.Row.Cells(j).Text
                End If
            Next

        ElseIf e.Row.RowType = DataControlRowType.DataRow And e.Row.RowIndex = 0 Then
            For j = 0 To 2 'e.Row.Cells.Count - 1
                txt(j) = e.Row.Cells(j).Text
            Next
        End If
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow And e.Row.RowIndex > 0 Then

            For j = 0 To 2 'e.Row.Cells.Count - 1
                If e.Row.Cells(j).Text = txt(j) Then
                    e.Row.Cells(j).Text = """"
                Else
                    txt(j) = e.Row.Cells(j).Text
                End If
            Next

        ElseIf e.Row.RowType = DataControlRowType.DataRow And e.Row.RowIndex = 0 Then
            For j = 0 To 2 'e.Row.Cells.Count - 1
                txt(j) = e.Row.Cells(j).Text
            Next
        End If
    End Sub

End Class
