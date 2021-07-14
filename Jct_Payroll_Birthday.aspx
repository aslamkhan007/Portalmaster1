<%@ Page Title="" Language="VB" MasterPageFile="~/Main2.master" AutoEventWireup="false" CodeFile="Jct_Payroll_Birthday.aspx.vb" Inherits="Payroll_Jct_Payroll_Birthday" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <header>
        <style>
            #content {
                position: absolute;
            }

            #diamond {
                position: relative;
                z-index: 20;
            }

            #spade {
                background-image: url('Emp_Images/NoImage.jpg');
                background-repeat: no-repeat;
                position: relative;
                z-index: auto;
                left: 10px;
                top: 2px;
            }

            #Header {
                width: 60%;
                height: 80%;
                background-image: url('/Images/BirthdayBGFinal.jpg') 50% 0 no-repeat;
                background-repeat: no-repeat;
                display: block;
                position: relative;
                /*background: url('/images/background-image.jpg') 50% 0 no-repeat;*/
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
    </header>
    <div class="tileTable" style="height: 100%;">
        <table style="width: 100%; height: 90%;" class="tblMain">
            <tr>
                <td colspan="2" class="content-sub-heading">
                    <asp:Label ID="Label16" runat="server" Text="Birthday List"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="CellWidth20">Plant
                </td>
                <td>
                    <div style="text-align: left;">
                        <asp:DropDownList ID="ddlPlant" runat="server" AutoPostBack="True" CssClass="btn btn-default btn-sm">
                            <asp:ListItem Value="PLN-100">Phagwara</asp:ListItem>
                            <asp:ListItem Value="PLN-101">Hoshiarpur</asp:ListItem>
                            <asp:ListItem Value="PLN-102">HO</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:DataList ID="dlstEmp" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" Width="90%" ShowFooter="false">
                        <ItemTemplate>
                            <table style="width: 100%;" cellpadding="1" cellspacing="1">
                                <tr>
                                    <td style="width: 25%">
                                        <div><b>Employee Name : </b></div>
                                    </td>
                                    <td style="width: 45%">
                                        <asp:Label ID="Label2" Text='<%#Eval("EmpName") %>' runat="server"></asp:Label>
                                    </td>
                                    <td rowspan="4">

                                        <div id="diamond">
                                            <asp:Image ID="Image2" runat="server" BorderStyle="None" Height="55px"
                                                ImageAlign="Top" ImageUrl="Image/Crown.PNG" Width="125px" />
                                        </div>
                                        <div id="spade">
                                            <asp:Image ID="Image3" runat="server" BorderStyle="None" Height="150px"
                                                ImageAlign="Top" ImageUrl='<%# Eval("RefImg") %>' AlternateText="" Width="105px" />
                                        </div>

                                    </td>
                                </tr>
                                <tr style="width: 25%">
                                    <td>
                                        <div><b>Designation : </b></div>
                                    </td>
                                    <td style="width: 45%">
                                        <asp:Label ID="Label3" Text='<%#Eval("Designation") %>' runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%">
                                        <div><b>Department : </b></div>
                                    </td>
                                    <td style="width: 45%">
                                        <asp:Label ID="Label4" Text='<%#Eval("Department") %>' runat="server"></asp:Label></td>
                                </tr>
                                <tr style="height: 20px">
                                    <td></td>
                                    <td></td>
                                </tr>


                            </table>
                            <hr />
                        </ItemTemplate>

                        <FooterTemplate>
                            <div class="container">

                                <div style="border: 1px solid groove; width: 90%; height:90%;">
                                    
                                    <asp:Image ID="Image3" runat="server" BorderStyle="None"
                                        ImageAlign="Top" ImageUrl="Images/BirthdayBGFinal.jpg" Width="100%" Height="100%" />
                                </div>
                            </div>

                        </FooterTemplate>

                    </asp:DataList>

                </td>

            </tr>
        </table>
    </div>
</asp:Content>
