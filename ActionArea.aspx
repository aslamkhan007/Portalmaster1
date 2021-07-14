<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true"
    CodeFile="ActionArea.aspx.cs" Inherits="Payroll_ActionArea" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">

.pnlGuestHouse {
  display: block;
  
  position: relative;
  border:none;
  width: 80px;
  height: 80px;

  

}


.lds-roller {
  display: inline-block;
  position: relative;
  width: 80px;
  height: 80px;

  

}
.lds-roller div {
  animation: lds-roller 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite;
  transform-origin: 40px 40px;
}
.lds-roller div:after {
  content: " ";
  display: block;
  position: absolute;
  width: 7px;
  height: 7px;
  border-radius: 50%;
  background : darkgoldenrod;
  margin: -4px 0 0 -4px;
  top: 50%;
  left: 50%;
}
.lds-roller div:nth-child(1) {
  animation-delay: -0.036s;
}
.lds-roller div:nth-child(1):after {
  top: 63px;
  left: 63px;
}
.lds-roller div:nth-child(2) {
  animation-delay: -0.072s;
}
.lds-roller div:nth-child(2):after {
  top: 68px;
  left: 56px;
}
.lds-roller div:nth-child(3) {
  animation-delay: -0.108s;
}
.lds-roller div:nth-child(3):after {
  top: 71px;
  left: 48px;
}
.lds-roller div:nth-child(4) {
  animation-delay: -0.144s;
}
.lds-roller div:nth-child(4):after {
  top: 72px;
  left: 40px;
}
.lds-roller div:nth-child(5) {
  animation-delay: -0.18s;
}
.lds-roller div:nth-child(5):after {
  top: 71px;
  left: 32px;
}
.lds-roller div:nth-child(6) {
  animation-delay: -0.216s;
}
.lds-roller div:nth-child(6):after {
  top: 68px;
  left: 24px;
}
.lds-roller div:nth-child(7) {
  animation-delay: -0.252s;
}
.lds-roller div:nth-child(7):after {
  top: 63px;
  left: 17px;
}
.lds-roller div:nth-child(8) {
  animation-delay: -0.288s;
}
.lds-roller div:nth-child(8):after {
  top: 56px;
  left: 12px;
}
@keyframes lds-roller {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
    </style>
    <div class="tileTable" style="height: 100%;">
        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
            <tr>
                <td class="content-sub-heading" style="text-align: left;" colspan="3">
                    My Action Area
                </td>
            </tr>
            <tr>
                <td style="text-align: left" class="CellWidth20">
                    <asp:Label ID="Label7" runat="server" Text="Category"></asp:Label>
                </td>
                <td style="text-align: left" colspan="2" class="CellWidth80">
                    <asp:DropDownList ID="DrpLvStatus" runat="server" AutoPostBack="True" CssClass="btn btn-default btn-sm"
                        OnSelectedIndexChanged="DrpLvStatus_SelectedIndexChanged">
                    </asp:DropDownList>&nbsp;
                    <asp:LinkButton ID="cmdAppl2" runat="server"  OnClientClick="if(this.value === 'Saving...') { return false; } else { this.value = 'Saving...'; }"
                    ValidationGroup="mandatory" OnClick="lnkConfirmAll_Click">Authorize</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="cmdCancel2" runat="server" OnClick="LnkCancel_Click">Cancel</asp:LinkButton>
                </td>
            </tr>
          
            <tr>
                <td colspan="2" class="CellWidth80">
                    &nbsp;
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnl1" runat="server" Width="75%" Height="300px" ScrollBars="Both">
                                <asp:GridView ID="GridExtTask" runat="server" CssClass="table" GridLines="Both" Font-Size="8pt"
                                    CellPadding="5" CellSpacing="2" Width="70%" Height="25%">
                                    <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Check">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="ChkOrderSelAll" runat="server" AutoPostBack="True" OnCheckedChanged="ChkOrderSelAll_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="chkCheck" AutoPostBack="True" OnCheckedChanged="chkCheck_CheckedChanged" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h4>
                                            No Record To Show</h4>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </asp:Panel>
                            <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:HiddenField ID="pnlHidden" runat="server" />
                </td>
                <td class="CellWidth20">
                    &nbsp;
                </td>
            </tr>
            <tr>
            <td colspan="2">
             <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
        <asp:Panel ID="PnlGuestHouse" runat="server" Width="75%" Height="50%" ScrollBars="none"  Visible="false"> 
                        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
                            <tr>
                                <td>
                                    StayAt
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlApproved_AccomodateStay" runat="server" 
                                        CssClass="btn btn-default btn-sm" AutoPostBack="true" 
                                        onselectedindexchanged="ddlApproved_AccomodateStay_SelectedIndexChanged">
                                     
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TxtOther" runat="server" MaxLength="50" Text="" Visible="false"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqd_TxtOther" runat="server" Enabled="false" ControlToValidate="TxtOther"
                                                ErrorMessage="*" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Drinks
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlDrinksServed1" runat="server" CssClass="btn btn-default btn-sm">
                                        <asp:ListItem ></asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Enabled="false" ControlToValidate="ddlDrinksServed1"
                                                ErrorMessage="*" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    </ContentTemplate>
                    </asp:UpdatePanel>
            </td>
            </tr>
            <tr>
                <td colspan="2" class="CellWidth80">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="Panel1" runat="server" Width="60%" Height="80%" ScrollBars="Auto"
                                BorderStyle="None">
                                <table>
                                    <tr>
                                        <td>
                                            Sanction Amount
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSanctionAmt" runat="server" MaxLength="6"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True"
                                                TargetControlID="txtSanctionAmt" ValidChars="0123456789">
                                            </cc1:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSanctionAmt"
                                                ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" class="CellWidth80">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="Panel2" runat="server" Width="60%" Height="80%" ScrollBars="Auto"
                                BorderStyle="None">
                                <table>
                                    <tr>
                                        <td>
                                            Sanction Refundable/Non-Refundable Amount
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPFSanctionAmt" runat="server" MaxLength="6"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" Enabled="True"
                                                TargetControlID="txtPFSanctionAmt" ValidChars="0123456789">
                                            </cc1:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator169" runat="server" ControlToValidate="txtPFSanctionAmt"
                                                ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Sanction Withdrawl Total
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotAmt" runat="server" MaxLength="10"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="True"
                                                TargetControlID="txtTotAmt" ValidChars="0123456789">
                                            </cc1:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator112" runat="server" ControlToValidate="txtTotAmt"
                                                ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Less Non Refundable Loan
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLessRefundable" runat="server" MaxLength="10" AutoPostBack="True"
                                                OnTextChanged="txtLessRefundable_TextChanged"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender336" runat="server" Enabled="True"
                                                TargetControlID="txtLessRefundable" ValidChars="0123456789">
                                            </cc1:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator136" runat="server" ControlToValidate="txtLessRefundable"
                                                ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="content-header-orange">
                                            Net Pay Amount
                                        </td>
                                        <td class="content-header-orange">
                                            <asp:Label ID="lblNetPayableAmt" Text="" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" class="CellWidth80">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="Panel3" runat="server" Width="60%" Height="80%" ScrollBars="Auto" BorderStyle="None">
                                <table>
                                    <tr>
                                        <td>
                                            Remarks(If Any)
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtauthremarks" runat="server" Height="35px" TextMode="MultiLine"
                                                MaxLength="100"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="flt_txtpurpose" runat="server" TargetControlID="txtauthremarks"
                                                FilterType="Custom" FilterMode="InvalidChars" InvalidChars="<>$%^&*(){}~@">
                                            </cc1:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" CssClass="table" GridLines="Both" Font-Size="8pt"
                                CellPadding="5" CellSpacing="2" Width="70%">
                                <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                                <AlternatingRowStyle BackColor="WhiteSmoke" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="CellWidth10">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                </td>
            </tr>
              <tr>
                <td colspan="2" class="CellWidth80">
                    &nbsp;
                   <%-- pnl removed--%>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="10">
                        <ProgressTemplate>
                            <div class="lds-roller">
                                <div>
                                </div>
                                <div>
                                </div>
                                <div>
                                </div>
                                <div>
                                </div>
                                <div>
                                </div>
                                <div>
                                </div>
                                <div>
                                </div>
                                <div>
                                </div>
                            </div>
                            <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/Image/load.gif" />--%>
                            <%-- <div class="lds-roller"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>--%>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkConfirmAll" runat="server" class="btn btn-brand" OnClientClick="if(this.value === 'Saving...') { return false; } else { this.value = 'Saving...'; }"
                                ValidationGroup="mandatory" OnClick="lnkConfirmAll_Click">Authorize</asp:LinkButton>
                            <asp:LinkButton ID="LnkCancel" runat="server" class="btn btn-brand" OnClick="LnkCancel_Click">Cancel</asp:LinkButton>
                            <asp:LinkButton ID="lnkReset" runat="server" class="btn btn-brand" OnClick="lnkReset_Click">Reset</asp:LinkButton>
                            <asp:LinkButton ID="lnkReset0" runat="server" class="btn btn-brand" OnClick="lnkReset0_Click"
                                Visible="False">ReimbursementReport</asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="CellWidth10">
                    &nbsp;
                </td>
            </tr>
            <%--<tr>
                <td colspan="2" style="text-align: center">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="10">
                        <ProgressTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/load.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    
                </td>
                <td class="CellWidth10">&nbsp;</td>
            </tr>--%>
        </table>
       
    </div>
</asp:Content>
