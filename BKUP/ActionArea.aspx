<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="ActionArea.aspx.cs" Inherits="Payroll_ActionArea" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript" language="javascript">
    function Testing()
     {
       try
        {
            var retunboolean = true;
            var ele = document.getElementById('<%=lnkReset.ClientID%>');
            
            if (ele != null && !ele.disabled)
                retunboolean = true;
            else
                retunboolean = false;
                
            if (ele != null)
                ele.disabled = true;
        }
        catch (err)
        {
            alert(err.description);
        }
         return retunboolean;
    }
</script>  


    <div class="tileTable" style="height: 100%;">
        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
            <tr>
                <td class="content-sub-heading" style="text-align: left;" colspan="3">My Action Area
                </td>
            </tr>
            <tr>
                <td style="text-align: left" class="CellWidth20">
                    <asp:Label ID="Label7" runat="server" Text="Category"></asp:Label>
                </td>
                <td style="text-align: left" colspan="2" class="CellWidth80">
                    <asp:DropDownList ID="DrpLvStatus" runat="server" AutoPostBack="True"
                        CssClass="btn btn-default btn-sm" OnSelectedIndexChanged="DrpLvStatus_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="CellWidth80"> &nbsp;
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                           
                            <asp:Panel ID="pnl1" runat="server" Width="90%" Height="70%" ScrollBars="Both">
                                <asp:GridView ID="GridExtTask" runat="server" CssClass="table" GridLines="Both"
                                    Width="90%">
                                    <HeaderStyle Wrap="False" BackColor="DarkGoldenrod" Font-Bold="True" ForeColor="#FFFFCC" />
                                    <AlternatingRowStyle BackColor="WhiteSmoke" />

                                    <Columns>
                                        <asp:TemplateField HeaderText="Check">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="ChkOrderSelAll" runat="server" AutoPostBack="True" OnCheckedChanged="ChkOrderSelAll_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="chkCheck" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h4>No  Record To Show</h4>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td colspan="2" class="CellWidth80">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="Panel1" runat="server" Width="60%" Height="80%" ScrollBars="Auto" BorderStyle="None">
                                <table>
                                    <tr>
                                        <td>Sanction Amount
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSanctionAmt" runat="server" MaxLength="6" ></asp:TextBox>
                                            <cc1:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                                enabled="True" targetcontrolid="txtSanctionAmt" validchars="0123456789">
                        </cc1:filteredtextboxextender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSanctionAmt"
                                                ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>&nbsp;</td>
            </tr>


            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkConfirmAll" runat="server" class="btn btn-brand" ValidationGroup="mandatory" OnClick="lnkConfirmAll_Click">Authorize</asp:LinkButton>
                            <asp:LinkButton ID="LnkCancel" runat="server" class="btn btn-brand" OnClick="LnkCancel_Click">Cancel</asp:LinkButton>
                            <%--<asp:Button ID="lnkReset" runat="server"  OnClick="lnkReset_Click" Text="Reset" OnClientClick="this.disabled='true'; this.value='Please wait...';" UseSubmitBehavior="false" />--%>
                            <asp:LinkButton ID="lnkReset" runat="server"  OnClick="lnkReset_Click" Text="Reset" UseSubmitBehavior="false"  onclientclick="return Testing();"  xmlns:asp="#unknown" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="CellWidth10">
                    &nbsp;</td>
            </tr>


            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="10">
                        <ProgressTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/load.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
                <td class="CellWidth10">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>

