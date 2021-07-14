<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="LTC.aspx.cs" Inherits="LTC" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tileTable" style="height: 100%;">
        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
            <tr>
                <td colspan="4" class="content-sub-heading">LTC/LTA :  
                </td>
            </tr>

            <tr>
                <td class="CellWidth20"><b>Type</b>
                </td>
                <td class="CellWidth30">
                    <asp:DropDownList ID="ddlleave" runat="server" class="btn btn-default btn-sm"
                        AutoPostBack="True" OnSelectedIndexChanged="ddlleave_SelectedIndexChanged">
                        <asp:ListItem>LTC</asp:ListItem>
                        <asp:ListItem>LTA</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="CellWidth20">&nbsp;</td>
                <td class="CellWidth30">&nbsp;</td>
            </tr>



            <tr>
                <td class="CellWidth20"><b>Employee Code</b></td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblSapCode" runat="server"></asp:Label>
                    </i>

                </td>
                <td class="CellWidth10"><b>CostCenter</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblCostCenter" runat="server"></asp:Label>
                    </i>
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
                    <%--<b>Designation</b>--%>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lbldesig" Visible = "false" runat="server"></asp:Label>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>LTC/LTA Date</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblGross" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                    <b>
                        <asp:Label ID="Label1" runat="server"> Leave FromDate</asp:Label>
                    </b>
                </td>
                <td class="CellWidth40">

                    <i>
                        <asp:TextBox ID="txtefffrm" runat="server" autocomplete="off" Width="100px"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtefffrm_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="txtefffrm">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtefffrm"
                            ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                    </i>
                </td>
                <td class="CellWidth10">

                    <b>

                        <asp:Label ID="Label2" runat="server"> Leave ToDate</asp:Label>


                    </b>
                </td>
                <td class="CellWidth40">


                    <i>
                        <asp:TextBox ID="txtLeaveToDate" runat="server" autocomplete="off" Width="100px"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True"
                            TargetControlID="txtLeaveToDate">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLeaveToDate"
                            ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                    </i>

                </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                    <b>Amount</b>

                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="SadvRequiredAmt" runat="server"></asp:Label>
                        <%--<asp:TextBox ID="SadvRequiredAmt" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="TxtPri_Mobile_FilteredTextBoxExtender" runat="server"
                            Enabled="True" TargetControlID="SadvRequiredAmt" ValidChars="0123456789">
                        </cc1:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="SadvRequiredAmt"
                            ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>--%>
                    </i>

                </td>
                <td class="CellWidth10">&nbsp;</td>
                <td class="CellWidth40">&nbsp;</td>
            </tr>
            <tr>
                <td class="CellWidth90">
                    <b>Remarks</b>
                </td>
                <td class="CellWidth10" colspan="3">
                    <asp:TextBox ID="txtpurpose" runat="server" Height="50px" TextMode="MultiLine"
                        MaxLength="50"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtpurpose"
                        ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>--%>
                    <cc1:FilteredTextBoxExtender ID="flt_txtpurpose" runat="server" TargetControlID="txtpurpose" FilterType="Custom"
                        FilterMode="InvalidChars" InvalidChars="<>$%^&*(){}~@">
                    </cc1:FilteredTextBoxExtender>
                </td>

            </tr>
            <tr>
                <td colspan="4" style="text-align: center;">
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkapply" runat="server" class="btn btn-brand" OnClientClick="if(this.value === 'Saving...') { return false; } else { this.value = 'Saving...'; }" ValidationGroup="mandatory"
                                OnClick="lnkapply_Click">Apply</asp:LinkButton>
                            <asp:LinkButton ID="lnkreset" runat="server" class="btn btn-brand" OnClick="lnkreset_Click">Reset</asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>

            <tr>
                
                            <td colspan="4" style="text-align: left;">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="Panel1" runat="server" Width="100%" Height="80%" ScrollBars="Auto" BorderStyle="None">
                                <asp:Label ID="Label5" runat="server">Please Note. </asp:Label>
                                <br />
                                <asp:Label ID="Label3" runat="server" ForeColor="#CC3300">LTA ( Leave Travelling Allowance)   -  Travelling Bills & Earned Leave is required, Income Tax exemption is applicable Once in Two Calendar Year. </asp:Label>
                                <br />
                                <asp:Label ID="Label4" runat="server" ForeColor="#CC3300">LTC ( Leave Travelling Claim)       -  No above mentioned formality is required in case of LTC.  </asp:Label>

                            </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                            </td>
                        
            </tr>
            <tr>
                <td colspan="4">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="10">
                        <ProgressTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/load.gif" Height="50px" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


