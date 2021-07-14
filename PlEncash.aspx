<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="PlEncash.aspx.cs" Inherits="PlEncash" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tileTable" style="height: 100%;">
        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
            <tr>
                <td colspan="4" class="content-sub-heading">Leave Encashment:
                </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                    <b>Year</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        
                        <asp:Label ID="lblYearmonth" runat="server"></asp:Label>
                    </i>
                </td>

                <td class="CellWidth10">&nbsp;</td>
                <td class="CellWidth40">&nbsp;</td>


            </tr>
            <tr>
                <td class="CellWidth10">
                    <b>Employee Name</b>

                </td>
                <td class="CellWidth40">
                    <asp:Label ID="lblEmployeeName" runat="server"></asp:Label>

                </td>

                <td class="CellWidth10">
                    <b>EmployeeCode&nbsp;</b>
                </td>
                <td class="CellWidth40">
                    <i>

                        <asp:Label ID="lblEmployeeCode" runat="server"></asp:Label>
         
                    </i>
                </td>


            </tr>



            <tr>
                <td class="CellWidth10">Department</td>
                <td class="CellWidth40">
                    <asp:Label ID="lblDepartment" runat="server"></asp:Label>

                </td>

                <td class="CellWidth10">
                   <%-- <b>Designation</b>--%>
                </td>
                <td class="CellWidth40">
                    <i>

                        <asp:Label ID="lblDesignation" visible ="false" runat="server"></asp:Label>
           
                    </i>
                </td>


            </tr>


            <tr>
                <td class="CellWidth10">Bank Account</td>
                <td class="CellWidth40">
                    <asp:Label ID="lblBankAccount" runat="server"></asp:Label>

                </td>

                <td class="CellWidth10">
                    <b>Bank Name</b>
                </td>
                <td class="CellWidth40">
                    <i>

                        <asp:Label ID="lblBankName" runat="server"></asp:Label>
                  
                    </i>
                </td>


            </tr>


                        <tr>
                <td class="CellWidth10">PL Balance</td>
                <td class="CellWidth40">
                    <asp:Label ID="lblPLBalance" runat="server"></asp:Label>

                </td>

                <td class="CellWidth10">
                    <b>Last Encashment</b>
                </td>
                <td class="CellWidth40">
                    <i>

                        <asp:Label ID="lblLastEncashment" runat="server"></asp:Label>
                  
                    </i>
                </td>


            </tr>


                        <tr>
                <td class="CellWidth10">Encashment Days</td>
                <td class="CellWidth40">
                    <asp:Label ID="lblEncashmentDays" runat="server"></asp:Label>

                </td>

                <td class="CellWidth10">
                    
                </td>
                <td class="CellWidth40">                    
                </td>


            </tr>

            <tr>
                <td class="CellWidth90">
                    <b></b>
                </td>
                <td class="CellWidth10" colspan="3"></td>

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


