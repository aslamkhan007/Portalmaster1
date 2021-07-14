<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true"
    CodeFile="ReimDocUploads.aspx.cs" Inherits="Payroll_ReimDocUploads" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            updateProgress = $find("<%= UpdateProgress1.ClientID %>");
            window.setTimeout("updateProgress.set_visible(true)", updateProgress.get_displayAfter());
            return true;
        }

    </script>

    <style type="text/css">
        .clslnkbutton {
            background-image: url(./Image/Icons/delete.png);
            background-position: 2px;
            height: 50px;
            width: 50px;
        }
    </style>

    <table style="padding: 1px; margin: 1px; width: 100%">
        <tr>
            <td colspan="4" class="content-sub-heading">Reimbursement Uploads</td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td class="CellWidth20" colspan="4" style="text-align: Right">
                <asp:LinkButton ID="lnksave" runat="server" class="btn btn-brand"
                    ValidationGroup="A" OnClick="lnksave_Click">Back</asp:LinkButton>
            </td>
        </tr>

        <tr>
            <td class="CellWidth20">YearMonth
            </td>
            <td class="CellWidth30">
                <asp:DropDownList ID="DrpLvStatus" runat="server" AutoPostBack="True"
                    CssClass="btn btn-default btn-sm" OnSelectedIndexChanged="DrpLvStatus_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="CellWidth20"></td>
            <td class="CellWidth30"></td>
        </tr>

        <tr>
            <td class="CellWidth20">&nbsp;</td>
            <td class="CellWidth30">&nbsp;</td>
            <td class="CellWidth20">&nbsp;</td>
            <td class="CellWidth30">&nbsp;</td>
        </tr>

        <tr>
            <td class="CellWidth20">

                <asp:Label ID="Label45" runat="server" Visible="True" Width="103px">Reimbursement Type</asp:Label>
            </td>
            <td class="CellWidth80">
                <div style="text-align: left;">
                    <asp:DropDownList ID="DropDownList20" runat="server" CssClass="btn btn-default btn-sm" AutoPostBack="True" OnSelectedIndexChanged="DropDownList20_SelectedIndexChanged">
                        <%--<asp:ListItem>Car</asp:ListItem>
                        <asp:ListItem>Driver</asp:ListItem>
                        <asp:ListItem>Entertainment</asp:ListItem>
                        <asp:ListItem>Telephone</asp:ListItem>--%>                        
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
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <div id="FileUploadContainer">
                        </div>
                        &nbsp;<img alt="Add File" src="/Image/Icons/Action/document_adds.png" onclick="AddFileUpload()" title="Please Select The File"
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
            
            <td colspan="4">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:ImageButton AlternateText="Upload File(s)" ID="imgUpload"   runat="server" OnClick="btnUpload_Click" title="For Uploading File" OnClientClick="return postbackButtonClick();"
                            ImageUrl="~/Image/Uploads.png" Width="73px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>            
            <td colspan="4">
                <asp:Label ID="Labelsize" runat="server" BackColor="Transparent" ForeColor="Red" Font-Size="XX-Small" Text="Max File Size : 2MB"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                    <ProgressTemplate>
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Image/load.gif" Height="100px" Width="100px" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:DataList ID="DataList2" runat="server" RepeatColumns="6" RepeatDirection="Vertical"
                            OnItemCommand="DataList2_ItemCommand">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <div style="margin: auto; width: 64px">
                                                <asp:ImageButton ID="ImageButton1" runat="server" AlternateText='<%# Eval("RefDocActFileName") %>' OnClientClick="return postbackButtonClick();"
                                                    ImageUrl='<%# Eval("LogoImgPath") %>' Visible="False" Width="64px" />
                                                <asp:Image ID="Image2" runat="server" AlternateText='<%# Eval("RefDocActFileName") %>' OnClientClick="return postbackButtonClick();"
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

                                    <tr>
                                        <td style="text-align: center">                                           

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
</asp:Content>
