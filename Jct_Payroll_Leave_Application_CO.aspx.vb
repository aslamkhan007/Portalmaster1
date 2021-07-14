Imports System.Data.SqlClient
Imports System.Net.Mail.MailMessage
Imports System.Net.Mail.SmtpClient
Imports System.Data
Imports System.Net.Mail
Imports Telerik.Web.UI

Partial Class Jct_Payroll_Leave_Application_CO
    Inherits System.Web.UI.Page
    Dim strTo As String, strFrom As String, strSubject As String, SqlPass As String, Sqlpass1 As String, con As String
    Dim EmailTO, EmailTO1, EmailFrom, EmailCc, EmailBcc, EmailBcc1, Checkflag, Checkflag1 As String
    Dim CheckError As Boolean = False, CheckRecord As Boolean = False, CheckDate As Boolean = False
    Dim Auto1 As Int64, Difference As Integer, CountMail As Integer = 0
    Dim checkmes As String
    Dim Obj As New Connection
    Dim Cmd As New SqlCommand
    Dim obj1 As Functions = New Functions
    Dim CheckEligile As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Empcode").ToString <> "") Then
        Else
            Response.Redirect("~/login.aspx")
        End If
        If IsPostBack = False Then

            ModalPopupExtender1.Enabled = False
            ModalPopupExtender1.Hide()
            toshowfirstrow()

            If mapping_check() = False Then

                ClientScript.RegisterClientScriptBlock(Me.GetType, "Day", "<script language = javascript>alert('Dear User ,You are not mapped under your concerned Head.As per Employee Gateway Leave requirements, our employee gateway system requires mapping of employee with his/her concerned Head for leave authorization. So please forward a mail to IT Help Desk from your concerned Head to map you under him/her . Also, this mail would include yours and your Head’s salary codes. The CC of that mail should be done through your Head Of Department. Incase of any problem, please contact 4226')</script>")
                Me.Label16.Visible = True
                Me.LinkButton4.Visible = True
                LinkButton4.PostBackUrl = "Guest_Book.aspx?trans1=y"

            Else

                Me.LinkButton4.Visible = False
                Me.Label16.Visible = False


                '------------------------------------Punch-----------------------

                If Request.QueryString.Get("trans1") = Nothing Then
                    LinkButton3.Visible = False
                    LinkButton3.PostBackUrl = "Punch.aspx"
                Else

                    LinkButton3.Visible = True
                    Dim a As String = Left(Request.QueryString.Get("trans1"), 12)
                    a = Right(a, 10)
                    'Me.TxtLeaveFrom.SelectedDate = a
                    'Me.TxtLeaveTo.SelectedDate = a
                    LinkButton3.Text = "Back"
                    LinkButton3.PostBackUrl = Nothing
                    LinkButton3.OnClientClick = "javascript:window.history.go(-1);return false;"

                End If


                '------------------------------End Punch-------------------------



            End If

            LeaveMsg()

        End If
    End Sub
    Public Function mapping_check() As Boolean
        Obj.ConOpen()
        'Dim s1 As String = "select * from jct_emp_hod where emp_code='" & Trim(Session("Empcode")) & "' and status is null"
        Dim s1 As String = "SELECT 1 FROM Jct_Payroll_WorkFlow_Request WHERE RequsterCode = '" & Trim(Session("Empcode")) & "' AND Status = 'A' and AreaApply = 'Leave'  "

        Cmd = New SqlCommand(s1, Obj.Connection())
        Dim dr As SqlDataReader = Cmd.ExecuteReader()
        dr.Read()
        If dr.HasRows = True Then
            mapping_check = True
        Else
            mapping_check = False
        End If
        dr.Close()
        Obj.ConClose()
        Return mapping_check
    End Function


    'Public Function ShortLeaveChecking() As Boolean

    '    If Trim(ddlleave.Text) = "Short Leave" Then

    '        ' Dim SqlPass5 As String = "SELECT  COUNT(*) FROM    JCTDEV..jct_empg_leave  WHERE   EmpCode ='" & Session("Empcode") & "'  AND NatureLeave =   '" & Trim(ddlleave.Text) & "' AND   MONTH( LeaveFrom) = MONTH('" & Trim(TxtLeaveFrom.SelectedDate) & "')  AND   YEAR( LeaveFrom) = YEAR  ('" & Trim(TxtLeaveFrom.SelectedDate) & "')   AND ISNULL(MainFlag, '') IN ( 'A', 'P', '' )"
    '        Dim SqlPass5 As String = "SELECT  COUNT(EmployeeCode) FROM    Jct_Payroll_OnLine_Request  WHERE   EmployeeCode ='" & Session("Empcode") & "'  AND LeaveNature =   '" & Trim(ddlleave.Text) & "' AND   MONTH( FromDate) = MONTH('" & Trim(TxtLeaveFrom.SelectedDate) & "')  AND   YEAR( FromDate) = YEAR  ('" & Trim(TxtLeaveFrom.SelectedDate) & "')   AND ISNULL(Status, '') IN ( 'A', 'P', '' ) and RequestArea='Leave'"
    '        Dim Dr5 As SqlDataReader = Obj.FetchReader(SqlPass5)
    '        Try
    '            If Dr5.HasRows = True Then
    '                While Dr5.Read()
    '                    If Dr5.Item(0) > 0 Then
    '                        ClientScript.RegisterClientScriptBlock(Me.GetType, "ComLeaveAlreExist2", "<script language = javascript>alert('One Short Leave already apply for month ')</script>")
    '                        ShortLeaveChecking = False
    '                    Else
    '                        ShortLeaveChecking = True
    '                    End If
    '                End While

    '            End If
    '            Dr5.Close()
    '        Catch ex As Exception
    '        Finally
    '            Obj.ConClose()
    '        End Try
    '    End If

    'End Function

    Public Function LeaveFromToDaysDiffeChecking(LeaveFrom As DateTime, LeaveTo As DateTime, days As Decimal) As Boolean
        If Trim(LeaveFrom) <> Trim(LeaveTo) Then
            'Dim SqlPass55 As String = "SELECT    DATEDIFF(dd,'" & Trim(TxtLeaveFrom.SelectedDate) & "','" & Trim(TxtLeaveTo.SelectedDate) & "') + 1  "
            Dim SqlPass55 As String = "Jct_Payroll_Validate_Multiple_Days '" & Trim(LeaveFrom) & "','" & Trim(LeaveTo) & "','" & Trim(days) & "'"
            Dim Dr55 As SqlDataReader = Obj.FetchReader(SqlPass55)
            Try
                If Dr55.HasRows = True Then
                    While Dr55.Read()
                        If Dr55.Item(0) <> Val(days) Then
                            ClientScript.RegisterClientScriptBlock(Me.GetType, "EnterDays", "<script language = javascript>alert('Please Check the enter days ')</script>")
                            LeaveFromToDaysDiffeChecking = False
                        Else
                            LeaveFromToDaysDiffeChecking = True
                        End If
                    End While

                End If
                Dr55.Close()
            Catch ex As Exception
            Finally
                Obj.ConClose()
            End Try

        Else
            LeaveFromToDaysDiffeChecking = True

        End If
    End Function


    'Public Function CasualLeaveChecking() As Boolean

    '    If Trim(ddlleave.Text) = "Casual Leave" Then

    '        'Dim SqlPass6 As String = "SELECT  COUNT(*) FROM    JCTDEV..jct_empg_leave  WHERE   EmpCode ='" & Session("Empcode") & "'  AND NatureLeave =   '" & Trim(ddlleave.Text) & "' AND  MONTH( LeaveFrom) = MONTH('" & Trim(TxtLeaveFrom.SelectedDate) & "')  AND  YEAR( LeaveFrom) = YEAR('" & Trim(TxtLeaveFrom.SelectedDate) & "')     AND ISNULL(MainFlag, '') IN ( 'A', 'P', '' )  AND Days IN ( '0.5', '1.5', '.5', '2.5' )"
    '        Dim SqlPass6 As String = "SELECT  COUNT(EmployeeCode) FROM    Jct_Payroll_OnLine_Request  WHERE   EmployeeCode ='" & Session("Empcode") & "'  AND LeaveNature =   '" & Trim(ddlleave.Text) & "' AND  MONTH( FromDate) = MONTH('" & Trim(TxtLeaveFrom.SelectedDate) & "')  AND  YEAR( FromDate) = YEAR('" & Trim(TxtLeaveFrom.SelectedDate) & "')     AND ISNULL(Status, '') IN ( 'A', 'P', '' )  AND leaveDays IN ( '0.5', '1.5', '.5', '2.5' )  and RequestArea='Leave'"
    '        Dim Dr6 As SqlDataReader = Obj.FetchReader(SqlPass6)
    '        Try
    '            If Dr6.HasRows = True Then
    '                While Dr6.Read()
    '                    If Dr6.Item(0) >= 2 Then
    '                        ClientScript.RegisterClientScriptBlock(Me.GetType, "CasualLeaveeAlreExist2", "<script language = javascript>alert('2 Half Casual Leave already apply for this month  ')</script>")
    '                        CasualLeaveChecking = False
    '                    Else
    '                        CasualLeaveChecking = True
    '                    End If
    '                End While

    '            End If
    '            Dr6.Close()
    '        Catch ex As Exception
    '        Finally
    '            Obj.ConClose()
    '        End Try
    '    End If

    'End Function

    'Public Function SameDayMultipleLeaveChecking(LeaveFrom As DateTime) As Boolean
    '    'If Trim(ddlleave.Text) = "Casual Leave" Then
    '    Dim SqlPass6 As String = "SELECT  count(EmployeeCode) From Jct_Payroll_OnLine_Request WHERE   EmployeeCode = '" & Session("Empcode") & "' AND     FromDate   = '" & Trim(LeaveFrom) & "'  and RequestArea='Leave' And status not in ('c')"
    '    Dim Dr6 As SqlDataReader = Obj.FetchReader(SqlPass6)
    '    Try
    '        If Dr6.HasRows = True Then
    '            While Dr6.Read()
    '                If Dr6.Item(0) >= 1 Then
    '                    ClientScript.RegisterClientScriptBlock(Me.GetType, "CasualLeaveeAlreExist2", "<script language = javascript>alert('Leave already apply for this Date.Pls Contact Administrator')</script>")
    '                    SameDayMultipleLeaveChecking = False
    '                Else
    '                    SameDayMultipleLeaveChecking = True
    '                End If
    '            End While

    '        End If
    '        Dr6.Close()
    '    Catch ex As Exception
    '    Finally
    '        Obj.ConClose()
    '    End Try
    '    'End If
    'End Function

    Public Function LeaveApplyForOctOnwards(LeaveFrom As DateTime) As Boolean
        'If Trim(TxtLeaveFrom.SelectedDate) <= "09/30/2018" Then        
        If LeaveFrom <= Convert.ToDateTime("09/30/2018") Then
            Try
                ClientScript.RegisterClientScriptBlock(Me.GetType, "CasualLeaveeAlreExist2", "<script language = javascript>alert('Leave Should be > 30Sep18')</script>")
                LeaveApplyForOctOnwards = False
            Catch ex As Exception
            Finally
                Obj.ConClose()
            End Try
            'End If
        Else
            LeaveApplyForOctOnwards = True
        End If

    End Function


    'Public Function WeeklyOffCheck() As Boolean
    '    'If Trim(ddlleave.Text) = "Casual Leave" Then
    '    'Dim SqlPass6 As String = "SELECT  COUNT(*) From Jct_Payroll_OnLine_Request WHERE   EmployeeCode = '" & Session("Empcode") & "' AND     FromDate   = '" & Trim(TxtLeaveFrom.SelectedDate) & "'"
    '    Dim SqlPass6 As String = "SELECT  COUNT(b.CardNo) FROM    Jct_Payroll_Employee_Wo AS a INNER JOIN dbo.JCT_payroll_employees_master AS b ON a.paycode = b.CardNo INNER JOIN Jct_Payroll_OnLine_Request AS c ON c.EmployeeCode = b.NewEmployeeCode WHERE   a.NexttoWO = '" & Trim(TxtLeaveFrom.SelectedDate) & "' AND b.STATUS = 'A' AND b.Active = 'Y' AND b.NewEmployeeCode = '" & Session("Empcode") & "' AND a.PrvDay = c.FromDate"
    '    Dim Dr6 As SqlDataReader = Obj.FetchReader(SqlPass6)
    '    Try
    '        If Dr6.HasRows = True Then
    '            While Dr6.Read()
    '                If Dr6.Item(0) >= 1 Then
    '                    ClientScript.RegisterClientScriptBlock(Me.GetType, "CasualLeaveeAlreExist2", "<script language = javascript>alert('Due to on Leave Before WO fill leave on WO also')</script>")
    '                    WeeklyOffCheck = False
    '                Else
    '                    WeeklyOffCheck = True
    '                End If
    '            End While

    '        End If
    '        Dr6.Close()
    '    Catch ex As Exception
    '    Finally
    '        Obj.ConClose()
    '    End Try
    '    'End If

    'End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdapply.Click
        Try
            For Each gvRow As GridViewRow In grdDetail.Rows
                '------------------------------------------------------------------------------------------------------------------------------
                Dim txtAcqDtfroms As RadDatePicker = CType(gvRow.FindControl("txtAcqDtfrom"), RadDatePicker)
                Dim txtToDates As RadDatePicker = CType(gvRow.FindControl("txtToDate"), RadDatePicker)
                Dim txtEarnedDates As RadDatePicker = CType(gvRow.FindControl("txtEarnedDate"), RadDatePicker)
                Dim txtNoOfItemss As RadNumericTextBox = CType(gvRow.FindControl("txtNoOfItems"), RadNumericTextBox)

                If ddlleave.Text = "Compensatry Leave" Then
                    If CompensatoryChecking(txtEarnedDates.SelectedDate, Convert.ToDecimal(txtNoOfItemss.Text)) = False Then
                        Exit Sub
                    End If
                End If

                If LeaveFromToDaysDiffeChecking(txtAcqDtfroms.SelectedDate, txtToDates.SelectedDate, Convert.ToDecimal(txtNoOfItemss.Text)) = False Then
                    Exit Sub
                End If


                'If SameDayMultipleLeaveChecking(txtAcqDtfroms.SelectedDate) = False Then
                '    Exit Sub
                'End If

                If LeaveApplyForOctOnwards(txtAcqDtfroms.SelectedDate) = False Then
                    Exit Sub
                End If


                CheckDateGreater(txtAcqDtfroms.SelectedDate, txtToDates.SelectedDate)
                If CheckDate = True Then
                    ClientScript.RegisterClientScriptBlock(Me.GetType, "R4", "<script language = javascript>alert('LeaveFrom Date should be less than LeaveTo')</script>")
                    Exit Sub
                End If
                '------------------------------------------------------------------------------------------------------------------------------
                EmailIDFrom()

                '------------------------------------------------------------------------------------------------------------------------------
                'Define the Class
                '------------------------------------------------------------------------------------------------------------------------------

                Dim Client As New Net.Mail.SmtpClient
                Dim Message As New Net.Mail.MailMessage

                '------------------------------------------------------------------------------------------------------------------------------
                'Severe Name & Prot number
                '------------------------------------------------------------------------------------------------------------------------------
                Client.Host = "EXCHANGE2k7"
                Client.Port = 25
                '-----------------------------------------------------------------------------------------------------------------------------

                '------------------------------------------------------------------------------------------------------------------------------
                'Send message for To
                '------------------------------------------------------------------------------------------------------------------------------

                'Dim SqlPass = "SELECT e_mailid from JCTDEV..JCT_EMP_HOD a,JCTDEV..MISTEL b WHERE b.EmpCode=a.Resp_Emp and  emp_code='" & Session("Empcode") & "' and flag in('1H','2T','3C','B1','B2','B3','B4','B5') and status is null AND Auth_Req='Y'and Days=0 and a.Company_Code='" & Session("Companycode") & "'  UNION SELECT e_mailid from JCTDEV..JCT_EMP_HOD a,JCTDEV..MISTEL b WHERE b.EmpCode=a.Resp_Emp and  emp_code='" & Session("Empcode") & "' and flag in('1H','2T','3C','B1','B2','B3','B4','B5') and status is null AND Auth_Req='Y'and days between 0 and " & Txtdays.Text & " and a.Company_Code='" & Session("Companycode") & "' "
                Dim SqlPass = "SELECT TOP (1) lower(c.EmailID) as EmailID  FROM  Jct_Payroll_WorkFlow_Request a, JCT_payroll_employees_master b,Jct_Payroll_Emp_Address_Detail c WHERE a.RequsterCode = '" & Session("Empcode") & "' AND   a.Status   ='A'  AND   a.ActionFlag = '1' AND   a.ActionTakenBy = b.NewEmployeeCode AND   b.Active = 'Y' AND   b.STATUS  ='A' AND   b.EmployeeCode  = c.EmployeeCode  AND   c.Status  ='A' AND a.AreaApply= 'Leave' "
                Dim Dr As SqlDataReader = Obj.FetchReader(SqlPass)
                Try
                    If Dr.HasRows = True Then

                        While Dr.Read()

                            If Not (Dr.Item(0) Is System.DBNull.Value) Then

                                EmailTO = Dr.Item(0)

                                If (EmailTO = "kamal_bhasin@jctltd.com") Then
                                    EmailFrom = "approvals@jctltd.com"
                                ElseIf (EmailTO = "rbaksshi@jctltd.com") Then
                                    EmailFrom = "approvals@jctltd.com"
                                Else

                                    EmailFrom = "noreply@jctltd.com"
                                End If

                                'Message.CC.Add(ViewState("EmployeeFrom"))
                                Message.Bcc.Add("aslam@jctltd.com")
                                'Message.Bcc.Add("ashish@jctltd.com")
                                'Message.To.Add(EmailTO)

                            End If
                        End While

                        'If Val(Txtdays.Text) > 3 And ddlleave.Text = "Sick Leave" Then
                        '    'Message.To.Add("rajan@jctltd.com")
                        '    'Message.To.Add("rajan@jctltd.com")
                        '    'plantwise
                        'End If

                        Dr.Close()

                        If EmailFrom <> "" Then
                            Dim From As New Net.Mail.MailAddress(EmailFrom)
                            Message.From = From
                        End If


                    End If

                Catch ex As Exception
                Finally
                    Obj.ConClose()
                End Try

                Message.IsBodyHtml = True
                Message.Priority = Net.Mail.MailPriority.High

                'If ddlleave.Text = "Short Leave" Then
                '    Message.Body = Session("Mr_Mrs") + " " + StrConv(txtname.Text, VbStrConv.ProperCase) + "," + " " + StrConv(TextBox6.Text, VbStrConv.ProperCase) + "," + " " + "has applied for" + " " + StrConv(ddlleave.Text, VbStrConv.ProperCase) + " " + "," + " " + "from" + " " + Format(TxtLeaveFrom.SelectedDate, "dd/MM/yyyy") + " " + Right(Trim(txttimefrom.SelectedValue), 11) + " " + "to day time" + " " + Format(TxtLeaveTo.SelectedDate, "dd/MM/yyyy") + " " + Right(Trim(TxtTimeTo.SelectedValue), 11) & "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated through Employee Portal. <br/> <br />Kindly do not reply . <br /><br /> Thank You..!!"
                'ElseIf ddlleave.Text = "Official Duty" Then
                '    Message.Body = Session("Mr_Mrs") + " " + StrConv(txtname.Text, VbStrConv.ProperCase) + "," + " " + StrConv(TextBox6.Text, VbStrConv.ProperCase) + "," + " " + "has applied for" + " " + StrConv(ddlleave.Text, VbStrConv.ProperCase) + " " + "," + " " + "from day time " + " " + Format(TxtLeaveFrom.SelectedDate, "dd/MM/yyyy") + " " + Right(Trim(txttimefrom.SelectedValue), 11) + " " + "to day time" + " " + Format(TxtLeaveTo.SelectedDate, "dd/MM/yyyy") + " " + Right(Trim(TxtTimeTo.SelectedValue), 11) + " " + "for" + " " + Trim(Txtdays.Text) + " " + "day" + "(" + dlleavetype.Text + ")" & "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated through Employee Portal.<br /> <br/>Kindly do not reply . <br /> Thank You..!!"
                'Else
                Message.Body = Session("Mr_Mrs") + " " + StrConv(txtname.Text, VbStrConv.ProperCase) + "," + " " + StrConv(TextBox6.Text, VbStrConv.ProperCase) + "," + " " + "has applied for" + " " + StrConv(ddlleave.Text, VbStrConv.ProperCase) + " " + "," + " " + "from" + " " + Format(txtAcqDtfroms.SelectedDate, "dd/MM/yyyy") + " " + "to" + " " + Format(txtToDates.SelectedDate, "dd/MM/yyyy") + ", " + " " + "for" + " " + Trim(txtNoOfItemss.Text) + " " + "day" + "(" + dlleavetype.Text + ")" & "<br/><br/><br/><br/><br/><br/><br/> DISCLAIMER: This email is generated through Employee Portal. <br/><br />Kindly do not reply . <br /> Thank You..!!"
                'End If

                AutoGenrate(txtAcqDtfroms.SelectedDate, txtToDates.SelectedDate, txtEarnedDates.SelectedDate, Convert.ToDecimal(txtNoOfItemss.Text))

                Message.Subject = "Application for Leave :- " & ViewState("AutoID")



                If EmailTO <> "" And EmailFrom <> "" And CheckError = False Then
                    Client.Send(Message)
                End If


                '--------------------------------------------------------------------
                'Me.Txtdays.Text = ""
                'Me.txtcompleave.Text = ""
                'Me.txtpurleave.Text = ""
                'Me.ddlleave.Text = "Casual Leave"
                'Me.ddlshift.Text = "Genral Shift"
                'Me.dlleavetype.Text = "Full Day"
                'Me.TxtCoDtAgian.SelectedValue = Now()
                'Me.TxtLeaveFrom.SelectedValue = Now()
                'Me.TxtLeaveTo.SelectedValue = Now()
                'Me.txttimefrom.SelectedValue = Now()
                'Me.TxtTimeTo.SelectedValue = Now()
                'txttimefrom.Enabled = False
                'TxtTimeTo.Enabled = False


                grdDetail.DataSource = Nothing
                grdDetail.DataBind()
                cmdapply.Visible = False
                toshowfirstrow()


                If mapping_check() = False Then
                    Me.ModalPopupExtender1.Enabled = True
                    Panel1.Visible = True
                    Me.ModalPopupExtender1.TargetControlID = "cmdapply"
                    Me.ModalPopupExtender1.PopupControlID = "Panel1"
                    ModalPopupExtender1.Show()
                    Exit Sub
                End If

            Next

            ClientScript.RegisterClientScriptBlock(Me.GetType, "Por", "<script language = javascript>alert('Leave Applied Successfully.')</script>")
            LeaveMsg()

        Catch ex As Exception
            ClientScript.RegisterClientScriptBlock(Me.GetType, "hhh", "<script language = javascript>alert('" + ex.Message + "')</script>")
        Finally

        End Try

    End Sub

    Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad

        txtname.Text = obj1.Get_empname1(Session("Empcode"))
        TextBox6.Text = obj1.Get_Desg1(Session("Empcode"))
        txtdept.Text = obj1.Get_dept1(Session("Empcode"))

    End Sub

    Public Sub AutoGenrate(FromDate As DateTime, Todate As DateTime, EarnedDate As DateTime, Dayss As Decimal)
        Dim SqlPass = "SELECT ISNULL(MAX(autoid),500) AS autoid FROM Jct_Payroll_OnLine_Request"
        Dim Dr As SqlDataReader = Obj.FetchReader(SqlPass)
        Try
            If Dr.HasRows = True Then
                While Dr.Read()
                    If Not (Dr.Item(0) Is System.DBNull.Value) Then
                        Auto1 = Dr.Item(0) + 1
                        ViewState("AutoID") = Auto1
                    Else
                        Auto1 = 501
                    End If
                End While
                Dr.Close()
            End If
        Catch ex As Exception
        Finally
            Obj.ConClose()
        End Try

        '---------------------        
        Dim SqlPass1 = "select cardno FROM JCT_payroll_employees_master WHERE NewEmployeeCode='" & Session("Empcode") & "' AND active='Y' and status = 'A' "
        Dim Dr1 As SqlDataReader = Obj.FetchReader(SqlPass1)
        Try
            If Dr1.HasRows = True Then
                While Dr1.Read()
                    Session("CardNo") = Dr1(0)
                End While
                Dr1.Close()
            End If
        Catch ex As Exception
        Finally
            Obj.ConClose()
        End Try
        '------------------------

        'If Txtdays.Text = "" Then
        '    Txtdays.Text = 0
        'End If

        'CheckHC()

        Dim Tran As SqlTransaction
        If Obj.Connection.State = ConnectionState.Closed Then
            Obj.Connection.Open()
        End If
        Tran = Obj.Connection.BeginTransaction
        Try
            If ddlleave.Text = "Compensatry Leave" Then
                'SqlPass = "INSERT INTO  jctdev..jct_empg_leave(Usercode,CompanyCode,Cardno,autoid,empcode,natureleave,leavetype,name,desgination,department,shift,days,leavefrom,leaveto,compleave,purpleave,addleave,phoneleave,authflag,CurLeaveTime,CompAgainTime,FlagHC,mainflag )  VALUES('" & Trim(Session("Empcode")) & "','" & Session("Companycode") & "' ,'" & Trim(obj1.Get_CardNumber(Session("Empcode"), Session("Companycode"))) & "'," & Auto1 & ",'" & Trim(Session("Empcode")) & "', '" & Trim(ddlleave.Text) & "','" & Trim(dlleavetype.Text) & "','" & Trim(txtname.Text) & "','" & Trim(TextBox6.Text) & "','" & Trim(txtdept.Text) & "','" & Trim(ddlshift.Text) & "'," & Txtdays.Text & " ,'" & Trim(TxtLeaveFrom.SelectedDate) & "','" & Trim(TxtLeaveTo.SelectedDate) & "','" & Trim(txtcompleave.Text) & "','" & Trim(txtpurleave.Text) & "','" & Trim(txtaddleave.Text) & "','" & Trim(txtphoneleave.Text) & "','U', getdate(),'" & Trim(TxtCoDtAgian.SelectedDate) & "','" & Checkflag & "','P')"
                SqlPass = "JCT_Payroll_LeaveCO_Apply"
                Cmd = New SqlCommand(SqlPass, Obj.Connection)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.Add("@autoid", SqlDbType.Int).Value = Auto1
                Cmd.Parameters.Add("@empcode", SqlDbType.VarChar, 10).Value = Session("EmpCode")
                Cmd.Parameters.Add("@fromDate", SqlDbType.DateTime).Value = Trim(FromDate)
                Cmd.Parameters.Add("@todate", SqlDbType.DateTime).Value = Trim(Todate)
                Cmd.Parameters.Add("@LeaveNature", SqlDbType.VarChar, 50).Value = Trim(ddlleave.Text)
                Cmd.Parameters.Add("@LeaveType", SqlDbType.VarChar, 12).Value = Trim(dlleavetype.Text)
                Cmd.Parameters.Add("@LeaveDays", SqlDbType.VarChar, 5).Value = Dayss
                Cmd.Parameters.Add("@LeaveFromHrs", SqlDbType.VarChar, 12).Value = ""
                Cmd.Parameters.Add("@LeaveToHrs", SqlDbType.VarChar, 12).Value = ""
                Cmd.Parameters.Add("@LvcompAdainDt", SqlDbType.VarChar, 12).Value = Trim(EarnedDate)
                Cmd.Parameters.Add("@Remarks", SqlDbType.VarChar, 80).Value = Trim(txtpurleave.Text)
                Cmd.Parameters.Add("@Hostname", SqlDbType.VarChar, 15).Value = Request.ServerVariables("REMOTE_ADDR")
                Cmd.Transaction = Tran
                Cmd.ExecuteNonQuery()
            End If
            Tran.Commit()

        Catch ex As Exception
            Tran.Rollback()
            CheckError = True
            ClientScript.RegisterClientScriptBlock(Me.GetType, "Por", "<script language = javascript>alert('" + ex.Message + "')</script>")
            Exit Sub
        Finally
            Obj.ConClose()
        End Try
        Dr.Close()
    End Sub

    Public Sub EmailIDFrom()
        Dim SqlPass = "SELECT TOP ( 1 ) lower(b.EmailID) as EmailID  FROM  dbo.JCT_payroll_employees_master AS b  WHERE   b.NewEmployeeCode = '" & Session("Empcode") & "' AND b.STATUS = 'A' AND b.Active = 'Y'"
        Dim Dr As SqlDataReader = Obj.FetchReader(SqlPass)
        Try
            If Dr.HasRows = True Then
                While Dr.Read()
                    If Not (Dr.Item(0) Is System.DBNull.Value) Then
                        EmailFrom = Dr.Item(0)
                        ViewState("EmployeeFrom") = EmailFrom
                        EmailFrom = "noreply@jctltd.com"

                    Else
                        EmailFrom = "dummy@jctltd.com"
                    End If
                End While
                Dr.Close()
            End If
        Catch ex As Exception
        Finally
            Obj.ConClose()
        End Try

    End Sub

    'Public Sub DisComp()
    '    If ddlleave.Text = "Compensatry Leave" Then
    '        txtcompleave.Enabled = True
    '        TxtCoDtAgian.Enabled = True
    '    Else
    '        txtcompleave.Enabled = False
    '        TxtCoDtAgian.Enabled = False
    '        TxtCoDtAgian.Text = ""
    '    End If

    '    If ddlleave.Text = "Short Leave" Or ddlleave.Text = "Official Duty" Then

    '        txttimefrom.Enabled = True
    '        TxtTimeTo.Enabled = True

    '        If ddlleave.Text = "Short Leave" Then
    '            Txtdays.Text = "0"
    '            Txtdays.Enabled = False
    '        ElseIf ddlleave.Text = "Official Duty" Then
    '            Txtdays.Text = "0"
    '            Txtdays.Enabled = True
    '        Else
    '            Txtdays.Text = ""
    '            Txtdays.Enabled = True
    '        End If

    '    Else
    '        txttimefrom.Enabled = False
    '        TxtTimeTo.Enabled = False
    '        Txtdays.Text = ""
    '        Txtdays.Enabled = True
    '    End If

    'End Sub

    Protected Sub ddlleave_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlleave.SelectedIndexChanged
        'DisComp()
    End Sub

    'Public Sub SameDate()        
    '    Dim SqlPass = "SELECT 'X'  from JCTDEV..Jct_Payroll_OnLine_Request WHERE EmployeeCode='" & Session("Empcode") & "' and LeaveNature='" & ddlleave.Text & "' AND LEAVETYPE='" & Me.dlleavetype.Text & "' AND convert(smalldatetime,convert(char(12),FromDate )) = '" & Format(TxtLeaveFrom.SelectedDate, "MM/dd/yyyy") & "'  AND convert(smalldatetime,convert(char(12),ToDate )) = '" & Format(TxtLeaveTo.SelectedDate, "MM/dd/yyyy") & "' and Status  not in('C')  and RequestArea='Leave' "
    '    Dim Dr As SqlDataReader = Obj.FetchReader(SqlPass)
    '    Try
    '        If Dr.HasRows = True Then
    '            While Dr.Read()
    '                CheckRecord = True
    '            End While
    '            Dr.Close()
    '        End If
    '    Catch ex As Exception
    '    Finally
    '        Obj.ConClose()
    '    End Try
    'End Sub

    Public Sub CheckDateGreater(LeaveFrom As DateTime, LeaveTo As DateTime)
        Dim SqlPass = "SELECT  DateDiff(DD,'" & LeaveFrom & "','" & LeaveTo & "') as Difference"
        Dim Dr As SqlDataReader = Obj.FetchReader(SqlPass)
        Try
            If Dr.HasRows = True Then
                While Dr.Read()
                    If Dr.Item(0) < 0 Then
                        CheckDate = True
                    End If
                End While
                Dr.Close()
            End If
        Catch ex As Exception
        Finally
            Obj.ConClose()
        End Try

    End Sub
    Protected Sub cmdclear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdclear.Click
        'Me.Txtdays.Text = ""
        'Me.txtcompleave.Text = ""

        'Me.txtpurleave.Text = ""

        'Me.ddlleave.Text = "Casual Leave"
        'Me.ddlshift.Text = "Genral Shift"
        'Me.dlleavetype.Text = "Full Day"
        'Me.TxtCoDtAgian.SelectedValue = Now()
        'Me.TxtLeaveFrom.SelectedValue = Now()
        'Me.TxtLeaveTo.SelectedValue = Now()
        'Me.txttimefrom.SelectedValue = Now()
        'Me.TxtTimeTo.SelectedValue = Now()
        Response.Redirect("Jct_Payroll_Leave_Application_Co.aspx")
    End Sub
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Response.Redirect("Default2.aspx")
    End Sub
    Public Sub LeaveMsg()
        Obj.ConOpen()
        SqlPass = "select Count(EmployeeCode) from Jct_Payroll_OnLine_Request where EmployeeCode='" & Session("Empcode") & "' and Status ='p' and RequestArea='Leave'"
        'SqlPass = "select count(*) from jct_empg_leave where empcode='" & Session("Empcode") & "' and mainflag='p'"
        Cmd = New SqlCommand(SqlPass, Obj.Connection())

        Dim count As Integer = Cmd.ExecuteScalar()
        If count <> 0 Then
            Me.lblmsg.Visible = True
            Me.lblmsg.Text = "The number of leave applications pending in your account:  " & count & " .  For more detail, please check your Leave Status."
        Else
            Me.lblmsg.Visible = False
        End If
        Obj.ConClose()
    End Sub

    Protected Sub lnkcomp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkcomp.Click
        Response.Redirect("applycompensatoryleave.aspx")
    End Sub

    Public Function CompensatoryChecking(EarnedDate As DateTime, LeaveDays As Decimal) As Boolean
        '------------------------------------------------------------------------------------------------------------------------------
        'Check Compensatory is exists ot not
        '------------------------------------------------------------------------------------------------------------------------------
        Dim comTrueFalse As Boolean = False
        If Trim(ddlleave.Text) = "Compensatry Leave" Then

            Dim SqlPass2 As String = "exec Jct_PayRoll_Comp_Avail_Validate_Merged_Multiple '" & Session("Empcode") & "','" & Trim(EarnedDate) & "','" & Trim(Convert.ToDecimal(LeaveDays)) & "' "
            'Dim Dr2 As SqlDataReader = Obj.FetchReader(SqlPass2)
            Cmd = New SqlCommand(SqlPass2, Obj.Connection())
            Dim Dr2 As SqlDataReader
            Dr2 = Cmd.ExecuteReader()
            Try
                If Dr2.HasRows = True Then
                    comTrueFalse = True
                    CompensatoryChecking = True
                Else
                    ClientScript.RegisterClientScriptBlock(Me.GetType, "LeaveBal Not Available", "<script language = javascript>alert('No Sufficient Compensatry leave Balance,Check your account please')</script>")
                    comTrueFalse = False
                    CompensatoryChecking = False
                End If
                Dr2.Close()
            Catch ex1 As Exception

                Throw
                'Finally
                '    Obj.ConClose()
            End Try

        End If

    End Function

    Private Sub dlleavetype_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dlleavetype.SelectedIndexChanged
        'If (dlleavetype.SelectedItem.Text.ToLower() = "multiple days") Then
        '    Txtdays.Enabled = True
        '    Txtdays.Text = 2
        'Else
        '    Txtdays.Enabled = False
        '    If Trim(dlleavetype.SelectedItem.Text.ToLower()) = "full day" Then
        '        Txtdays.Text = 1
        '    ElseIf Trim(dlleavetype.SelectedItem.Text.ToLower()) = "ist half" Or Trim(dlleavetype.SelectedItem.Text.ToLower()) = "2nd half" Then
        '        Txtdays.Text = 0.5
        '    ElseIf Trim(dlleavetype.SelectedItem.Text.ToLower()) = "hours" Then
        '        Txtdays.Text = "0"
        '    End If
        'End If


    End Sub

    Private Sub toshowfirstrow()
        Dim dt As DataTable = New DataTable()
        Dim dr As DataRow = Nothing

        dt.Columns.Add(New DataColumn("FromDate", GetType(String)))
        dt.Columns.Add(New DataColumn("ToDate", GetType(String)))
        dt.Columns.Add(New DataColumn("EarnedDate", GetType(String)))
        dt.Columns.Add(New DataColumn("LeaveDays", GetType(String)))

        If Not String.IsNullOrEmpty(Request.QueryString("requestid")) Then
            dr = dt.NewRow()
            dr("FromDate") = String.Empty
            dr("ToDate") = String.Empty
            dr("EarnedDate") = String.Empty
            dr("LeaveDays") = String.Empty
            dt.Rows.Add(dr)
            dr = dt.NewRow()
        Else

            For i As Integer = 0 To 0
                dr = dt.NewRow()
                dr("FromDate") = String.Empty
                dr("ToDate") = String.Empty
                dr("EarnedDate") = String.Empty
                dr("LeaveDays") = String.Empty
                dt.Rows.Add(dr)
                dr = dt.NewRow()
            Next
        End If

        ViewState("CurrentTable") = dt
        grdDetail.DataSource = dt
        grdDetail.DataBind()
    End Sub

    Protected Sub grdDetail_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        '    Dim row As GridViewRow = e.Row

        '    If e.Row.RowType = DataControlRowType.DataRow Then
        '        Dim AssetType As RadComboBox = CType(row.FindControl("ddlAssetTypeGrid"), RadComboBox)
        '        Dim AssetCatg As RadComboBox = CType(row.FindControl("ddlAssetCatg"), RadComboBox)
        '        Dim ItemDesc As RadComboBox = CType(row.FindControl("ddlItemDesc"), RadComboBox)
        '        Dim txtnoofitems As RadNumericTextBox = CType(e.Row.FindControl("txtNoOfItems"), RadNumericTextBox)
        '        Dim txtnoOfItemsValue As String = txtnoofitems.Text
        '        Dim txtAcqDt As RadDatePicker = CType(e.Row.FindControl("txtAcqDt"), RadDatePicker)
        '        Dim assetType_sqlDS As SqlDataSource = CType(row.Cells(0).FindControl("SqlDataSource1"), SqlDataSource)
        '        Dim assetCatg_sqlDS As SqlDataSource = CType(row.Cells(1).FindControl("SqlDataSource2"), SqlDataSource)
        '        Dim desc_sqlDS As SqlDataSource = CType(row.Cells(2).FindControl("SqlDataSource3"), SqlDataSource)
        '        AssetType.DataBind()
        '        AssetCatg.DataBind()
        '        ItemDesc.DataBind()
        '        txtnoofitems.Text = txtnoOfItemsValue.ToString()
        '    End If
    End Sub

    Protected Sub grdDetail_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Remove" Then
            Dim rowIndex As Integer = 0

            If ViewState("CurrentTable") IsNot Nothing Then
                Dim dt As DataTable = CType(ViewState("CurrentTable"), DataTable)
                Dim gvr As GridViewRow = CType((CType(e.CommandSource, Control)).NamingContainer, GridViewRow)
                rowIndex = gvr.RowIndex
                dt.Rows.RemoveAt(rowIndex)
                grdDetail.DataSource = dt
                grdDetail.DataBind()
                'SetPreviousData()
                ViewState("CurrentTable") = dt

                If dt.Rows.Count = 0 Then
                    'lnksave.Enabled = False
                End If
            End If
        End If
    End Sub
    Private Sub SetPreviousData()
        Dim rowIndex As Integer = 0

        If ViewState("CurrentTable") IsNot Nothing Then
            Dim dt As DataTable = CType(ViewState("CurrentTable"), DataTable)

            If dt.Rows.Count > 0 Then

                For i As Integer = 0 To dt.Rows.Count - 1
                    'Dim assettype As RadComboBox = CType(grdDetail.Rows(i).Cells(0).FindControl("ddlAssetTypeGrid"), RadComboBox)
                    'Dim assetcat As RadComboBox = CType(grdDetail.Rows(i).Cells(1).FindControl("ddlAssetCatg"), RadComboBox)
                    'Dim desc As RadComboBox = CType(grdDetail.Rows(i).Cells(2).FindControl("ddlItemDesc"), RadComboBox)
                    'Dim assetType_sqlDS As SqlDataSource = CType(grdDetail.Rows(i).Cells(0).FindControl("SqlDataSource1"), SqlDataSource)
                    'Dim assetCatg_sqlDS As SqlDataSource = CType(grdDetail.Rows(i).Cells(1).FindControl("SqlDataSource2"), SqlDataSource)
                    'Dim desc_sqlDS As SqlDataSource = CType(grdDetail.Rows(i).Cells(2).FindControl("SqlDataSource3"), SqlDataSource)
                    'assettype.SelectedIndex = assettype.Items.IndexOf(assettype.Items.FindItemByValue(dt.Rows(i)(0).ToString()))
                    'assetCatg_sqlDS.SelectParameters("ASSET_ID").DefaultValue = assettype.SelectedValue
                    'assetcat.DataBind()
                    'assetcat.SelectedIndex = assetcat.Items.IndexOf(assetcat.Items.FindItemByValue(dt.Rows(i)(1).ToString()))
                    'desc_sqlDS.SelectParameters("ASSET_TYPE_ID").DefaultValue = assetcat.SelectedValue
                    'desc.DataBind()
                    'desc.SelectedIndex = desc.Items.IndexOf(desc.Items.FindItemByValue(dt.Rows(i)(2).ToString()))
                    rowIndex += 1
                Next
            End If
        End If
    End Sub

    Protected Sub lnkaddrow_Click(sender As Object, e As ImageClickEventArgs) Handles lnkaddrow.Click
        fun2()
    End Sub
    Private Sub fun2()
        Dim rowIndex As Integer = 0

        If ViewState("CurrentTable") IsNot Nothing Then
            Dim dtCurrentTable As DataTable = CType(ViewState("CurrentTable"), DataTable)
            Dim drCurrentRow As DataRow = Nothing

            If dtCurrentTable.Rows.Count > 0 Then

                Dim assettype As RadDatePicker = CType(grdDetail.Rows(rowIndex).Cells(0).FindControl("txtAcqDtfrom"), RadDatePicker)
                Dim assetcat As RadDatePicker = CType(grdDetail.Rows(rowIndex).Cells(1).FindControl("txtToDate"), RadDatePicker)
                Dim desc As RadDatePicker = CType(grdDetail.Rows(rowIndex).Cells(2).FindControl("txtEarnedDate"), RadDatePicker)

                'Dim assettype As RadComboBox = CType(grdDetail.Rows(rowIndex).Cells(0).FindControl("ddlAssetTypeGrid"), RadComboBox)
                'Dim assetcat As RadComboBox = CType(grdDetail.Rows(rowIndex).Cells(1).FindControl("ddlAssetCatg"), RadComboBox)
                'Dim desc As RadComboBox = CType(grdDetail.Rows(rowIndex).Cells(2).FindControl("ddlItemDesc"), RadComboBox)
                'Dim assetType_sqlDS As SqlDataSource = CType(grdDetail.Rows(rowIndex).Cells(0).FindControl("SqlDataSource1"), SqlDataSource)
                'Dim assetCatg_sqlDS As SqlDataSource = CType(grdDetail.Rows(rowIndex).Cells(1).FindControl("SqlDataSource2"), SqlDataSource)
                'Dim desc_sqlDS As SqlDataSource = CType(grdDetail.Rows(rowIndex).Cells(2).FindControl("SqlDataSource3"), SqlDataSource)
                drCurrentRow = dtCurrentTable.NewRow()
                drCurrentRow(0) = assettype.SelectedDate
                drCurrentRow(1) = assetcat.SelectedDate
                drCurrentRow(2) = desc.SelectedDate
                'assettype.SelectedIndex = assettype.Items.IndexOf(assettype.Items.FindItemByValue(assettype.SelectedValue))
                'assetcat.SelectedIndex = assetcat.Items.IndexOf(assetcat.Items.FindItemByValue(assetcat.SelectedValue))
                'desc.SelectedIndex = desc.Items.IndexOf(desc.Items.FindItemByValue(desc.SelectedValue))
                dtCurrentTable.Rows.Add(drCurrentRow)
                ViewState("CurrentTable") = dtCurrentTable
                grdDetail.DataSource = dtCurrentTable
                grdDetail.DataBind()
            End If
        Else
            Response.Write("ViewState is null")
        End If

        SetPreviousData()
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("Jct_Payroll_Leave_Application.aspx")
    End Sub
    Protected Sub Button1_Click1(sender As Object, e As EventArgs) Handles Button1.Click
        '  ClientScript.RegisterClientScriptBlock(Me.GetType, "Day", "<script language = javascript>alert('Availibity Checking Successfull.Please Click On Apply')</script>")
        CheckEligibility()
    End Sub
    Public Sub CheckEligibility()
        Try
            For Each gvRow As GridViewRow In grdDetail.Rows
                Dim txtAcqDtfroms As RadDatePicker = CType(gvRow.FindControl("txtAcqDtfrom"), RadDatePicker)
                Dim txtToDates As RadDatePicker = CType(gvRow.FindControl("txtToDate"), RadDatePicker)
                Dim txtEarnedDates As RadDatePicker = CType(gvRow.FindControl("txtEarnedDate"), RadDatePicker)
                Dim txtNoOfItemss As RadNumericTextBox = CType(gvRow.FindControl("txtNoOfItems"), RadNumericTextBox)
                Dim sql As String = "JCT_Payroll_LeaveCO_CheackAvailbility"
                Dim cmd As SqlCommand = New SqlCommand(sql, Obj.Connection())
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@empcode", SqlDbType.VarChar, 10).Value = Session("EmpCode")
                cmd.Parameters.Add("@fromDate", SqlDbType.DateTime).Value = Trim(txtAcqDtfroms.SelectedDate)
                cmd.Parameters.Add("@todate", SqlDbType.DateTime).Value = Trim(txtToDates.SelectedDate)
                cmd.Parameters.Add("@LvcompAdainDt", SqlDbType.VarChar, 12).Value = Trim(txtEarnedDates.SelectedDate)
                cmd.Parameters.Add("@LeaveDays", SqlDbType.VarChar, 5).Value = Convert.ToDecimal(txtNoOfItemss.Text)
                'Dim dr As SqlDataReader =
                cmd.ExecuteNonQuery()
                'Throw New System.Exception()
                'If dr.HasRows Then
                '    While dr.Read()
                '    End While
                ClientScript.RegisterClientScriptBlock(Me.GetType, "Day", "<script language = javascript>alert('Availibity Checking Successfull.Please Click On Apply')</script>")
                cmdapply.Visible = True
                'End If
                'dr.Close()
            Next

        Catch ex1 As SqlException
            'CheckEligile = 1
            cmdapply.Visible = False
            Dim Scrpt As String = "alert('" & ex1.Message & "');"
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", Scrpt, True)
        End Try
        'Catch ex As Exception
        '    'CheckEligile = 1
        '    cmdapply.Visible = False            
        '    Dim Scrpt As String = "alert('" & ex.Message & "');"
        '    ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", Scrpt, True)
        'End Try

    End Sub

End Class


