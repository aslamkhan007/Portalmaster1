<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jqueryhtmlguide.aspx.cs" Inherits="jqueryhtmlguide" %>

<!DOCTYPE html>
<script src="js/jquery.min.2.2.0.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        //$("input").prop('required', true);
        $('#first_form').submit(function (e) {
            e.preventDefault();
            $("input").prop('required', true);
            debugger;
            var first_name = $('#first_name').val();
            var last_name = $('#last_name').val();
            //var email = $('#email').val();
            var password = $('#password').val();

            $(".error").remove();

            if (first_name.length < 1) {
                $('#first_name').after('<span class="error">This field is required</span>');

            }
            if (last_name.length < 1) {
                $('#last_name').after('<span class="error">This field is required</span>');

            }
            //if (email.length < 1) {
            //    $('#email').after('<span class="error">This field is required</span>');
            //    return false;
            //} else {
            //    var regEx = /^[A-Z0-9][A-Z0-9._%+-]{0,63}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/;
            //    var validEmail = regEx.test(email);
            //    if (!validEmail) {
            //        $('#email').after('<span class="error">Enter a valid email</span>');
            //    }
            //}
            if (password.length < 8) {
                $('#password').after('<span class="error">Password must be at least 8 characters long</span>');

            }
        });

        $('#a').click(function () {

            debugger;
            var first_name = $('#first_name').val();
            var last_name = $('#last_name').val();
            var email = $('#email').val();
            var password = $('#password').val();

            $(".error").remove();

            if (first_name.length < 1) {
                //$('#first_name').after('<span class="error">This field is required</span>');                
                //return true;
                alert('This field is required');
                $('#first_name').focus();
                return;
            }
            if (last_name.length < 1) {
                //$('#last_name').after('<span class="error">This field is required</span>');
                alert('This field is required');
                $('#last_name').focus();
                return;
            }
            //if (email.length < 1) {
            //    $('#email').after('<span class="error">This field is required</span>');
            //    return false;
            //} else {
            //    var regEx = /^[A-Z0-9][A-Z0-9._%+-]{0,63}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/;
            //    var validEmail = regEx.test(email);
            //    if (!validEmail) {
            //        $('#email').after('<span class="error">Enter a valid email</span>');
            //    }
            //}
            if (password.length < 8) {
                $('#password').after('<span class="error">Password must be at least 8 characters long</span>');
                $('#password').focus();
                return false;
            }

            //if ($('input:radio', this).is(':checked'))
            //{
            //    // everything's fine...
            //} else
            //{
            //    alert('Please select something!');
            //    return false;
            //}

            if ($('[name="print"]:checked').length === 0) {
                alert('Please select something!');

                return false;
            }

            $.ajax({
                url: 'jqueryhtmlguide.aspx/GetEmpData',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{}",
                success: function (_data) {
                    _data = JSON.parse(_data.d);
                    $("#tbl").find("tr:gt(0)").remove();
                    for (var i = 0; i < _data.length; i++) {
                        $("#tbl").append('<tr><td>' + _data[i].EmpName + '</td><td>' + _data[i].EmpAge + '</td><td>' + _data[i].EmpAddress + '</td><td><input type="button" id="btndelete" value="Delete" onclick="DeleteData(' + _data[i].EmpId + ')" /></td>  <td><input type="button" id="btnedit" value="Edit" onclick="EditData(' + _data[i].EmpId + ')" /></td>  </tr>');
                    }
                    DelayRedirect();

                },
                //error: function () {
                //    alert("Get Error");                    
                //}
                //error: function (xhr, ajaxOptions, thrownError) {
                //    alert(xhr.status);
                //}
                //error: function (request, status, error) {
                //    alert();
                //}
                error: function (jqXHR, textStatus, errorThrown) {
                    //alert(jqXHR.responseText);
                    jsonValue = jQuery.parseJSON(jqXHR.responseText);
                    alert(jsonValue.Message);
                }

            });



        });






        function DelayRedirect() {
            debugger;
    var seconds = 5;
    var dvCountDown = document.getElementById("dvCountDown");
    var lblCount = document.getElementById("lblCount");
    dvCountDown.style.display = "block";
    lblCount.innerHTML = seconds;
    setInterval(function () {
        seconds--;
        lblCount.innerHTML = seconds;
        if (seconds == 0) {
            dvCountDown.style.display = "none";
            window.location = "/JqValidity.aspx/";
        }
    }, 1000);
}



    });

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        form label {
            display: inline-block;
            width: 100px;
        }

        form div {
            margin-bottom: 10px;
        }

        .error {
            color: red;
            margin-left: 5px;
        }

        label.error {
            display: inline;
        }
    </style>
</head>
<body>
    <%--    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>--%>


    <!-- First Form -->

    <form id="first_form">
        <div>
            <label for="first_name">First Name:</label>
            <input type="text" id="first_name" name="first_name"></input>
        </div>
        <div>
            <label for="last_name">Last Name:</label>
            <input type="number" id="last_name" name="last_name"></input>
        </div>
        <div>
            <%--<label for="email">Email:</label>--%>
            <%-- <input type="email" id="email" name="email"></input>--%>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password"></input>
        </div>
        <div>

            <div class="radio">
                <label for="print">First:</label>
                <input type="radio" name="print" value="Radio1" class="rad" /><label class="label">Radio1</label>

                <label for="print">Second:</label>
                <input type="radio" name="print" value="Radio2" class="rad" /><label class="label">Radio2</label>

                <label for="print">third:</label>
                <input type="radio" name="print" value="Radio3" class="rad" /><label class="label">Radio3</label>
            </div>


            <input type="submit" value="Submit" id="b" />
            <input type="button" value="Submit1" id="a" />
        </div>

        <table id="tbl">
            <tr>
                <th>Enmployee Name</th>
                <th>Employee Age</th>
                <th>Employee Address</th>
                <th></th>
                <th></th>
            </tr>

        </table>
                <div id="dvCountDown" style = "display:none">
You will be redirected after <span id = "lblCount"></span>&nbsp;seconds.
</div>
    </form>

</body>
</html>
