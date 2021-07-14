<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true"
    CodeFile="Jct_payroll_Contact_Information.aspx.cs" Inherits="Payroll_Jct_payroll_Contact_Information" %>
    
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="tileTable" style="height: 100%;">
         <div class="card">
   <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
        <tr>
            <td class="content-sub-heading" colspan="4">
              Contact Information
            </td>
        </tr>
     


        


    
     


        <tr>
            <td  style="width: 164px">
                MobileNo.
            </td>
            <td  style="width: 349px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="TxtPri_Mobile" runat="server" CssClass="textbox" TabIndex="7" MaxLength="10"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="TxtPri_Mobile_FilteredTextBoxExtender" runat="server"
                            Enabled="True" TargetControlID="TxtPri_Mobile" ValidChars="0123456789">
                        </cc1:FilteredTextBoxExtender>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td  style="width: 88px">
                &nbsp;
            </td>
            <td  style="width: 14px">
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td >
                Primary LandlineNo
            </td>
            <td  style="width: 14px">
                <asp:TextBox ID="txtlandline" MaxLength="12" runat="server" CssClass="textbox"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="txtlandline_FilteredTextBoxExtender" runat="server"
                    Enabled="True" TargetControlID="txtlandline" ValidChars="0123456789">
                </cc1:FilteredTextBoxExtender>
            </td>
            <td >
                &nbsp;</td>
            <td  style="width: 14px">
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                Secondary Landline No
            </td>
            <td  style="width: 14px">
                <asp:TextBox ID="TxtSecondaryLandline"  MaxLength="12" runat="server" CssClass="textbox"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True"
                    TargetControlID="TxtSecondaryLandline" ValidChars="0123456789">
                </cc1:FilteredTextBoxExtender>
            </td>
            <td >
                &nbsp;</td>
            <td  style="width: 14px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 164px;">
                <asp:Label ID="Label53" runat="server" Text="Emai Id"></asp:Label>
            </td>
            <td style="width: 349px">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="TxtEmailID" runat="server" CssClass="textbox" Width="80px" MaxLength="20" ToolTip="Please type only your user name. Do not include @Jctltd.com in user name"></asp:TextBox>@Jctltd.com
                       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="TxtEmailID" ErrorMessage="Input valid Internet URL!" ValidationGroup="A"></asp:RegularExpressionValidator>--%>
                        <cc1:FilteredTextBoxExtender ID="fltrd1" runat="server" FilterMode="InvalidChars" FilterType="Custom" TargetControlID="txtEmailID" InvalidChars="@"></cc1:FilteredTextBoxExtender>
                        <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" WatermarkCssClass="watermark"
                            WatermarkText="local-part@domain" TargetControlID="TxtEmailID">
                        </cc1:TextBoxWatermarkExtender>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td  style="width: 88px;">
            </td>
            <td  style="width: 14px;">
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="buttonbackbar" colspan="4">
                <asp:LinkButton ID="lnkSave" runat="server" class="btn btn-brand" ValidationGroup="A"
                    OnClick="lnkSave_Click">Save</asp:LinkButton>
            </td>
        </tr>

       <tr>
            <td  style="width: 164px">
                AddressType
                </td>
            <td  style="width: 349px">


                <asp:DropDownList ID="ddlAddressType" runat="server" class="btn btn-default btn-sm" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlAddressType_SelectedIndexChanged">
                            <asp:ListItem>All</asp:ListItem>
                            <asp:ListItem>Current</asp:ListItem>
                            <asp:ListItem>Permanent</asp:ListItem>
                            <asp:ListItem>Correspondence</asp:ListItem>
                        </asp:DropDownList>

                </td>
            <td  style="width: 88px">
                &nbsp;</td>
            <td  style="width: 14px">
                &nbsp;</td>
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
         </div>
         </div>
</asp:Content>
