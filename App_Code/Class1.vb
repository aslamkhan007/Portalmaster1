Imports System
Imports System.Data
Imports Microsoft.VisualBasic
Imports System.Data.SqlClient


Public Class Connection
    Dim ConStr As String = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("misjctdev").ConnectionString
    '"Password= power; Persist Security Info=True; User ID= ITGRP ; Connection TimeOut=2000000; Initial Catalog=jctdev; Data Source= MISERP"
    Dim Conn As SqlConnection
    Dim Cmd, Cmd1 As SqlCommand
    Dim Dr, Dr1 As SqlDataReader

    Public Sub New()
        Conn = New SqlConnection(ConStr)
    End Sub

    Public Function Connection() As SqlConnection
        If (Conn.State = Data.ConnectionState.Closed) Then
            'Conn.Open()
            Conn.Open()
        End If
        Return Conn
    End Function

    Public Function FetchReader(ByVal Sql As String) As SqlDataReader

        Cmd = New SqlCommand(Sql, Conn)
        Try
            ConOpen()
            Dr = Cmd.ExecuteReader()
            Return Dr
        Catch ex As Exception
            conn.dispose()
            Return Dr
            'Finally
            '    ConClose()
        End Try

    End Function

    Public Sub ConOpen()
        Try
            If (Conn.State = Data.ConnectionState.Closed) Then
                Conn.Open()
            End If
        Catch ex As Exception
            conn.dispose()
        End Try
    End Sub

    Public Sub ConClose()
        Try
            If (Conn.State = Data.ConnectionState.Open) Then
                Conn.Close()
            End If
        Catch ex As Exception
            conn.dispose()
        End Try
    End Sub

End Class

