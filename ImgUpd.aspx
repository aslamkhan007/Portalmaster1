<%@ Page Title="Upload Image" Language="VB" AutoEventWireup="false" MasterPageFile="~/Main2.master" CodeFile="ImgUpd.aspx.vb" Inherits="ImgUpd" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tile" style="height: 100%; width:100%;">
        
        <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
            <tr>
                <td class="content-sub-heading" style="text-align: left;" colspan="2">Upload Image
                </td>
            </tr>
            <tr>
                <td class="CellWidth05"></td>
                <td style="text-align: center;" class="card">
                    <div class="card-main" style="text-align: center;">
                    <asp:Image ID="Image5" runat="server" AlternateText="Image Not Found" BorderColor="Black"
                        BorderStyle="Solid" BorderWidth="1px" GenerateEmptyAlternateText="True" Height="125px"
                        Width="110px" />
                        <br />
                  
                        
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="textbox"
                        Height="24px" Width="258px" />
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                        ControlToValidate="FileUpload1" CssClass="errormsg" Display="Dynamic"
                        ErrorMessage="Select files having extensions .JPG, .Jpeg"
                        SetFocusOnError="True"
                        ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.jpeg|.JPEG)$"></asp:RegularExpressionValidator>
                        
                    </div>
                </td>
                
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:LinkButton ID="lnksave" runat="server" class="btn btn-brand"  
                        ValidationGroup="A">Upload</asp:LinkButton>
                   
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;
 
</td>
               
            </tr>

        </table>
    
    </div>
</asp:Content>


