<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true"
    CodeFile="ReimUploaddocCheck.aspx.cs" Inherits="ReimUploaddocCheck" %>



<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript" src="Scripts/jquery.min.js"></script>
<script type="text/javascript" src="Scripts/thickbox.js"></script>
<link rel="stylesheet" href="css/thickbox.css" type="text/css" media="screen" />
    <table style="padding: 1px; margin: 1px; width: 100%">
        <tr>
            <td colspan="4" class="content-sub-heading">
                Reimbursement Document Report
            </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="CellWidth20">
                YearMonth
            </td>
            <td class="CellWidth30">
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DrpLvStatus" runat="server" CssClass="btn btn-default btn-sm">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="CellWidth20">
            </td>
            <td class="CellWidth30">
            </td>
        </tr>
        <tr>
            <td class="CellWidth20">
                &nbsp;
            </td>
            <td class="CellWidth30">
                &nbsp;
            </td>
            <td class="CellWidth20">
                &nbsp;
            </td>
            <td class="CellWidth30">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="CellWidth20">
                <asp:Label ID="Label45" runat="server" Visible="True" Width="103px">Reimbursement Type</asp:Label>
            </td>
            <td class="CellWidth80">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <div style="text-align: left;">
                            <asp:DropDownList ID="DropDownList20" runat="server" CssClass="btn btn-default btn-sm">
                                <asp:ListItem>Car</asp:ListItem>
                                <asp:ListItem>Driver</asp:ListItem>
                                <asp:ListItem>Entertainment</asp:ListItem>
                                <asp:ListItem>Telephone</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="CellWidth10">
                &nbsp;
            </td>
            <td class="CellWidth40">
                &nbsp;
            </td>
            <td class="CellWidth10">
                &nbsp;
            </td>
            <td class="CellWidth40">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="CellWidth10">
                <b>EmployeeCode</b>
            </td>
            <td class="CellWidth40">
                <i>
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtefffrm" runat="server" autocomplete="off" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtefffrm"
                                ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </i>
            </td>
            <td class="CellWidth10">
            </td>
            <td class="CellWidth40">
                <i></i>
            </td>
        </tr>
        <tr>
            <td class="CellWidth20">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label1" Visible="False" runat="server" Text="Reason For Rejection"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="CellWidth80">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlReasonReject" Visible="False" runat="server" CssClass="btn btn-default btn-sm">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:LinkButton ID="lnkapply" runat="server" class="btn btn-brand" ValidationGroup="mandatory"
                            OnClick="lnkapply_Click">Fetch</asp:LinkButton>
                        <asp:LinkButton ID="lnkreset" runat="server" class="btn btn-brand" OnClick="lnkreset_Click">Reset</asp:LinkButton>
                        <asp:LinkButton ID="lnkreject" runat="server" class="btn btn-brand" Visible="False"
                            OnClick="lnkreject_Click">Reject</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-brand" OnClick="LinkButton1_Click">Back</asp:LinkButton>

                        <asp:LinkButton ID="lnkAuth" runat="server" class="btn btn-brand" Visible="False"
                            OnClick="lnkAuth_Click">Authorize</asp:LinkButton>
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="CellWidth80">
                &nbsp;
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="pnl1" runat="server" Visible="False" class="CellWidth80">
                            <asp:GridView ID="GridExtTask" runat="server" CssClass="table" Visible="False">
                                <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                                <AlternatingRowStyle BackColor="WhiteSmoke" />
                                <Columns>
                                </Columns>
                                <EmptyDataTemplate>
                                    <h4>
                                        No Record To Show</h4>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="CellWidth20">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                    <ProgressTemplate>
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Image/load.gif" Height="100px"
                            Width="100px" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        &nbsp;
                        <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal" OnItemCommand="DataList2_ItemCommand"
                            CellSpacing="1">
                            <ItemTemplate>
                                <table cellpadding="1" cellspacing="2" style="margin: 1px; padding: 2px; border: 3px ridge #2b2b2b;">
                                    <tr>
                                        <%--  <td align="center" style=" width: 64px; font-family:Georgia, Garamond, serif; background-color: #C0C0C0;">--%>
                                        <td class="CellWidth90" style="margin: auto; background-color: #B0E0E6; " align="center">
                                            
                                            <a class="thickbox" id="Image6" runat="server" href = '<%# Eval("RefDocFilePath") %>' xmlns:asp="#unknown" ><b>Preview
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("RwID") %>'></asp:Label>
                                            </b>
                                             <%--<asp:Image ID="Image3" style="cursor: pointer" runat="server" xmlns:asp="#unknown" 
                                                  ImageUrl='<%# Eval("LogoImgPath") %>'
                                                Width="30px" />--%>
                                            <%--<asp:image id="Image1" height="100" width="100" style="cursor: pointer" runat="server" xmlns:asp="#unknown" />--%>
                                            </a>
                                              <%--  <asp:LinkButton ID="lnkPopUp" runat="server" ValidationGroup="mandatory" >Preview</asp:LinkButton>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                    <%--#A9A9A9--%>
                                        <td class="CellWidth90" style="margin: auto;" align="center">
                                            <%--<div style="margin: auto; width: 64px">--%>
                                            <%--<asp:ImageButton ID="ImageButton1" runat="server" AlternateText='<%# Eval("RefDocActFileName") %>' OnClientClick="return postbackButtonClick();"
                                                    ImageUrl='<%# Eval("LogoImgPath") %>' Visible="False" Width="64px" />--%>
                                            <asp:Image ID="Image2" runat="server" AlternateText='Download'
                                                OnClientClick="return postbackButtonClick();" ImageUrl='<%# Eval("LogoImgPath") %>'
                                                Width="30px" />
                                            </div>
                                        </td>
                                    </tr>
                                  
                                    <tr>
                                        <td class="CellWidth90" style="text-align: center; background-color: #B0E0E6; ">
                                            <asp:LinkButton ID="HyperLink1" runat="server" CommandArgument='<%# Eval("RefDocActFileName") %>'
                                                CommandName="Download" NavigateUrl='<%# Eval("RefDocFilePath") %>' Text='<< Download >>'></asp:LinkButton>
                                            <br />
                                            <b><asp:Label ID="Label46" runat="server" Text='<%# Eval("Type") %>'></asp:Label></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    
</asp:Content>
