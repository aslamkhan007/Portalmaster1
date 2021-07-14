<%@ Page Title="" Language="VB" MasterPageFile="~/Main2.master" AutoEventWireup="false" CodeFile="Jct_Payroll_Change_Pass.aspx.vb" Inherits="Jct_Payroll_Change_Pass" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="tileTable" style="height: 100%;">
        <div class="card">
     <table cellpadding="2" cellspacing="1" style="width: 100%" class="tblMain">
        <tr>
            <td  colspan="2">
                <asp:Label ID="Label5" runat="server" CssClass="content-sub-heading"  Text="Change Your Password"></asp:Label></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label1" runat="server" Text="Current Password:" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Width="120px" ForeColor="#404040"></asp:Label></td>
            <td width="78%" >
                <asp:TextBox ID="txtcurrpwd" runat="server"   TextMode="Password" Width="200px" ></asp:TextBox>
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Italic="False" ForeColor="Red"
                    Text="Incorrect Password!!" Font-Names="Tahoma" Font-Size="8pt"></asp:Label></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="New Password:" Width="120px" ForeColor="#404040"></asp:Label></td>
            <td >
                <asp:TextBox ID="txtNewpwd" runat="server" TextMode="Password" Width="200px" MaxLength="10" ></asp:TextBox>
                
<asp:RegularExpressionValidator ID="RegExp1" runat="server"     
ErrorMessage="Password length must be between 7 to 10 characters"
ControlToValidate="txtNewpwd"    
ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$" />

                <asp:Label ID="lblNew" runat="server" Font-Bold="True" Font-Italic="False" ForeColor="Red"
                    Text="Password Can't Be Blank!!" Font-Names="Tahoma" Font-Size="8pt"></asp:Label></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="Confirm Password:" Width="120px" ForeColor="#404040"></asp:Label></td>
            <td >
                <asp:TextBox ID="txtcongpwd" runat="server"  MaxLength="10"  TextMode="Password" Width="200px" ></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewpwd"
                    ControlToValidate="txtcongpwd" ErrorMessage="Passwords Do Not Match !!" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td >
            </td>
            <td >
                <asp:Button ID="cmdApply" runat="server"   Text="Apply"  class="btn btn-brand"  />&nbsp;
                <asp:Button ID="cmdCancel" runat="server"  Text="Cancel"  class="btn btn-brand" /></td>
        </tr>
    </table>
         </div>
        </div>
</asp:Content>


