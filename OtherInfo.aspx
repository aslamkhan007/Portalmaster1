<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OtherInfo.aspx.vb" MasterPageFile="~/Main3.master" Inherits="OtherInfo" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width"> --%>
    <meta name="viewport" content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0, user-scalable = no" />
    <script type="text/javascript" src="js/footable.js?v=2-0-1.js"></script>
    <link href="style.css" rel="stylesheet" />
    <link href="css/base.css" rel="stylesheet" />

    <%--<link href="FormatingSheet.css" rel="stylesheet" />--%>

    
 <div class="tileTable"  style="height: 100%;" >
     <table style="border-collapse:separate; width: 100%;border-spacing:0 15px;padding:05px" cellspacing= "10px" cellpadding="20px" class="tblMain" >
            
            <tr>
                <td colspan="3" class="content-sub-heading">Search UAN</td>
            </tr>
        
            <tr>
                
                <td class="CellWidth30">&nbsp;UAN Number : &nbsp;
                </td>
                <td colspan="2" class="CellWidth70">
                    <div>
                        <asp:TextBox ID="txtUANNO"  runat="server" AutoPostBack="False" ValidationGroup="A" MaxLength="15"></asp:TextBox>
                       
                        <asp:LinkButton ID="lnksave" runat="server"  ValidationGroup="A" Text="Fetch"></asp:LinkButton>
                                         
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUANNO"
                            ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>

                    </div>
                </td>
                
            </tr>


             

            <tr>
            <td colspan="3"><h5>&nbsp; <asp:Label ID="Labeltxt" Text="" runat="server" Font-Size="Large" ></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="content-sub-heading">Interest  Calculated on Monthly Running Balance * Subject to Change as per Government Rules</td>
            </tr>
            <tr>
            <td class="CellWidth10"></td>
                <td colspan="2" class="CellWidth80">
                <asp:DataList ID="dlstEmp" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" Width="90%" ShowFooter="false">
                        <ItemTemplate>
                            <table style="border-collapse:separate; width: 100%;border-spacing:0 15px;" cellpadding="1" cellspacing="1">
                                <tr>
                                    <td class="CellWidth40">
                                        <div><b>Employee Name : </b></div>
                                    </td>
                                    <td class="CellWidth60">
                                        <asp:Label ID="Label2" Text='<%#Eval("EmpName") %>' runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr> 
                                    <td class="CellWidth40">
                                        <div><b>UAN : </b></div>
                                    </td>
                                    <td class="CellWidth60">
                                        <asp:Label ID="Label3" Text='<%#Eval("UAN") %>' runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="CellWidth40">
                                        <div><b>PF Amount (Self) : </b></div>
                                    </td>
                                    <td class="CellWidth60">
                                        <asp:Label ID="Label4" Text='<%#Eval("PF_AMT_OWN") %>' runat="server"></asp:Label></td>
                                </tr>




                                <tr>
                                    <td class="CellWidth40">
                                        <div><b>PF Amount (Employer) : </b></div>
                                    </td>
                                    <td class="CellWidth60">
                                        <asp:Label ID="Label1" Text='<%#Eval("PF_AMT_EMP") %>' runat="server"></asp:Label></td>
                                </tr>

                                <tr>
                                    <td class="CellWidth40">
                                        <div><b>PF Interest (OWN) : </b></div>
                                    </td>
                                    <td class="CellWidth60">
                                        <asp:Label ID="Label5" Text='<%#Eval("PF_INT_OWN") %>' runat="server"></asp:Label></td>
                                </tr>


                                <tr>
                                    <td class="CellWidth40">
                                        <div><b>PF Interest (Employer) : </b></div>
                                    </td>
                                    <td class="CellWidth60">
                                        <asp:Label ID="Label6" Text='<%#Eval("PF_INT_EMP") %>' runat="server"></asp:Label></td>
                                </tr>
                                <hr />
                                <tr>
                                    <td class="CellWidth40" >
                                        <b>PF Total  : </b>
                                    </td>
                                    <td class="CellWidth60" style="color:#02337a;"><b>
                                        <asp:Label ID="Label7" Text='<%#Eval("PF_Total") %>' runat="server"></asp:Label></b></td>
                                </tr>


                                <tr>
                                    <td class="CellWidth40">
                                        <b>VPF Total  : </b>
                                    </td>
                                    <td class="CellWidth60" style="color:#ff5733;" ><b>
                                    
                                        <asp:Label ID="Label8" Text='<%#Eval("cb_vpfamt") %>' runat="server"></asp:Label></b></td>
                                </tr>
                             


                            </table>
                            <hr />
                        </ItemTemplate>

                        <FooterTemplate>
                            <div class="container">

                                <div style="border: 1px solid groove; width: 90%; height:90%;">
                                <h4>
                                   No Record Found.. 
                                   </h4>
                                </div>
                            </div>

                        </FooterTemplate>

                    </asp:DataList>

                </td>
            </tr>
        </table>
    </div>
</asp:Content>
