<%@ Page Title="" Language="VB" MasterPageFile="~/Main2.master" AutoEventWireup="false"
    CodeFile="Jct_Payroll_Employee_Personal_Info.aspx.vb" Inherits="Payroll_Jct_Payroll_Employee_Personal_Info" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <script src="js/PopUp.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/StyleSheets/formatingsheet.css" />
    <div class="container">
        <style type="text/css">
            .PendingAuthLable {
                -webkit-backface-visibility: hidden;
                backface-visibility: hidden;
                background-color: #C29B0E;
                color: #FFFFFF;
                min-height: 56px;
                z-index: 05;
            }

            .Actiona {
                font-size: 20px;
                font-weight: 500;
                line-height: 5px;
            }

            .numberCircle {
                border-radius: 1000%;
                background: #fff;
                color: #c13030;
                text-align: center;
                font: 23px Arial,icon;
                font-weight: 1000;
                /*width: 36px;
  height: 36px;*/
            }

            .CellWidth02 
            {
                    width: 2%;
            }

             .blinking {
                animation: blinkingText 0.5s infinite;
            }

            @keyframes blinkingText {
                0% {
                    color: #000;
                }

                49% {
                    color: transparent;
                }

                50% {
                    color: transparent;
                }

                99% {
                    color: transparent;
                }

                100% {
                    color: #000;
                }
            }
        </style>
        <style type="text/css">
            .aParent div
            {
                float: left;
                clear: none;
            }
        </style>
        <telerik:RadWindow RenderMode="Lightweight" ID="modalPopup" runat="server" Width="300px"
            VisibleOnPageLoad="false" CenterIfModal="true" Height="305px" Modal="true" OffsetElementID="main"
            EnableShadow="true" Behaviors="None" Style="z-index: 100001;">
            <ContentTemplate>
                <div class="aParent">
                    <div style="width: auto; float: left;">
                        <h6>
                            <b>&nbsp;<asp:Label ID="lblInfo" runat="server" Text="Please Select in which category you fall."></asp:Label> </b></h6>
                        <div style="width: 50%;">
                            &nbsp; <strong>Select</strong>
                        </div>
                        <div style="width: 50%;">
                            <asp:DropDownList ID="ddlCatgList" runat="server" CssClass="btn btn-default btn-sm" ValidationGroup="submit"
                                Width="130px">
                                <asp:ListItem Text=""></asp:ListItem>
                                <asp:ListItem Text="General"></asp:ListItem>
                                <asp:ListItem Text="SC"></asp:ListItem>
                                <asp:ListItem Text="ST"></asp:ListItem>
                                <asp:ListItem Text="BC"></asp:ListItem>
                                <asp:ListItem Text="OBC"></asp:ListItem>
                                <asp:ListItem Text="Muslim"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="req_ddlcatg" runat="server" ControlToValidate="ddlCatgList" ValidationGroup="submit"
                                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <p>
                            &nbsp;</p>
                        <div style="text-align: center; width: 100%">
                            <asp:LinkButton ID="cmdSubmit" runat="server" Text="Submit" ValidationGroup="submit"></asp:LinkButton>&nbsp;
                            <asp:LinkButton ID="cmdBack" runat="server" Text="Back" PostBackUrl="Jct_Payroll_Employee_Personal_Info.aspx"></asp:LinkButton>
                        </div>
                    </div>
                    <p><asp:Label ID="lblSubmittedVal" runat="server" Text="" Width="200px" Font-Bold="True" ForeColor="#FF6600" > </asp:Label></p>
                </div>
            </ContentTemplate>
        </telerik:RadWindow>
        <%--<telerik:RadCodeBlock runat="server" ID="rdbScripts">
        <script type="text/javascript">
            $modalWindowDemo.modalWindowID = "<%=modalPopup.ClientID %>";
        </script>
    </telerik:RadCodeBlock>--%>
        <telerik:RadAjaxLoadingPanel runat="server" ID="ralpConfiguration">
        </telerik:RadAjaxLoadingPanel>
        <table style="width: 100%;" cellpadding="2" cellspacing="2">
            <tr>
                <td class="content-sub-heading">
                    <asp:Label ID="Label4" runat="server" Text="Pending Authorizations:For Authorization Action Click On  :"
                        CssClass="Actiona"></asp:Label>
                    <asp:LinkButton ID="lnkLink" runat="server">Approval</asp:LinkButton>
                </td>
            </tr>
            <%--<tr>
            <td></td>
            </tr>--%>
            <tr>
                <td class="table-responsive PendingAuthLable">
                
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Vertical"
                        Width="90%" CellPadding="0" CellSpacing="0">
                        <ItemTemplate>
                            <table class="tblSub">
                                <tr>
                                    <td style="vertical-align: top;" class="CellWidth30">
                                        <b>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("AreaName") %>'></asp:Label>
                                        </b>
                                    </td>
                                    <td style="vertical-align: top;" class="CellWidth02 numberCircle">
                                        <asp:Label ID="lblCount" runat="server" Text='<%# Eval("Count") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:misjctdev %>"
                    SelectCommand="JCT_Payroll_Pending_Action_Counter" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserCode" SessionField="Empcode" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </tr>
            <tr>
                <td class="table-responsive">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label16" runat="server" Text="Employee Personel Info" CssClass="content-sub-heading"></asp:Label>
                    <asp:LinkButton ID="cmdreporticon" runat="server" Width="32px" Height="32px" Text="Alert"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="table-responsive">
                    <asp:LinkButton ID="lnkRedirectbtn" runat="server"  Width="32px"  Height="32px" OnClick = "Submit" Text="Details"></asp:LinkButton>
                    <asp:DataList ID="dlstEmp" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                        Width="90%" CellPadding="0" CellSpacing="0">
                        <ItemTemplate>
                            <table class="tblSub">
                                <tr>
                                    <td style="vertical-align: top;" class="CellWidth30">
                                        <b>
                                            <asp:Label ID="Label3" Text='<%#Eval("Particulars") %>' runat="server"></asp:Label></b>
                                    </td>
                                    <td style="vertical-align: top;" class="CellWidth60">
                                        <asp:Label ID="Label2" Text='<%#Eval("Values") %>' runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
