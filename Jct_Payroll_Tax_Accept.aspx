<%@ Page Title="" Language="VB" MasterPageFile="~/Main2.master" AutoEventWireup="false" CodeFile="Jct_Payroll_Tax_Accept.aspx.vb" Inherits="Jct_Payroll_Tax_Accept" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="tileTable" style="height: 100%;">
        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
            <tr>

                <td colspan="4" class="content-sub-heading">
                    <asp:UpdatePanel ID="UpdatePanelas11" runat="server">
                        <ContentTemplate>                          
                            <asp:Label ID="Label1" runat="server" Text="Tax Category Acceptance"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>


            </tr>

            <tr>

                <td colspan="4" style="font-size: small; text-align: left; width: 100%; overflow: scroll; height: 150px" class="style1">&nbsp;
                            <asp:UpdatePanel ID="UpdatePaneasasl1" runat="server">
                                <ContentTemplate>
                                    <div style="width: 90%;">

                                        <asp:GridView ID="GridView1" runat="server" Width="95%"
                                            PageSize="15" CssClass="table" GridLines="None">
                                            <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                                            <AlternatingRowStyle BackColor="WhiteSmoke" />


                                        </asp:GridView>

                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                </td>

            </tr>

            <tr>

              <%--  <td>Category</td>--%>
                <td style="text-align: center;">
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                    <asp:RadioButtonList ID="rblMeasurementSystem" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Old" Selected="true" Value="Old" />
                        <asp:ListItem Text="New" Value="New" />
                    </asp:RadioButtonList>
                            </ContentTemplate>
                    </asp:UpdatePanel>

                </td>

            </tr>

            <tr>
                <td style="text-align: center;">
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-brand" OnClick="LinkButton1_Click" ValidationGroup="mandatory">Apply</asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>





</asp:Content>

