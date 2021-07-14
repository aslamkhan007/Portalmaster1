<%@ Page Title="" Language="VB" MasterPageFile="~/Main2.master" AutoEventWireup="false" CodeFile="Jct_Payroll_Pf_Loan.aspx.vb" Inherits="Payroll_Jct_Payroll_Pf_Loan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tile" style="height: 100%; vertical-align: top;">
        &nbsp;<table style="padding: 1px; margin: 1px; width: 100%">
            <tr>
                <td colspan="2" class="content-sub-heading">PF Loan</td>
            </tr>
            <tr>
                <td colspan="4" style="font-size: small; text-align: left; width: 100%;" class="style1">
                     <div style="width: 90%; height: 400px;">
                        <asp:GridView ID="GridView1" runat="server" Width="100%"
                            PageSize="15" CssClass="table" GridLines="None">
                            <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                            <AlternatingRowStyle BackColor="WhiteSmoke" />
                            <EmptyDataTemplate>
                                <div class="card-orange" ><h5>No Record To Show</h5></div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </td>
            </tr>
        </table>
        <br />
</asp:Content>

