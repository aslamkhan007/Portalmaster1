Imports System.Data
Partial Class GeneralArea
    Inherits System.Web.UI.Page
    Dim ob As CostModule = New CostModule

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Tree Generation using XML Data Source----------------------------
        If Not IsPostBack Then
            RegAppHit("JCT01LTD", "Anonymous", "FusionApps", Request.UserHostAddress)

            Dim sql As String = "select ItemCode as text, SDescription 'Desc', LDescription 'LDesc', url, case ParentItem when '' then null else ParentItem end as ParentID from jct_fap_shared_area where status <> 'D' and ItemCat = 'GenTips'" 'union select 'Home' 'text',Null 'ParentID'"
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

            xmlds1.TransformFile = "~/FrameTreeTrans.xslt"
            xmlds1.Data = ds.GetXml()

            xmlds1.XPath = "/MenuItems/MenuItem"

            treDept.DataSource = xmlds1
            treDept.DataBind()
        End If


    End Sub

End Class
