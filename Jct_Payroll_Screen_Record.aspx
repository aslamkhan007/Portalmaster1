<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="Jct_Payroll_Screen_Record.aspx.cs" Inherits="Jct_Payroll_Screen_Record" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width"> --%>
    <meta name="viewport" content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0, user-scalable = no" />
    <script type="text/javascript" src="js/footable.js?v=2-0-1.js"></script>
    <link href="style.css" rel="stylesheet" />

    <%--<link href="stylesheets/FormatingSheet.css" rel="stylesheet" />--%>

    
    <div class="tileTable"  style="height: 100%;" >
        
        <table class="tblMain">
            
            <tr>
                <td colspan="3" class="content-sub-heading">Search Employee</td>
            </tr>
        
            <tr>
                
                <td >&nbsp;Name : &nbsp;
                </td>
                <td colspan="3" style="align-content: inherit;">
                    <div>
                        <asp:TextBox ID="txtEmployee" runat="server" AutoPostBack="False"
                            ></asp:TextBox>
                        <%--OnTextChanged="txtEmployee_TextChanged"  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                        <asp:LinkButton ID="lnksave" runat="server" OnClick="lnksave_Click"
                            ValidationGroup="A" Text="Fetch"></asp:LinkButton>
                        <%--</ContentTemplate>
                   </asp:UpdatePanel>--%>
                       <%--  <cc1:AutoCompleteExtender ID="txtEmployee_AutoCompleteExtender" runat="server" CompletionInterval="10"
                            CompletionListCssClass="AutoExtender" CompletionListElementID="divwidth" CompletionListHighlightedItemCssClass="AutoExtenderHighlight"
                            CompletionListItemCssClass="AutoExtenderList" CompletionSetCount="5" MinimumPrefixLength="3"
                            ServiceMethod="GetEmployeeName" ServicePath="~/WebService.asmx" TargetControlID="txtEmployee">
                        </cc1:AutoCompleteExtender>--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmployee"
                            ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>

                    </div>
                </td>
                
            </tr>
            
            <%--  --%>
            <tr>
                
                <td colspan="4"  style="font-size:small; text-align:left;"  class="style1">
                     <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <asp:Panel ID="Panel1" runat="server" Height="95%" ScrollBars="Both" Width="95%" Visible="false">
         
                        <div class="wrapper">
                            <asp:GridView CssClass="footable" ID="grdDetail" runat="server" AutoGenerateColumns="true" ShowFooter="true" OnRowCreated="onRowCreate" Width="93%">
                              
                            </asp:GridView>
                            <script type="text/javascript">
                                $(function () {
                                    $('#<%=grdDetail.ClientID %>').footable({
                          breakpoints: {
                              phone: 300,
                              tablet: 640
                          }
                      });
                  });
                            </script>
                        </div>
                    </asp:Panel>
                      </ContentTemplate>
                         <Triggers>
                             <asp:AsyncPostBackTrigger ControlID="lnksave" EventName="Click" />
                         </Triggers>
                </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


