<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>
<script src="js/jquery.min.2.2.0.js"></script>
<script src="js/jspdf.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
    <script type = "text/javascript">
        var doc = new jsPDF();
        $('#cmd').click(function () {
            doc.fromHTML($('#content').html(), 15, 15, {
                'width': 170,
                'elementHandlers': specialElementHandlers
            });
            doc.save('sample-file.pdf');
        });
    </script>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
  <div id="content">
    <h3>Sample h3 tag</h3>
    <p>Sample pararaph</p>
</div>
<button id="cmd">Gen</button>
    </form>
</body>
</html>
