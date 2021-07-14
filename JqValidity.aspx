<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JqValidity.aspx.cs" Inherits="JqValidity" %>

<!DOCTYPE html>

<script src="js/jquery.min.2.2.0.js"></script>
<script src="js/jquery.validate.js"></script>


<style type="text/css">



</style>



<script>
    $(document).ready(function () {
        $("input").prop('required', true);
        //$(".numbers-only").keypress(function (e) {
        //    debugger;
        //    if (e.which == 46) {
        //        if ($(this).val().indexOf('.') != -1) {
        //            return false;
        //        }
        //    }
        //    if (e.which != 8 && e.which != 0 && e.which != 46 && (e.which < 48 || e.which > 57)) {
        //        return false;
        //    }
        //});

    });
</script>



<html>



<head runat="server">
    <link href="css/site-demos.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <%--    <form id="form1" runat="server">
        <div>
        </div>
    </form>--%>

    <form id="myform">

        <input type="number"  class="numbers-only" id="field" name="field">


        <input type="date" " class="numbers-only" id="field1" name="field1">

        <input type="text" class="numbers-only" id="field2" name="field2">
        <br />
        <input type="submit" value="Validate!">
    </form>
</body>
</html>
