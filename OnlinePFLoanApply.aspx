<%@ Page Title="" Language="C#" MasterPageFile="~/Main3.master" AutoEventWireup="true" CodeFile="OnlinePFLoanApply.aspx.cs" Inherits="OnlinePFLoanApply" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .card-Grey {
            background-color: #efebdd;
            color: rgba(0, 0, 0, 0.87);
        }
    </style>


    <div class="tileTable" style="height: 100%;">
        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">

            <tr>
                <td colspan="4" class="content-sub-heading">PF Advance/Withdrawal
                </td>
            </tr>

            <tr>
                <td class="CellWidth20">UAN No</td>
                <td class="CellWidth30">
                    <i>
                        <asp:Label ID="lblUANNo" Text ="" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth20">
                    &nbsp;</td>
                <td class="CellWidth30">
                    &nbsp;</td>
            </tr>

            <tr>
                <td class="CellWidth20">Loan Type
                </td>
                <td class="CellWidth30">
                    <asp:DropDownList ID="ddlleave" runat="server" class="btn btn-default btn-sm"
                        AutoPostBack="True" OnSelectedIndexChanged="ddlleave_SelectedIndexChanged">
                        <asp:ListItem>Refundable Loan</asp:ListItem>
                        <asp:ListItem>Nonrefundable (Advance)</asp:ListItem>
                        <asp:ListItem>Withdrawal</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="CellWidth20">
                    <asp:Label ID="Label6" runat="server" Text="Loan Purposes" Visible="False"></asp:Label>
                </td>
                <td class="CellWidth30">
                    <asp:DropDownList ID="dlleavetype" runat="server" class="btn btn-default btn-sm" AutoPostBack="True">
                        <asp:ListItem>Houseing</asp:ListItem>
                        <asp:ListItem>Marriage/Education</asp:ListItem>

                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>EmployeeName</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblEmpname" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>Father/Husband Name</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblFatherName" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                    <b>Date Of Birth</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblDob" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>MobileNo</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblMobileNo" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>AdhaarNo</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblAddharno" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>PanNo</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblPanNo" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>BankAccountNo</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblBankAccountno" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>IFSC Code</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblIFSCCode" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>Bank Name</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblBankName" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>Adress</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>City</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblCity" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>State</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblState" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>PF No</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblPFNo" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>DOJ EPF</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblDojEPF" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>DOJ EPS</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblDojEPS" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>DOE EPF</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblDOEEPF" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>DOE EPS</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblDOEEPS" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>Leaving Reason</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblLeavingReason" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>Address1</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblAddress1" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>Address2</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblAddress2" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>Address3</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblAddress3" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>City</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblCityaddress1" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>State</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblStateAddress1" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>PinCode</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblPinCode" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>

            <tr>
                <td class="card-Grey" colspan="4">&nbsp;</td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>Remarks</b>

                </td>
                <td class="CellWidth40" colspan="3">
                    <i>
                        <asp:TextBox ID="txtpurpose" runat="server" Width="280px" MaxLength="80"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpurpose" ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                        <cc1:FilteredTextBoxExtender ID="flt_txtpurpose" runat="server" FilterMode="InvalidChars" FilterType="Custom" InvalidChars="&lt;&gt;$%^&amp;*(){}~@" TargetControlID="txtpurpose">
                        </cc1:FilteredTextBoxExtender>
                    </i></td>
            </tr>

            <tr>
                <td class="CellWidth10">
                    <b>
                        <asp:Label ID="Label1" Text="Amount Apply" runat="server"></asp:Label></b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:TextBox ID="txtAmountApply" runat="server" MaxLength="8" Width="80px"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                            Enabled="True" TargetControlID="txtAmountApply" ValidChars="0123456789">
                        </cc1:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAmountApply"
                            ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b></td>
                <td class="CellWidth40">
                    <i></i>
                </td>
            </tr>




            <tr>
                <td colspan="4" style="text-align: center;">
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkapply" runat="server" class="btn btn-brand" ValidationGroup="mandatory" OnClientClick="if(this.value === 'Saving...') { return false; } else { this.value = 'Saving...'; }"
                                OnClick="lnkapply_Click">Apply</asp:LinkButton>
                            <asp:LinkButton ID="lnkreset" runat="server" class="btn btn-brand" OnClick="lnkreset_Click">LogOut</asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="10">
                        <ProgressTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/load.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


