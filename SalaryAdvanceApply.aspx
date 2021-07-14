<%@ Page Title="" Language="C#" MasterPageFile="Main2.master" AutoEventWireup="true"
    CodeFile="SalaryAdvanceApply.aspx.cs" Inherits="Payroll_SalaryAdvanceApply" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tileTable" style="height: 100%;">
        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
            <tr>
                <td colspan="4" class="content-sub-heading">
                    Salary Advance
                </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                    <b>Name</b>
                </td>
                <td class="CellWidth40">
                  
          
                    <i>
                        <asp:Label ID="lblEmpname" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>Department &nbsp;</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblDept" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                 <%--   <b>Designation</b>--%>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lbldesig" Visible ="false" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>Gross Salary</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblGross" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                    <b>Required Date</b>
                </td>
                <td class="CellWidth40">

                    <i>
                <asp:TextBox ID="txtefffrm" runat="server"   autocomplete="off" Width="100px"></asp:TextBox>
                <cc1:CalendarExtender ID="txtefffrm_CalendarExtender" runat="server" Enabled="True"
                    TargetControlID="txtefffrm">                   
                </cc1:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtefffrm"
                        ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>Advance Amount</b>
                </td>
                <td class="CellWidth40">
                    <i>
                                 <asp:TextBox ID="SadvRequiredAmt" runat="server"  MaxLength="6" Width="80px"></asp:TextBox>
                                 <cc1:FilteredTextBoxExtender ID="TxtPri_Mobile_FilteredTextBoxExtender" runat="server"
                            Enabled="True" TargetControlID="SadvRequiredAmt" ValidChars="0123456789">
                        </cc1:FilteredTextBoxExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="SadvRequiredAmt"
                        ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                    </i>
                </td>
            </tr>
            <tr>               
                <td class="CellWidth90" >
                    <b>Remarks</b>
                </td>
                <td class="CellWidth10" colspan="3">
                       <asp:TextBox ID="txtpurpose" runat="server" Height="50px" TextMode="MultiLine" 
                        MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpurpose"
                        ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                    <cc1:FilteredTextBoxExtender ID="flt_txtpurpose" runat="server" TargetControlID="txtpurpose" FilterType="Custom"
                        FilterMode="InvalidChars" InvalidChars="<>$%^&*(){}~@">
                    </cc1:FilteredTextBoxExtender>
                </td>
               
            </tr>
            <tr>
                <td colspan="4" style="text-align: center;">
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkapply" runat="server" class="btn btn-brand" ValidationGroup="mandatory"
                                OnClick="lnkapply_Click">Apply</asp:LinkButton>
                            <asp:LinkButton ID="lnkreset" runat="server" class="btn btn-brand" OnClick="lnkreset_Click">Reset</asp:LinkButton>
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
