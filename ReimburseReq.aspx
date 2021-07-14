<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="ReimburseReq.aspx.cs" Inherits="ReimburseReq" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">





        <style>
        #countDownTimer {
            font-family: Times new roman;
            color: white;
            display: inline-block;
            font-size: 19px;
            font-weight: bold;
            text-align: center;
        }

            #countDownTimer > div {
                padding: 7px;
                border-radius: 3px;
                background: #e1e1e1;
                display: inline-block;
            }

            #countDownTimer div > span {
                background: darkgoldenrod;
                display: inline-block;
                padding: 9px;
                border-radius: 0px;
            }

        .timeText {
            font-weight: bold;
            padding-top: 5px;
            font-size: 13px;
            color: darkgoldenrod;
        }

        .expireMessage {
            font-weight: bold;
            padding-top: 5px;
            font-size: 13px;
            color: red;
        }



        .timeTextWarning {
            font-weight: bold;
            padding-top: 5px;
            font-size: 12px;
            color: darkgoldenrod;
        }
    </style>


    <div class="tileTable" style="height: 100%;">
    <table cellpadding="2" cellspacing="1" style="width: 100%; height: 474px;" class="tblMain">


        <tr>
            <td class="content-sub-heading" style="text-align: left;"  colspan="4">
                Reimbursements Request
            </td>
            </tr>        
                    <tr>
                <td class="CellWidth10">
                    <b>Name</b>
                </td>
                <td class="CellWidth20">                                                
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
                <td class="CellWidth20">
                    <i>
                        <asp:Label ID="lbldesig" runat="server" Visible ="false"></asp:Label>
                    </i>
                </td>
              <td class="CellWidth10">
                    <b>Status :</b>
                </td>
                <td class="CellWidth40">
                    <i>
                        <asp:Label ID="lblEligible" runat="server"></asp:Label>
                    </i>
                </td>
            </tr>
                
        <tr>
            <td colspan="4"  class="CellWidth80">&nbsp;
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>                       
                        <asp:Panel ID="pnl1" runat="server" Width="75%" Height="70%" ScrollBars="Both">
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
                                    <h4> No  Record To Show</h4>                                    
                                </EmptyDataTemplate>
                            </asp:GridView>
                            </asp:Panel>                       
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>&nbsp;</td>
        </tr> 
                
        <tr>
            <td colspan="4"  class="CellWidth80"> <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="10">
                    <ProgressTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/load.gif" Height="50px" />
                    </ProgressTemplate>
                </asp:UpdateProgress></td>
            <td>&nbsp;</td>
        </tr> 
        <tr>
            <td colspan="4" style="text-align: center" >
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <asp:LinkButton ID="lnkConfirmAll" runat="server" class="btn btn-brand"  OnClientClick="if(this.value === 'Saving...') { return false; } else { this.value = 'Saving...'; }" OnClick="lnkConfirmAll_Click" Enabled="False" >Apply</asp:LinkButton>
                        <asp:LinkButton ID="lnkReset" runat="server" class="btn btn-brand"  OnClick="lnkReset_Click">Reset</asp:LinkButton>
                        <asp:LinkButton ID="lnkAddreim" runat="server"  OnClick="lnkAddreim_Click">&nbsp;&nbsp;&nbsp;Addi.Detail&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                        <asp:LinkButton ID="lnkPrint" runat="server"  Visible="False"   OnClick="lnkPrint_Click">Print Slip</asp:LinkButton>
                        <asp:LinkButton ID="lnkUPloaddoc" runat="server" OnClick="lnkUPloaddoc_Click"  >Upload Documents</asp:LinkButton>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="CellWidth10">
               
            </td>
        </tr> 
        
        <tr>
            <td colspan="4" style="text-align: center" >
                &nbsp;</td>
            <td class="CellWidth10">
               
                &nbsp;</td>
        </tr> 
        


        <tr>
                <td colspan="4"> </td>
            </tr>
         

        <tr>
                <td colspan="4"  class="CellWidth80 avatar-green" >IT IS DECLARED THAT ORIGINAL  BILLS IN THIS RESPECT ARE LYING WITH ME .
                    <br />IT IS FURTHER DECLARED THAT IN CASE OF ANY DISPUTE
I SHALL BE PERSONALLY RESPONSIBLE FOR PAYMENT OF ALL THE TAXES UNDER INCOME TAX ACT.
</td>
            </tr>

        <tr>
                <td colspan="4"> </td>
            </tr>


         <tr>
                <td colspan="4" class="CellWidth80 avatar-red">Please Note : Apply Reimbursment before 29th of each month otherwise this will be paid in next month.</td>
            </tr>
             
    </table>
        </div>
</asp:Content>



