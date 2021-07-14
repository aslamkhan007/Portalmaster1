<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="Medical_Insurance.aspx.cs" Inherits="EmpGateway_Medical_Insurance" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<link href="../StyleSheets/style.css" rel="stylesheet" type="text/css" />
<link href="../StyleSheets/Chromestyle.css" rel="stylesheet" type="text/css" />
    <table style="width:100%;">
        <tr>
            <td class="tableheader" colspan="4">
                <asp:Label ID="Label20" runat="server" Text="Employee Insurance Details"></asp:Label>
              
                </td>
        
        </tr>
        <tr>
            <td class="CellWidth20" style="width: 119px">
                <asp:Label ID="Label16" runat="server" Text="Name"></asp:Label>
            </td>
            <td class="CellWidth30" style="width: 185px">
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </td>
            <td class="CellWidth20" style="width: 164px">
                <asp:Label ID="lable2" runat="server" Text="Salary Code"></asp:Label>
            </td>
            <td class="CellWidth30">
                <asp:Label ID="lblEmpCode" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="CellWidth20" style="width: 119px">
                <asp:Label ID="Label17" runat="server" Text="Card No."></asp:Label>
            </td>
            <td class="CellWidth30" style="width: 185px">
                <asp:Label ID="lblCardNo" runat="server"></asp:Label>
            </td>
            <td class="CellWidth20" style="width: 164px">
                <asp:Label ID="label4" runat="server">Department</asp:Label>
            </td>
            <td class="CellWidth30">
                <asp:Label ID="lblDepartment" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="CellWidth20" style="width: 119px">
                <asp:Label ID="label18" runat="server" Visible="false">Designation</asp:Label>
            </td>
            <td class="CellWidth30" style="width: 185px">
                <asp:Label ID="lblDesignation" runat="server" Visible="false"></asp:Label>
            </td>
            <td class="CellWidth20" style="width: 164px">
                <asp:Label ID="label5" runat="server">Date of Joining</asp:Label>
            </td>
            <td class="CellWidth30">
                <asp:Label ID="lblDoj" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="CellWidth20" style="width: 119px">
                <asp:Label ID="label19" runat="server">DOB</asp:Label>
            </td>
            <td class="CellWidth30" style="width: 185px">
                <asp:Label ID="lblDob" runat="server"></asp:Label>
            </td>
            <td class="CellWidth20" style="width: 164px">
                <asp:Label ID="lblMobile" runat="server">Mobile</asp:Label>
            </td>
            <td class="CellWidth30">
                <asp:TextBox ID="txtMobile" runat="server" CssClass="textbox" MaxLength="10" 
                    Width="90px"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="txtMobile_FilteredTextBoxExtender" 
                    runat="server" FilterType="Numbers" TargetControlID="txtMobile" 
                    ValidChars="0123456789">
                </cc1:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td  colspan="4">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <asp:Label ID="Label22" runat="server" Text="Employee"></asp:Label>
                    <asp:TextBox ID="txtEmpCode" runat="server" CssClass="textbox"></asp:TextBox>
                    <asp:LinkButton ID="cmdFetchDetail" runat="server" 
                        onclick="cmdFetchDetail_Click">Fetch Detail</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="cmdReset" runat="server" onclick="cmdReset_Click">Reset</asp:LinkButton>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td >
                <asp:Label ID="label21" runat="server">Enter Your Family Details Below :</asp:Label>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td  colspan="2">
                 <asp:Panel ID="pnlGrid" runat="server" Width="80%" Height="110%" ScrollBars="Auto" BorderStyle="None">
                <%--<asp:Panel ID="pnlGrid" runat="server" CssClass="panelbg" ScrollBars="Both" 
                     Width="75%" >--%>
                    <asp:GridView ID="GridView1" runat="server"  CssClass="GridViewStyle_Newgrid" 
                        AutoGenerateColumns="False" Width="100%" 
                         AllowPaging="True" 
                       PageSize="20" EnableModelValidation="True" ShowFooter="False" 
                        onrowcommand="GridView1_RowCommand"  OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" 
                                        CommandArgument='<%# Eval("TransNo") %>' CommandName="Remove"  ToolTip="Click here to Delete record."
                                        ImageUrl="~/Image/close.png" onclick="ImageButton1_Click" />
                                    <cc1:ConfirmButtonExtender ID="ImageButton1_ConfirmButtonExtender" 
                                        runat="server" 
                                        ConfirmText="Are you sure, you want to delete this record ?" 
                                        TargetControlID="ImageButton1">
                                    </cc1:ConfirmButtonExtender>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transno">
                                <ItemTemplate>
                                    <asp:Label ID="lblTransNo" runat="server" Text='<%# Eval("TransNo") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="0px" />
                                <FooterStyle Width="0px" />
                                <HeaderStyle Width="0px" />
                                <ItemStyle Width="0px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Relation">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlRelation" runat="server" CssClass="btn btn-default btn-sm" 
                                        SelectedValue='<%# Eval("Relation") %>' AutoPostBack="True" 
                                        onselectedindexchanged="ddlRelation_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">--Select--</asp:ListItem>
                                        <asp:ListItem>Self</asp:ListItem>
                                        <asp:ListItem>Spouse</asp:ListItem>
                                        <asp:ListItem>Father</asp:ListItem>
                                        <asp:ListItem>Mother</asp:ListItem>
                                        <asp:ListItem>Daughter</asp:ListItem>
                                        <asp:ListItem>Son</asp:ListItem>
										<asp:ListItem>FatherInLaw</asp:ListItem>
										<asp:ListItem>MotherInLaw</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" 
                                        Text='<%# Eval("Name") %>' MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtName" ErrorMessage="**" 
                                        ValidationGroup="A" Display="Dynamic"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DOB (dd/mm/yyyy)">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDob" runat="server"
                                        Text='<%# Eval("Dob") %>' MaxLength="10" 
                                        ToolTip="eg-  &quot; 03/12/1950 &quot; for 3 December 1950"></asp:TextBox>
                                
                                    <cc1:MaskedEditExtender ID="txtDob_MaskedEditExtender" runat="server" 
                                        Mask="99/99/9999" MaskType="Date" TargetControlID="txtDob">
                                    </cc1:MaskedEditExtender>
                                
                                    <cc1:TextBoxWatermarkExtender ID="txtDob_TextBoxWatermarkExtender" 
                                        runat="server" TargetControlID="txtDob" 
                                        WatermarkText="dd/mm/yyyy">
                                    </cc1:TextBoxWatermarkExtender>
                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtDob" ErrorMessage="**" ValidationGroup="A">
                                    </asp:RequiredFieldValidator>
                                
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Age">
                                <ItemTemplate>
                                    <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                               <asp:TemplateField HeaderText="Disability">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Enabled="False"  AutoPostBack="True" />

                                </ItemTemplate>
                            </asp:TemplateField>
                         
                        </Columns>
              <%--          <FooterStyle CssClass="FooterStyle_Newgrid" />
                  
                        <HeaderStyle CssClass="HeaderStyle_Newgrid" />
                        <PagerStyle CssClass="PagerStyle_Newgrid" />
                       
                        <RowStyle CssClass="RowStyle_Newgrid" />
                        <SelectedRowStyle CssClass="SelectedRowStyle_Newgrid" />--%>
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
     
        <tr>
            <td style="text-align: center" colspan="2">
                <asp:LinkButton ID="lnkSave" runat="server" CssClass="btn btn-brand" 
                    onclick="lnkSave_Click" ValidationGroup="A"  >Save</asp:LinkButton>
                <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn-brand" 
                    onclick="lnkSubmit_Click" ValidationGroup="A" >Submit</asp:LinkButton>
                <cc1:ConfirmButtonExtender ID="lnkSubmit_ConfirmButtonExtender" runat="server" 
                    ConfirmText="Are you sure, you want to Submit ?" TargetControlID="lnkSubmit">
                </cc1:ConfirmButtonExtender>
                <asp:LinkButton ID="lnkReset" runat="server" CssClass="btn btn-brand" Visible="false" >Reset</asp:LinkButton>
                <asp:LinkButton ID="lnkAddRow" runat="server" CssClass="btn btn-brand" 
                    onclick="lnkAddRow_Click" >Add Row</asp:LinkButton>
                <asp:LinkButton ID="lnkExcel" runat="server" CssClass="btn btn-brand" 
                    onclick="lnkExcel_Click" Visible="False" >To Excel</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="2">
                <asp:Label ID="lblmsgNotification" runat="server" Visible="True" ForeColor="Red" Text="Please Note: For any record deletion, Ist Save the record & then delete the required record by click on cross sign"></asp:Label>
               
            </td>
        </tr>
		   <tr>
            <td  colspan="2">
                <asp:Label ID="lblmsg" runat="server" Visible="True" Text="For Any Change After Submition Of Request,Please Contact Either Kamal Kishore Sharma Or BALA KRISHAN NAIR In Admin Department." ForeColor="Red"></asp:Label>
            </td>
        </tr>
      
    </table>
</asp:Content>

