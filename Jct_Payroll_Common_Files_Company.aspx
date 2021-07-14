<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Main2.master" CodeFile="Jct_Payroll_Common_Files_Company.aspx.vb" Inherits="Jct_Payroll_Common_Files_Company" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container">
        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
            <tr>
                <td colspan="2" class="content-sub-heading">Notices & Presentations</td>
            </tr>
            <tr>
                <td colspan="1" class="CellWidth20">Category</td>
                <td colspan="1" class="CellWidth40">
                    <div style="text-align: left;">
                        <asp:DropDownList ID="ddlCatg" runat="server" AutoPostBack="True" CssClass="btn btn-default btn-sm" Width="35%">
                        </asp:DropDownList>
                    </div>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="CellWidth20">&nbsp;</td>
                
            </tr>

            <tr>
                
                <td colspan="2" class="table-responsive">
                    
                    <asp:DataList ID="dlstEmp" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" Width="90%" CellPadding="0" CellSpacing="0">
                        <HeaderTemplate>
                             <table class="tblSub">
                                 <tr>
                                 <td class="CellWidth30"  style="border:thin;">
                                        <b>&nbsp;Area</b>                                        
                                    </td>
                                    <td class="CellWidth60"  style="border:thin;">
                                        <b>&nbsp; Click To View</b>
                                    </td>
                                     </tr>
                                 </table>
                            <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table class="tblSub">
                                <tr>
                                    <td class="CellWidth30">
                                        &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("Name")%>'></asp:Label>                                        
                                    </td>
                                    <td class="CellWidth60">
                                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("PATH")%>' ToolTip="Click Here To View Details"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr style="height: 20px">
                                    <td></td>
                                    <td></td>
                                </tr>


                            </table>
                            <hr />
                        </ItemTemplate>
                    </asp:DataList>

                </td>

            </tr>
          
        </table>
    </div>
</asp:Content>
