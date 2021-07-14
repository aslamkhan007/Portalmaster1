<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="EImgUpd1.aspx.cs" Inherits="EImgUpd1" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        try
        {

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
        }
        catch (err)
        {
            alert(err);
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

    <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
        <tr>

            <i><asp:Label ID="lblid" runat="server"  ></asp:Label>               </i> 
            


            <td class="content-sub-heading" style="text-align: left;" colspan="2">Upload Image
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>

        <tr>
            <td style="text-align: center;" class="card">
                <div class="card-main" style="text-align: center;">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:Image ID="Image6" runat="server" AlternateText="Image Not Found" BorderColor="Black"
                                BorderStyle="Solid" BorderWidth="1px" GenerateEmptyAlternateText="True" Height="125px"
                                Width="110px" />
                            <br />
                        </ContentTemplate>
                    </asp:UpdatePanel>
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
                </div>

            </td>
        </tr>

        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>

        <tr>

            <td colspan="2">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:ImageButton AlternateText="Upload File(s)" ID="imgUpload" runat="server" OnClick="btnUpload_Click" title="For Uploading File" OnClientClick="return postbackButtonClick();"
                            ImageUrl="~/Image/Uploads.png" Width="73px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
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


    </table>
</asp:Content>



