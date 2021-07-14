<%@ Page Title="" Language="C#" MasterPageFile="~/Main3.master" AutoEventWireup="true" CodeFile="OnlinePFApplyValidate.aspx.cs" Inherits="OnlinePFApplyValidate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .content-header-greens {
            background-color: #efebdd;
            color: rgba(0, 0, 0, 0.87);
            font-style: oblique;
            font-size: 12px;
        }

        .content-header-Header {
            font-size: 20px;
            text-align: center;
        }
    </style>




    <meta name="viewport" content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0, user-scalable = no" />
    <script type="text/javascript" src="js/footable.js?v=2-0-1.js"></script>
    <link href="style.css" rel="stylesheet" />
    <link href="css/base.css" rel="stylesheet" />

    <div class="tileTable" style="height: 100%;">
        <table style="border-collapse: separate; width: 100%; border-spacing: 0 15px; padding: 05px" cellspacing="10px" cellpadding="20px" class="tblMain">
            <tr>
                <td colspan="2" class="content-sub-heading">Login(PFAdvance/Withdrawal)</td>
            </tr>
            <tr>
                <td class="CellWidth30">UAN Number : &nbsp;
                </td>
                <td class="CellWidth70">
                    <div>
                        <asp:TextBox ID="txtUANNO" runat="server" AutoPostBack="False" ValidationGroup="A" MaxLength="15" AutoComplete="Off"  AutoCompleteType="Disabled"  ToolTip="Only Numbers Allowed in UAN No"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUANNO"
                            ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                        <cc1:FilteredTextBoxExtender TargetControlID="txtUANNO" ID="FltExtPurpose" runat="server" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="CellWidth30">Password : &nbsp;
                </td>
                <td class="CellWidth70">
                    <div>
                        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="False" ValidationGroup="A" MaxLength="12" TextMode="Password" AutoComplete="Off"  AutoCompleteType="Disabled" ToolTip="Password Shoud Be PF No (In Numeric)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                        <cc1:FilteredTextBoxExtender TargetControlID="TextBox1" FilterType="Numbers" ID="FilteredTextBoxExtender1" runat="server"></cc1:FilteredTextBoxExtender>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="content-header-greens ">
                    <p >
                        Password Shoud Be PF No (In Numeric)</p>
                    </td>
            </tr>
            <tr>
                <td style="text-align: center" colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnksave" runat="server" class="btn btn-brand" Text="Apply" ValidationGroup="A" OnClick="lnksave_Click"></asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>

            </tr>

            <tr>
                <td colspan="2">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="10">
                        <ProgressTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/load.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>


            <tr>
                <td colspan="2" class="header-red content-header-Header ">This link is meant to execute the following Provident Fund  (PF) related activities:</td>
            </tr>
            <tr>
                <td colspan="2" class="content-header-greens ">Refundable Loan/Advance – To avail this service the concerned should be a member of PF and his Date of Joining should be greater than one year.</td>
            </tr>
            <tr>
                <td colspan="2" class="content-header-greens ">Non Refundable Loan /Advance -  This loan is given to employees for the below mentioned causes:</td>
            </tr>
            <tr>
                <td colspan="2" class="content-header-greens ">Housing  Loan -   Housing loan can be taken thrice during the tenure of the service. Ist loan can be taken after the completion of 5 years of service,
                                    2nd & 3rd loans can be taken after the completion of 5 years of the previous taken loans.
                </td>
            </tr>
            <tr>
                <td colspan="2" class="content-header-greens ">Marriage/Education - Eligible employees can avail this facility after the completion of 7 years of their service. The count of this loan cannot exceed three.
     Example 1. An employee can apply two times for education loan and one time for Marriage loan.
     Example 2. An employee can apply two times for Marriage loan and one time for Education loan.
     Example 3. An employee can apply for three times for Education loan and vice versa.
                </td>
            </tr>

            <tr>
                <td colspan="2" class="content-header-greens ">Withdrawal - If the reason for leaving the company is Retirement or Death of the employee, then there is no condition for applying the withdrawal.
If it is a resign case, then the concerned employee can apply for the withdrawal after the completion of 60 days from the date of resignation.
                </td>
            </tr>

        </table>
    </div>
</asp:Content>

