<%@ Page Title="" Language="VB" MasterPageFile="~/Main2.master" AutoEventWireup="false" CodeFile="JCT_Payroll_EmplooyeeWise_Attendance_Report.aspx.vb" Inherits="Payroll_JCT_Payroll_EmplooyeeWise_Attendance_Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        .ajax__calendar_container {
            z-index: 1000;
        }
    </style>

    <div class="tile" style="height: 100%; vertical-align: top;">
        &nbsp;<table style="padding: 1px; margin: 1px; width: 100%">
            <tr>
                <td colspan="4" class="content-sub-heading">Attendence Status</td>
            </tr>
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>

            <tr>
                <td class="CellWidth20">Employee List
                </td>
                <td class="CellWidth30">
                    <asp:DropDownList ID="DrpLvStatus" runat="server" AutoPostBack="True"
                        CssClass="btn btn-default btn-sm">
                    </asp:DropDownList>
                </td>
                <td class="CellWidth20"></td>
                <td class="CellWidth30"></td>
            </tr>

            <tr>
                <td class="CellWidth10">From</td>
                <td class="CellWidth20">
                    <asp:TextBox ID="txtefffrm" runat="server" AutoPostBack="True" OnTextChanged="txtefffrm_TextChanged" autocomplete="off" Width="100px"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtefffrm_CalendarExtender" runat="server" Enabled="True" CssClass="ajax__calendar_container"
                        TargetControlID="txtefffrm">
                    </cc1:CalendarExtender>
                </td>
                <td class="CellWidth10">UpTo</td>
                <td class="CellWidth60">
                    <asp:TextBox ID="txteffto" runat="server" autocomplete="off" Width="100px"></asp:TextBox>
                    <cc1:CalendarExtender ID="txteffto_CalendarExtender" runat="server" Enabled="True" CssClass="ajax__calendar_container" TargetControlID="txteffto">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="CellWidth20">&nbsp;</td>
                <td class="CellWidth30">&nbsp;</td>
                <td class="CellWidth20">&nbsp;</td>
                <td class="CellWidth30">&nbsp;</td>
            </tr>

            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                    <asp:LinkButton ID="lnksave" runat="server" class="btn btn-brand"
                        ValidationGroup="A">Fetch</asp:LinkButton>

                </td>
            </tr>
            <tr>
                <td colspan="4" style="font-size: small; text-align: left; width: 100%; overflow: scroll; height: 150px" class="style1">
                    <%--<div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2">--%>
                &nbsp;
                 <%--<asp:Panel ID="panel1" ScrollBars="Both" runat="server" class="table-responsive" Width="90%"   >--%>
                    <%--  <div style="overflow:scroll;">--%>
                    <div style="width: 90%; height: 400px;">

                        <asp:GridView ID="GridView1" runat="server" Width="95%"
                            PageSize="15" CssClass="table" GridLines="None">
                            <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                            <AlternatingRowStyle BackColor="WhiteSmoke" />


                        </asp:GridView>
                        <%--</asp:Panel>--%>
                    </div>
                    <%--</div>--%>
                </td>
            </tr>
        </table>
</asp:Content>
