Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports System.Data
Imports System.Data.SqlClient
Imports vb = Microsoft.VisualBasic
Imports System.Collections.Generic

<WebService(Namespace:="http://hspweb/costingsystemtest")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
<Script.Services.ScriptService()> _
Public Class WebService
    Inherits System.Web.Services.WebService
    Dim constr As String = "data source = misdev; initial catalog = jctdev; user id = itgrp; password = power"
    Dim cn As SqlConnection = New SqlConnection(constr)
    Dim qry As String
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim i As Integer

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hello World"
    End Function

    ' <WebMethod()> _
    '<System.Web.Script.Services.ScriptMethod()> _
    'Public Function ExpGetCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As System.String()

    '     'Dim emp As ArrayList = New ArrayList()
    '     Dim constr As String = "data source = hspweb; initial catalog = hspdev; user id = hspempg; password = hspempg"
    '     Dim cn As SqlConnection = New SqlConnection(constr)
    '     Dim sql As String
    '     'sql = "Select convert(varchar(5),Mapping_code) + ' - ' + description from JCT_cst_mapping_master where status=''"
    '     If UCase(contextKey) = "F" Then
    '         sql = "select distinct FinalInvNo from hspdev..JCT_EXP_FinalInv_Mapping where status ='' and FinalInvNo not in (select InvoiceNo from hspdev..JCT_EXP_FinalInv_Mapping where status ='' and flag in ('f')) and Finalinvno like '" & Trim(prefixText) & "%'"
    '     ElseIf UCase(contextKey) = "B" Then
    '         sql = "Select ltrim(rtrim(invoice_no)) from miserp.ardb.dbo.dms_t_invoice_hdr where invoice_dt between getdate()-300 and getdate() and invoice_no not in (select InvoiceNo from hspdev..JCT_EXP_FinalInv_Mapping where status ='' and flag in ('p')) and invoice_no like '" & Trim(prefixText) & "%'"
    '     ElseIf UCase(contextKey) = "P" Then
    '         sql = "Select ltrim(rtrim(invoice_no)) from miserp.ardb.dbo.dms_t_invoice_hdr where invoice_dt between getdate()-300 and getdate() and invoice_no not in (select InvoiceNo from hspdev..JCT_EXP_FinalInv_Mapping where status ='' and flag in ('p','b')) and invoice_no like '" & Trim(prefixText) & "%'"
    '     End If

    '     Dim cmd As SqlCommand = New SqlCommand(sql, cn)
    '     cn.Open()
    '     Dim dr As SqlDataReader = cmd.ExecuteReader
    '     Dim i As Integer = 0
    '     'emp.Clear()
    '     'Dim arr(10) As String
    '     Dim data As New List(Of String)()
    '     While dr.Read
    '         data.Add(dr.Item(0).ToString)
    '         i += 1
    '     End While
    '     cn.Close()
    '     Return data.ToArray
    ' End Function


    <WebMethod()> _
    <System.Web.Script.Services.ScriptMethod()> _
    Public Function GetCompletionList(ByVal prefixText As String, ByVal count As Integer) As System.String()
        'Dim emp As ArrayList = New ArrayList()
        Dim sql As String
        sql = "Select convert(varchar(5),Mapping_code)  from JCT_cst_mapping_master where status=''"
        Dim cmd As SqlCommand = New SqlCommand(sql, cn)
        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader
        Dim i As Integer = 0
        'emp.Clear()
        'Dim arr(10) As String
        Dim data As New List(Of String)()
        While dr.Read
            data.Add(dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return data.ToArray
    End Function

    <WebMethod()> _
       <System.Web.Script.Services.ScriptMethod()> _
       Public Function GetCompletionList1(ByVal prefixText As String, ByVal count As Integer) As System.String()
        '        Dim constr As String = "data source = miserp; initial catalog = hspdev; user id = hspempg; password = hspempg"
        '        Dim cn As SqlConnection = New SqlConnection(constr)
        Dim sql As String
        sql = "Select description from JCT_cst_mapping_master where description like '" & prefixText & "%' and status<>'D'"
        Dim cmd As SqlCommand = New SqlCommand(sql, cn)
        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader
        Dim i As Integer = 0
        'emp.Clear()
        'Dim arr(10) As String
        Dim data As New List(Of String)()
        While dr.Read
            data.Add(dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return data.ToArray
    End Function

    <WebMethod()> _
      <System.Web.Script.Services.ScriptMethod()> _
      Public Function GetMappingProc(ByVal prefixText As String, ByVal count As Integer) As System.String()
        '        Dim constr As String = "data source = miserp; initial catalog = hspdev; user id = hspempg; password = hspempg"
        '        Dim cn As SqlConnection = New SqlConnection(constr)
        Dim sql As String
        sql = "Sp_objects '" & prefixText & "',p"
        Dim cmd As SqlCommand = New SqlCommand(sql, cn)
        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        Dim i As Integer = 0
        'emp.Clear()
        'Dim arr(10) As String
        Dim data As New List(Of String)()
        While dr.Read
            data.Add(dr.Item(0).ToString)
            i += 1
        End While
        'Return Item(0).ToArray()
        cn.Close()
        Return data.ToArray
        ' ''Dim dt As New System.Data.DataTable

        ' ''adp.Fill(dt)

        ' ''Dim items As New List(Of String)

        ' ''For i As Integer = 0 To dt.Rows.Count

        ' ''    Dim datafile

        ' ''    datafile = UCase(dt.Rows(i).Item("RecMerk"))

        ' ''    i += 1

        ' ''    items.Add(datafile)

        ' ''Next
    End Function

    '<WebMethod()> _
    ' <System.Web.Script.Services.ScriptMethod()> _
    ' Public Function GetFinYear(ByVal prefixText As String, ByVal count As Integer) As System.String()
    '    '        Dim constr As String = "data source = miserp; initial catalog = hspdev; user id = hspempg; password = hspempg"
    '    '        Dim cn As SqlConnection = New SqlConnection(constr)
    '    'To Be Used In sub Group Mapping
    '    Dim sql As String, TempAppend As String, Fin As String
    '    sql = "select right(ltrim(rtrim(fs_description)),4) from fms..fs_accounting_period where fin_yr_code >= '10' and acc_prd_code = '01' order by fin_yr_code"
    '    'sql = "Sp_objects '" & prefixText & "',u"
    '    Dim cmd As SqlCommand = New SqlCommand(sql, cn)
    '    cn.Open()
    '    Dim dr As SqlDataReader = cmd.ExecuteReader
    '    Dim i As Integer = 0
    '    Dim data As New List(Of String)()
    '    While dr.Read
    '        TempAppend = vb.Right(dr.Item(0), 2)
    '        TempAppend = CStr(CInt(TempAppend) + 1)
    '        If Len(TempAppend) = 1 Then
    '            TempAppend = " - 0" & TempAppend
    '        Else
    '            TempAppend = " - " & TempAppend
    '        End If
    '        Fin = dr.Item(0) & TempAppend
    '        'cboYear.Items.Add(dr.Item(0) & TempAppend)
    '        data.Add(Fin)
    '        i += 1
    '    End While
    '    cn.Close()
    '    Return data.ToArray
    'End Function

    '<WebMethod()> _
    '<System.Web.Script.Services.ScriptMethod()> _
    'Public Function GetAccountNo(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As System.String()
    '    Dim sql As String
    '    If contextKey = "ALL" Then
    '        sql = "select account_no from reportdb..contribution_gl_cost_mapping_new where glsubc not in (select std_name from jct_cst_standard_master where status='') and account_no not in (select type_no from jct_cst_subgroup_mapping)  order by glsubc"
    '    Else
    '        sql = "select account_no from reportdb..contribution_gl_cost_mapping_new where glsubc not in (select std_name from jct_cst_standard_master where status='') and account_no not in (select type_no from jct_cst_subgroup_mapping) and glsubc='" & contextKey & "' order by glsubc"
    '    End If

    '    'sql = "Sp_objects '" & prefixText & "',u"
    '    Dim cmd As SqlCommand = New SqlCommand(sql, cn)
    '    cn.Open()
    '    Dim dr As SqlDataReader = cmd.ExecuteReader
    '    Dim i As Integer = 0
    '    Dim data As New List(Of String)()
    '    While dr.Read
    '        data.Add(dr.Item(0).ToString)
    '        i += 1
    '    End While
    '    cn.Close()
    '    Return data.ToArray
    'End Function

    Function GetIPAddress(ByVal CompName As String) As String
        Dim oAddr As System.Net.IPAddress
        Dim sAddr As String
        With System.Net.Dns.GetHostEntry(CompName)
            oAddr = New System.Net.IPAddress(.AddressList(0).Address)
            sAddr = oAddr.ToString
        End With
        GetIPAddress = sAddr
    End Function
    <WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Function GetParentCatg(ByVal prefixText As String, ByVal count As Integer) As String()
        qry = "select shortdesc + '-->' + isnull(parentcatg,'') + catg from JCT_DMS_Master_Category where shortdesc + parentcatg + catg like '%" & prefixText & "%'"
        cmd = New SqlCommand(qry, cn)
        cn.Open()
        dr = cmd.ExecuteReader()
        Dim data As New List(Of String)()
        While dr.Read()
            data.Add(dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return data.ToArray
    End Function
    '-----------------------------------------------------------
    <WebMethod()> _
<System.Web.Script.Services.ScriptMethod()> _
Public Function GetState(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        Sql = "SELECT Distinct state FROM JCT_EPOR_STATE_MASTER WHERE State LIKE '" & prefixText & "%' "
        Dim Cmd As SqlCommand = New SqlCommand(Sql, Cn)
        Cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        Cn.Close()
        Return Data.ToArray
    End Function
    <WebMethod()> _
    <System.Web.Script.Services.ScriptMethod()> _
    Public Function GetCity(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As System.String()
        Dim Sql As String
        Sql = "SELECT City FROM JCT_EPOR_STATE_MASTER WHERE CITY LIKE '" & prefixText & "%' and state = '" & contextKey & "'"
        Dim Cmd As SqlCommand = New SqlCommand(Sql, Cn)
        Cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        Cn.Close()
        Return Data.ToArray
    End Function

    <WebMethod()> _
    <System.Web.Script.Services.ScriptMethod()> _
    Public Function GetParentDepartment(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        Sql = "SELECT  distinct b.longdesc  FROM hspdev..JCT_Epor_MASTER_Dept a,hspdev..JCT_Epor_MASTER_Dept b where a.parentdept=b.dept_code and a.LongDesc LIKE '" & prefixText & "%' and  a.status='A' and  b.status='A'"
        Dim Cmd As SqlCommand = New SqlCommand(Sql, Cn)
        Cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        Cn.Close()
        Return Data.ToArray
    End Function
    <WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Function GetDepartment(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As System.String()
        Dim Sql As String

        If contextKey <> "ALL" Then
            Sql = "SELECT  distinct a.longdesc  FROM hspdev..JCT_Epor_MASTER_Dept a,hspdev..JCT_Epor_MASTER_Dept b where a.parentdept=b.dept_code and b.LongDesc LIKE '" & prefixText & "%' and (b.LongDesc = '" & contextKey & "' or '" & contextKey & "'='' or '" & contextKey & "'='ALL') and a.status='A' and b.status='A'"

        Else
            Sql = "SELECT  distinct longdesc  FROM hspdev..JCT_Epor_MASTER_Dept   where  LongDesc LIKE '" & prefixText & "%' and status='A' "
        End If

        Dim Cmd As SqlCommand = New SqlCommand(Sql, Cn)
        Cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        Cn.Close()
        Return Data.ToArray
    End Function

    <WebMethod()> _
   <System.Web.Script.Services.ScriptMethod()> _
   Public Function GetDesg(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        Sql = "SELECT DISTINCT LongDesc FROM hspdev.. JCT_Epor_MASTER_designation WHERE LongDesc LIKE '" & prefixText & "%' and status='A'  "
        Dim Cmd As SqlCommand = New SqlCommand(Sql, Cn)
        Cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        Cn.Close()
        Return Data.ToArray
    End Function
    <WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Function GetCatg(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As System.String()
        Dim Sql As String
        Sql = "SELECT DISTINCT Category FROM hspdev.. JCT_Epor_MASTER_designation WHERE   Category LIKE '" & prefixText & "%' and (  longdesc='" & contextKey & "' or '" & contextKey & "'='All' or  '" & contextKey & "'='') and status='A' "
        Dim Cmd As SqlCommand = New SqlCommand(Sql, Cn)
        Cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        Cn.Close()
        Return Data.ToArray
    End Function

    <WebMethod()> _
 <System.Web.Script.Services.ScriptMethod()> _
 Public Function GetDiv(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        Sql = "SELECT DISTINCT Description FROM hspdev..Jct_Epor_Div_Area_Master WHERE type='DIV' and Description LIKE '" & prefixText & "%' and status='A' "
        Dim Cmd As SqlCommand = New SqlCommand(Sql, Cn)
        Cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        Cn.Close()
        Return Data.ToArray
    End Function

    <WebMethod()> _
 <System.Web.Script.Services.ScriptMethod()> _
 Public Function GetCard(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        Sql = "SELECT DISTINCT  CardNo FROM hspdev..JCT_EPOR_MASTER_EMPLOYEE WHERE     CardNo LIKE '" & prefixText & "%'  and status='A' order by cardno "
        Dim Cmd As SqlCommand = New SqlCommand(Sql, Cn)
        Cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        Cn.Close()
        Return Data.ToArray
    End Function
    <WebMethod()> _
<System.Web.Script.Services.ScriptMethod()> _
Public Function GetEmpCode(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        Sql = "SELECT DISTINCT  EMP_CODE FROM hspdev..JCT_EPOR_MASTER_EMPLOYEE WHERE     EMP_CODE LIKE '" & prefixText & "%' and status='A' order by EMP_CODE "
        Dim Cmd As SqlCommand = New SqlCommand(Sql, Cn)
        Cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        Cn.Close()
        Return Data.ToArray
    End Function
    <WebMethod()> _
<System.Web.Script.Services.ScriptMethod()> _
   Public Function GetArea(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        Sql = "SELECT DISTINCT Description FROM hspdev..Jct_Epor_Div_Area_Master WHERE type='ARE' and Description LIKE '" & prefixText & "%' and status='A' "
        Dim Cmd As SqlCommand = New SqlCommand(Sql, Cn)
        Cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        Cn.Close()
        Return Data.ToArray
    End Function
    <WebMethod()> _
   <System.Web.Script.Services.ScriptMethod()> _
   Public Function GetEmpName(ByVal prefixText As String, ByVal count As Integer) As String()
        qry = "select distinct empname from jct_empmast_base a, JCT_DMS_Trans_Upload b where a.empcode=b.empcode and active='y' and empname like '%" & prefixText & "%'"
        cmd = New SqlCommand(qry, cn)
        cn.Open()
        dr = cmd.ExecuteReader()
        Dim data As New List(Of String)()
        While dr.Read()
            data.Add(dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return data.ToArray
    End Function
    <WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Function GetItems(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
        qry = contextKey
        cmd = New SqlCommand(qry, cn)
        cn.Open()
        dr = cmd.ExecuteReader()
        Dim data As New List(Of String)()
        While dr.Read()
            data.Add(dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return data.ToArray
    End Function
    '''Add this Service by Hitesh on 9/Jan/2010
    <WebMethod()> _
<System.Web.Script.Services.ScriptMethod()> _
Public Function GetProceduredUsedInEvaluator(ByVal prefixText As String, ByVal count As Integer) As String()
        qry = "SELECT NAME FROM SYSOBJECTS WHERE NAME like '%" & prefixText & "%'"
        cmd = New SqlCommand(qry, cn)
        cn.Open()
        dr = cmd.ExecuteReader()
        Dim data As New List(Of String)()
        While dr.Read()
            data.Add(dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return data.ToArray
    End Function



    <WebMethod()> _
<System.Web.Script.Services.ScriptMethod()> _
    Public Function CostCenter(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        ' Sql = "SELECT DISTINCT Fullname + ' : ' + Emp_Code as FullName FROM JCT_EPOR_MASTER_EMPLOYEE WHERE FullName LIKE '" & prefixText & "%' and status='A' and (Date_of_Leaving is null or Date_of_Leaving<getdate())  and Company_Code = '" & contextKey & "' order by FullName "
        ' Sql = "SELECT	DISTINCT  a.empname + ' :    '+ a.Desg + '     : ' + b.Deptname as FullName FROM jct_empmast_base a inner join deptmast b 	on a.deptcode = b.deptcode	WHERE a.empname LIKE '" & prefixText & "%' and a.active='Y' and (a.DOL is null or a.DOL<getdate())   "
        'Sql = "select ma_Center_ldesc +'~'+ ma_center_no from miserp.common.dbo.mac_cost_center where ma_effective_date<=getdate() and ma_expiry_date>=GETDATE() and  ma_center_ldesc like '%" + prefixText + "%'"
        Sql = "SELECT  Name + '~' + CostCenter as Name1 FROM JCT_HSP_CostCenters where name like '%" + prefixText + "%'"
        Dim Cmd As SqlCommand = New SqlCommand(Sql, cn)
        cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return Data.ToArray
    End Function



    <WebMethod()> _
<System.Web.Script.Services.ScriptMethod()> _
    Public Function CustomerAddress_CourierSystem(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        ' Sql = "SELECT DISTINCT Fullname + ' : ' + Emp_Code as FullName FROM JCT_EPOR_MASTER_EMPLOYEE WHERE FullName LIKE '" & prefixText & "%' and status='A' and (Date_of_Leaving is null or Date_of_Leaving<getdate())  and Company_Code = '" & contextKey & "' order by FullName "
        ' Sql = "SELECT	DISTINCT  a.empname + ' :    '+ a.Desg + '     : ' + b.Deptname as FullName FROM jct_empmast_base a inner join deptmast b 	on a.deptcode = b.deptcode	WHERE a.empname LIKE '" & prefixText & "%' and a.active='Y' and (a.DOL is null or a.DOL<getdate())   "
        Sql = "Select distinct Name + ' ~ ' + City  from JCT_HSP_Courier_Customer_Master where  name like '%" & prefixText & "%' or cust_code like '%" & prefixText & "%' and status='A' "
        Dim Cmd As SqlCommand = New SqlCommand(Sql, cn)
        cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return Data.ToArray
    End Function
    <WebMethod()> _
<System.Web.Script.Services.ScriptMethod()> _
    Public Function SupplierAddress_CourierSystem(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        ' Sql = "SELECT DISTINCT Fullname + ' : ' + Emp_Code as FullName FROM JCT_EPOR_MASTER_EMPLOYEE WHERE FullName LIKE '" & prefixText & "%' and status='A' and (Date_of_Leaving is null or Date_of_Leaving<getdate())  and Company_Code = '" & contextKey & "' order by FullName "
        ' Sql = "SELECT	DISTINCT  a.empname + ' :    '+ a.Desg + '     : ' + b.Deptname as FullName FROM jct_empmast_base a inner join deptmast b 	on a.deptcode = b.deptcode	WHERE a.empname LIKE '" & prefixText & "%' and a.active='Y' and (a.DOL is null or a.DOL<getdate())   "
        Sql = "Select distinct NAME + ' ~ ' + City  from Jct_HSP_Courrier_Vendors where  name like '%" & prefixText & "%' or vendorcode like '%" & prefixText & "%' and status='A'"
        Dim Cmd As SqlCommand = New SqlCommand(Sql, cn)
        cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return Data.ToArray
    End Function

    <WebMethod()> _
<System.Web.Script.Services.ScriptMethod()> _
    Public Function OtherPartyAddress_CourierSystem(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        ' Sql = "SELECT DISTINCT Fullname + ' : ' + Emp_Code as FullName FROM JCT_EPOR_MASTER_EMPLOYEE WHERE FullName LIKE '" & prefixText & "%' and status='A' and (Date_of_Leaving is null or Date_of_Leaving<getdate())  and Company_Code = '" & contextKey & "' order by FullName "
        ' Sql = "SELECT	DISTINCT  a.empname + ' :    '+ a.Desg + '     : ' + b.Deptname as FullName FROM jct_empmast_base a inner join deptmast b 	on a.deptcode = b.deptcode	WHERE a.empname LIKE '" & prefixText & "%' and a.active='Y' and (a.DOL is null or a.DOL<getdate())   "
        Sql = "Select distinct PartyName from jct_courier_other_Address where  PartyName like '%" & prefixText & "%' "
        Dim Cmd As SqlCommand = New SqlCommand(Sql, cn)
        cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return Data.ToArray
    End Function


    <WebMethod()> _
    <System.Web.Script.Services.ScriptMethod()> _
    Public Function Email_IDs(ByVal prefixText As String, ByVal count As Integer) As System.String()
        Dim Sql As String
        Sql = "SELECT distinct   a.Name +'~' + c.DEPTNAME +'~'+ a.empcode FROM MISTEL a INNER JOIN dbo.JCT_EmpMast_Base b ON a.empcode=b.empcode  INNER JOIN DEPTMAST c ON b.deptcode=c.DEPTCODE  where a.name like '%" + prefixText + "%'"
        Dim Cmd As SqlCommand = New SqlCommand(Sql, cn)
        cn.Open()
        Dim Dr As SqlDataReader = Cmd.ExecuteReader
        Dim i As Integer = 0
        Dim Data As New List(Of String)()
        While Dr.Read
            Data.Add(Dr.Item(0).ToString)
            i += 1
        End While
        cn.Close()
        Return Data.ToArray
    End Function

	
	
	 <WebMethod()> _
    <System.Web.Script.Services.ScriptMethod()> _
    Public Function GetEmployee_sh_Common(ByVal prefixText As String, ByVal count As Integer) As System.String()

        Dim Sql As String

        Dim cn As SqlConnection = New SqlConnection("Data Source=misdev;Initial Catalog=jctdev;User ID=itgrp;Password=power")

        cn.Open()

        'Sql = "SELECT DISTINCT( a.EmployeeName + '|' + a.EmployeeCode ) AS Employee FROM   dbo.JCT_payroll_employees_master a WHERE   a.EmployeeName LIKE '" & prefixText & "%' AND a.active = 'Y' AND ( a.DOLeaving IS NULL OR a.DOLeaving < GETDATE()) "

        Sql = "SELECT DISTINCT( a.EmployeeName + '|' + a.NewEmployeeCode ) AS Employee FROM   dbo.JCT_payroll_employees_master a WHERE   a.EmployeeName LIKE '" & prefixText & "%' AND a.active = 'Y' AND ( a.DOLeaving IS NULL OR a.DOLeaving < GETDATE()) "

        Dim Cmd As SqlCommand = New SqlCommand(Sql, cn)

        Dim Dr As SqlDataReader = Cmd.ExecuteReader

        Dim i As Integer = 0

        Dim Data As New List(Of String)()

        While Dr.Read

            Data.Add(Dr.Item(0).ToString)

            i += 1

        End While

        cn.Close()

        Return Data.ToArray

    End Function
	
	
	  <WebMethod()> _
    <System.Web.Script.Services.ScriptMethod()> _
    Public Function GetEmployeeName(ByVal prefixText As String, ByVal count As Integer) As System.String()

        Dim Sql As String

        Dim cn As SqlConnection = New SqlConnection("Data Source=misdev;Initial Catalog=jctdev;User ID=itgrp;Password=power")

        cn.Open()

        'Sql = "SELECT DISTINCT( a.EmployeeName + '|' + a.EmployeeCode ) AS Employee FROM   dbo.JCT_payroll_employees_master a WHERE   a.EmployeeName LIKE '" & prefixText & "%' AND a.active = 'Y' AND ( a.DOLeaving IS NULL OR a.DOLeaving < GETDATE()) "

        Sql = "SELECT DISTINCT a.EmployeeName  AS Employee FROM   dbo.JCT_payroll_employees_master a WHERE   a.EmployeeName LIKE '" & prefixText & "%' AND a.active = 'Y' AND ( a.DOLeaving IS NULL OR a.DOLeaving < GETDATE()) "

        Dim Cmd As SqlCommand = New SqlCommand(Sql, cn)

        Dim Dr As SqlDataReader = Cmd.ExecuteReader

        Dim i As Integer = 0

        Dim Data As New List(Of String)()

        While Dr.Read

            Data.Add(Dr.Item(0).ToString)

            i += 1

        End While

        cn.Close()

        Return Data.ToArray

    End Function





End Class
