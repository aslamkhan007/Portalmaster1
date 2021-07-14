<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="ReimburseReq1.aspx.cs" Inherits="ReimburseReq1" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <script type="text/javascript">
        var counter = 0;
        function AddFileUpload() {
            var div = document.createElement('DIV');
            div.innerHTML = '<input id="file' + counter + '" name = "file' + counter +
                            '" type="file" />' +
                            '<input id="Button' + counter + '" type="button" ' +
                            'value="Remove" onclick = "RemoveFileUpload(this)" />';

            document.getElementById("FileUploadContainer").appendChild(div);
            counter++;
        }

        function RemoveFileUpload(div) {
            document.getElementById("FileUploadContainer").removeChild(div.parentNode);
        }

        var updateProgress = null;

        function postbackButtonClick() {
            updateProgress = $find("<%= UpdateProgress2.ClientID %>");
            window.setTimeout("updateProgress.set_visible(true)", updateProgress.get_displayAfter());
            return true;
        }

    </script>
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
                    <b>Designation</b>
                </td>
                <td class="CellWidth20">
                    <i>
                        <asp:Label ID="lbldesig" runat="server"></asp:Label>
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
            <td colspan="4"  class="CellWidth80"> <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="10" AssociatedUpdatePanelID="UpdatePanel9" >
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
                        <asp:LinkButton ID="lnkPrint" runat="server" OnClick="lnkPrint_Click">Print Slip</asp:LinkButton>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="CellWidth10">
               
            </td>
        </tr>      
    </table>
            <table>
        <tr>
            <td class="CellWidth20">
                <div style="text-align: left;">
                    <asp:DropDownList ID="DTP2" runat="server" AutoPostBack="True" class="btn btn-default btn-sm alignleft"  OnSelectedIndexChanged = "DropdownOnSelectedIndexChanged">
                        <asp:ListItem Value="January">January</asp:ListItem>
                        <asp:ListItem Value="February">February</asp:ListItem>
                        <asp:ListItem Value="March">March</asp:ListItem>
                        <asp:ListItem Value="April">April</asp:ListItem>
                        <asp:ListItem Value="May">May</asp:ListItem>
                        <asp:ListItem Value="June">June</asp:ListItem>
                        <asp:ListItem Value="July">July</asp:ListItem>
                        <asp:ListItem Value="August">August</asp:ListItem>
                        <asp:ListItem Value="September">September</asp:ListItem>
                        <asp:ListItem Value="October">October</asp:ListItem>
                        <asp:ListItem Value="November">November</asp:ListItem>
                        <asp:ListItem Value="December">December</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="DTP3" runat="server" AutoPostBack="True" CssClass="btn btn-default btn-sm">
                        <asp:ListItem>2019</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Label ID="display" runat="server" BackColor="Transparent" ForeColor="WhiteSmoke" Visible="False" Width="103px"></asp:Label>
            </td>
            <td class="CellWidth80"></td>
        </tr>
        <tr>
            <td class="CellWidth20">

                <asp:Label ID="Label45" runat="server" Visible="True" Width="103px">Reimbursement</asp:Label>
            </td>

            <td class="CellWidth80">
                <div style="text-align: left;">
                    <asp:DropDownList ID="DropDownList20" runat="server" CssClass="btn btn-default btn-sm">
                        <asp:ListItem>Car</asp:ListItem>
                        <asp:ListItem>Driver</asp:ListItem>
                        <asp:ListItem>Entertainment</asp:ListItem>
                        <asp:ListItem>Telephone</asp:ListItem>
                        <asp:ListItem>Scooter</asp:ListItem>
                    </asp:DropDownList>
                </div>

            </td>
        </tr>

        <tr>
            <td class="CellWidth20">&nbsp;</td>
            <td class="CellWidth80">&nbsp;</td>
        </tr>


        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <div id="FileUploadContainer">
                        </div>
                        &nbsp;<img alt="Add File" src="/Image/Icons/Action/document_add.png" onclick="AddFileUpload()" title="Please Select The File"
                            width="80" />

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="imgUpload" />                       
                    </Triggers>
                </asp:UpdatePanel>

            </td>
        </tr>

        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>

        <tr>
            <%--<td colspan="4" style="text-align: center">--%>
            <td colspan="4">
                  <asp:UpdatePanel ID="UpdatePanel3" runat="server" >
                    <ContentTemplate>
                <asp:ImageButton AlternateText="Upload File(s)" ID="imgUpload" runat="server" OnClick="btnUpload_Click" title="For Uploading File"  OnClientClick="return postbackButtonClick();"
                    ImageUrl="~/Image/Upload.png" Width="73px" />
                        </ContentTemplate>
                      </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <%--<td colspan="4" style="text-align: center">--%>
            <td colspan="4">
                <asp:Label ID="Labelsize" runat="server" BackColor="Transparent" ForeColor="Red" Font-Size="XX-Small" Text="Max File Size : 1MB"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel3" >
                    <ProgressTemplate>
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Image/load.gif" Height="100px" Width="100px" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:DataList ID="DataList2" runat="server" RepeatColumns="6" RepeatDirection="Vertical"
                            OnItemCommand="DataList2_ItemCommand">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <div style="margin: auto; width: 64px">
                                                <asp:ImageButton ID="ImageButton1" runat="server" AlternateText='<%# Eval("RefDocActFileName") %>' 
                                                    ImageUrl='<%# Eval("LogoImgPath") %>' Visible="False" Width="64px" />
                                                <asp:Image ID="Image2" runat="server" AlternateText='<%# Eval("RefDocActFileName") %>' 
                                                    ImageUrl='<%# Eval("LogoImgPath") %>' Width="30px" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="HyperLink1" runat="server" CommandArgument='<%# Eval("RefDocActFileName") %>'
                                                CommandName="Download" NavigateUrl='<%# Eval("RefDocFilePath") %>' Text='<%# Eval("RefDocActFileName") %>'></asp:LinkButton>
                                        </td>
                                    </tr>
                                   

                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
        </div>
</asp:Content>





