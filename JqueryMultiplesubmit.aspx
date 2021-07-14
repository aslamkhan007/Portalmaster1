<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JqueryMultiplesubmit.aspx.cs" Inherits="JqueryMultiplesubmit" %>

<!DOCTYPE html>
<script src="js/jquery.min.2.2.0.js"></script>

<script>
    $(document).ready(function () {
        $("input").prop('required', true);


        $("#button1").click(function () {
            debugger;
            return false;
            $("input").prop('required', true);
            alert("Second button is pressed - Form did not submit")
        });

        $('#myform').submit(function (e) {
            debugger;
            e.preventDefault();
            //$("#myform input").click(function (ev) {
            //    debugger;
            //    ev.preventDefault()
            //if ($(this).attr("value") == "button1") {
                //$("#button1").click(function () {

            $("#myform input").click(function () {

                alert("First Button is pressed - Form will submit")
                $("#myform").submit();
                //});
            });
                //if ($(this).attr("value") == "button2") {
                //$("#button2").click(function () {
                //    alert("Second button is pressed - Form did not submit")
                //});
            //});
        });
});
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<form id="myform" >
    <input type="number" name="email" />
    <input type="button" value="button1" id = "button1"  name ="button1" />
    <input type="submit" value="button2"  id = "button2" name = "button2" />
</form>
</body>
</html>
