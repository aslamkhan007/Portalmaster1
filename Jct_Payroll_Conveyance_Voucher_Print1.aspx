<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jct_Payroll_Conveyance_Voucher_Print1.aspx.cs"  MasterPageFile="~/Main2.master"
    Inherits="Payroll_Jct_Payroll_Conveyance_Voucher_Print" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--<html>
<head runat="server">

<title></title>--%>

<style type="text/css">

    body {
  text-align: center;
  background: lightblue;
}

  	.hoverTable{
		  display: inline-block;
  margin: 1em;
  text-transform: uppercase;
  padding: 1em 1.5em;
  background: none;
  color:darkblue;  
  font-weight: bold;
  position: relative;
  transition:color 0.25s ease;
  border:3px solid white;
	}

.hoverTable:hover {
  color:red;
}

.hoverTable::after {
  position: absolute;
  content: '';
  top:0;
  left: 0;
  width: 0;
  height: 100%;
  background-color: white;
  transform-origin:left;
  transition:width 0.25s ease;
  z-index:-1;
}

.hoverTable:hover::after {
  width: 100%;
}


</style>


<%--</head>
<body>
    <form id="form1" runat="server">--%>

        
<table >
	<tr class="hoverTable">
		<td >Text 1A</td><td>Text 1B</td><td>Text 1C</td>
	</tr>
	<tr>
		<td>Text 2A</td><td>Text 2B</td><td>Text 2C</td>
	</tr>
	<tr>
		<td>Text 3A</td><td>Text 3B</td><td>Text 3C</td>
	</tr>
</table>



        <button class="btn">button</button>

<%--    </form>
</body>
</html>--%>
    </asp:Content>
