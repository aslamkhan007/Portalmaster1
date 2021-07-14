<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="ReimburseUploadSearch.aspx.cs" Inherits="ReimburseUploadSearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tile" style="height: 100%; vertical-align: top;">
        &nbsp;<table style="padding: 1px; margin: 1px; width: 100%">
            <tr>
                <td colspan="4" class="content-sub-heading">Attendence Status</td>
            </tr>
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>
            <tr>
                <td class="CellWidth20">
                    <asp:Label ID="Label51" runat="server" Visible="True" Width="103px">MonthYear</asp:Label>
                </td>
                <td class="CellWidth80">
                    <div style="text-align: left;">
                        <asp:DropDownList ID="DTP2" runat="server" AutoPostBack="True" class="btn btn-default btn-sm alignleft" OnSelectedIndexChanged="DropdownOnSelectedIndexChanged">
                            <asp:ListItem Value="January">January</asp:ListItem>
                            <asp:ListItem Value="February">February</asp:ListItem>
                            <asp:ListItem Value="March">March</asp:ListItem>
                            <asp:ListItem Value="April">April</asp:ListItem>
                            <asp:ListItem Value="May">May</asp:ListItem>
                            <asp:ListItem Value="June">June</asp:ListItem>
                            <asp:ListItem Value="July">July</asp:ListItem>
                            <asp:ListItem Value="August">August</asp:ListItem>
                            <asp:ListItem Value="September">September</asp:ListItem>
                            <asp:ListItem Value="October">October</asp:ListItem>
                            <asp:ListItem Value="November">November</asp:ListItem>
                            <asp:ListItem Value="December">December</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="DTP3" runat="server" AutoPostBack="True" CssClass="btn btn-default btn-sm">
                            <asp:ListItem>2019</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Label ID="display" runat="server" BackColor="Transparent" ForeColor="WhiteSmoke" Visible="False" Width="103px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="CellWidth20">

                    <asp:Label ID="Label45" runat="server" Visible="True" Width="103px">Reimbursement</asp:Label>
                </td>

                <td class="CellWidth80">
                    <div style="text-align: left;">
                        <asp:DropDownList ID="DropDownList20" runat="server" CssClass="btn btn-default btn-sm">
                            <asp:ListItem>All</asp:ListItem>
                            <asp:ListItem>Car</asp:ListItem>
                            <asp:ListItem>Driver</asp:ListItem>
                            <asp:ListItem>Entertainment</asp:ListItem>
                            <asp:ListItem>Telephone</asp:ListItem>
                            <asp:ListItem>Scooter</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </td>
            </tr>

            <tr>
                <td class="CellWidth10">Search Emplyoee Name</td>
                <td class="CellWidth20">
                    <asp:TextBox ID="txtEmployee" runat="server" AutoPostBack="True"
                        OnTextChanged="txtEmployee_TextChanged" Width="300px"></asp:TextBox>
                    <cc1:AutoCompleteExtender ID="txtEmployee_AutoCompleteExtender" runat="server" CompletionInterval="10"
                        CompletionListCssClass="AutoExtender" CompletionListElementID="divwidth" CompletionListHighlightedItemCssClass="AutoExtenderHighlight"
                        CompletionListItemCssClass="AutoExtenderList" CompletionSetCount="5" MinimumPrefixLength="3"
                        ServiceMethod="GetEmployee_sh_Common" ServicePath="~/WebService.asmx" TargetControlID="txtEmployee">
                    </cc1:AutoCompleteExtender>
                </td>
                <td class="CellWidth10"></td>
                <td class="CellWidth60"></td>
            </tr>
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>

            <tr>
                <td class="CellWidth20">&nbsp;</td>
                <td class="CellWidth80">&nbsp;</td>
            </tr>

            <tr>
                <td colspan="4" style="text-align: center">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                    <asp:LinkButton ID="lnksave" runat="server" class="btn btn-brand"
                        ValidationGroup="A" OnClick="lnksave_Click">Fetch</asp:LinkButton>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>

            <tr>
                <td>
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                        <ProgressTemplate>
                            <asp:Image ID="Image10" runat="server" ImageUrl="~/Image/load.gif" Height="50px" Width="50px" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
                <td colspan="3"></td>
            </tr>

            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:DataList ID="DataList2" runat="server" RepeatColumns="4" RepeatDirection="Vertical"
                                OnItemCommand="DataList2_ItemCommand">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <div style="margin: auto; width: 64px">
                                                    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText='<%# Eval("RefDocActFileName") %>'
                                                        ImageUrl='<%# Eval("LogoImgPath") %>' Visible="False" Width="64px" />
                                                    <asp:Image ID="Image2" runat="server" AlternateText='<%# Eval("RefDocActFileName") %>'
                                                        ImageUrl='<%# Eval("LogoImgPath") %>' Width="30px" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="HyperLink1" runat="server" CommandArgument='<%# Eval("RefDocActFileName") %>'
                                                    CommandName="Download" NavigateUrl='<%# Eval("RefDocFilePath") %>' Text='<%# Eval("RefDocActFileName") %>'></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
</asp:Content>

