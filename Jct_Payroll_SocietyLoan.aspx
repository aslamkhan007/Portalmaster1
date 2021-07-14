<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Jct_Payroll_SocietyLoan.aspx.vb" Inherits="Payroll_Jct_Payroll_SocietyLoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="tileTable" style="height: 100%; vertical-align:top;">
    <table style="width: 100%">
        <tr class="content-sub-heading">
            <td colspan="2" >
                <asp:Label ID="Label1" runat="server" BackColor="Transparent" Text="Society"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2" rowspan="2" class="CellWidth100" >
                <asp:DetailsView ID="DetailsView1" runat="server" GridLines="None" Height="40px" CssClass="table"
                    Width="100%" BorderColor="DimGray" BorderStyle="Solid" BorderWidth="2px" CellPadding="3">
                   <%-- <RowStyle CssClass="GridItem"/>
                    <PagerStyle CssClass="GridHeader"/>
                    <FieldHeaderStyle CssClass="DetailField"/>
                    <AlternatingRowStyle CssClass="GridAI" />--%>
                    <EmptyDataTemplate>
                        <div><h6>No Data Found..</h6></div>
                    </EmptyDataTemplate>
                </asp:DetailsView>
            </td>
        </tr>
    </table>
        </div>
    <br />
</asp:Content>

