<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="EntertainmentReq.aspx.cs" Inherits="EntertainmentReq" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tileTable" style="height: 100%;">
        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
            <tr>
                <td colspan="4" class="content-sub-heading">
                   Entertainment Reimburse Request
                </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                   </td>
                <td class="CellWidth40">
                 
          
                    </td>
                <td class="CellWidth10">
                    </td>
                <td class="CellWidth40">
                    </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                    <b>YearMonth  </b>
                </td>
                <td class="CellWidth40">
                  
          
                    <i>
                <asp:TextBox ID="txtyearmnth" runat="server"  MaxLength="6" Width="80px"></asp:TextBox>
                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            Enabled="True" TargetControlID="txtyearmnth" ValidChars="0123456789">
                        </cc1:FilteredTextBoxExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtyearmnth"
                        ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>Name</b>
                </td>
                <td class="CellWidth40">
                    <i>
                                 <asp:TextBox ID="txtname" runat="server"  MaxLength="30" ></asp:TextBox>                                 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtname"
                        ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                    </i>
                </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                    <b>Designation</b>
                </td>
                <td class="CellWidth40">
                    <i>
                            <asp:TextBox ID="txtdesi" runat="server"  MaxLength="20" ></asp:TextBox>                                 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtdesi"
                        ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
                    </i>
                </td>
                <td class="CellWidth10">
                    <b>Company</b>
                </td>
                <td class="CellWidth40">
                    <i>                        
                        <asp:TextBox ID="txtGross" runat="server"  MaxLength="30" ></asp:TextBox>                                 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGross"
                        ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>

                    </i>
                </td>
            </tr>
            <tr>
                <td class="CellWidth10">
                    <b>Place of Entertainment</b>
                </td>
                <td class="CellWidth40">

                    <i>              

                        <asp:TextBox ID="placeEntertain" runat="server"  MaxLength="20" ></asp:TextBox>                                 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="placeEntertain"
                        ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>

                    </i>
                </td>
                <td class="CellWidth10">
                    <b>Amount</b>
                </td>
                <td class="CellWidth40">
                    <i>
                                 <asp:TextBox ID="SadvRequiredAmt" runat="server"  MaxLength="5" ></asp:TextBox>
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
                       <asp:TextBox ID="txtpurpose" runat="server" Height="50px" TextMode="MultiLine"   MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpurpose"
                        ErrorMessage="Cannot be blank" ValidationGroup="mandatory"></asp:RequiredFieldValidator>
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


