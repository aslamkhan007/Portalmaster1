<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="JCT_Payroll_Employee_LeaveBalance.aspx.vb" Inherits="Payroll_JCT_Payroll_Employee_LeaveBalance" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <meta name="viewport" content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0, user-scalable = no" />
    <script type="text/javascript" src="js/footable.js?v=2-0-1.js"></script>
    <link href="style.css" rel="stylesheet" />

   

    <style type="text/css">
    th
    {
        text-align:left;
        background-color: #dddddd;
    }
    table{
        cellpadding: "5";
        cellspacing: "5" ;
    }
    .style1
        {
            font-family: Trebuchet MS;
            font-size: 10pt;
            font-weight: bold;
            width: 350px;
            text-align: left;
        }
    /*tr:nth-child(even) {
    background-color: #dddddd;*/
    </style>



    <div class="tileTable" style="height: 100%;">
        <table style="width: 100%;" cellpadding="1" cellspacing="1">
            <tr>
                <td class="content-sub-heading" colspan="2">Leave Balance:</td>
            </tr>


             <tr>
                <td colspan="1" class="CellWidth20"><b>Year</b></td>
                <td colspan="1" class="CellWidth40">
                    <div style="text-align: left;">
                        <asp:UpdatePanel ID="UpdatePanel243" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlyear" runat="server" AutoPostBack="True" CssClass="btn btn-default btn-sm" Width="35%">
                                    <asp:ListItem>2021</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>                                    
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>

            <tr>
                <td style="font-size: small; text-align: left;" class="style1" colspan="2">
                    <div class="wrapper" >
                          <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                        <asp:GridView ID="GridView1" CssClass="footable" runat="server" AutoGenerateColumns="true" ShowFooter="true" Width="93%" GridLines="Both">
                        </asp:GridView>
                        <script type="text/javascript">
                            $(function () {
                                $('#<%=GridView1.ClientID %>').footable({
                                    breakpoints: {
                                        phone: 300,
                                        tablet: 640
                                    }
                                });
                            });
                        </script>
                                </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>

            <tr>
                <td colspan="1" class="CellWidth20"><b>Category</b></td>
                <td colspan="1" class="CellWidth40">
                    <div style="text-align: left;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlCatg" runat="server" AutoPostBack="True" CssClass="btn btn-default btn-sm" Width="35%">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="font-size: small; text-align: left;" class="style1" colspan="2">
                    <div class="wrapper" style="width: 75%; height: 300px; overflow: scroll">
                        <asp:UpdatePanel ID="UpdateImage4" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridView2" CssClass="footable" runat="server" AutoGenerateColumns="true" ShowFooter="true" Width="93%" GridLines="Both">
                                    <EmptyDataTemplate>
                                        <h5>No record to show...</h5>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <script type="text/javascript">
                                    $(function () {
                                        $('#<%=GridView2.ClientID %>').footable({
                                    breakpoints: {
                                        phone: 300,
                                        tablet: 640
                                    }
                                });
                            });
                                </script>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
        </table>


    </div>

</asp:Content>
