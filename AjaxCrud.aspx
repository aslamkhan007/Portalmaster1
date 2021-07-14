<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxCrud.aspx.cs" Inherits="AjaxCrud" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <script src="js/jquery.min.2.2.0.js"></script>

    <script type="text/javascript">  
    $(function() {  
        $("#btnSave").click(function() {  
            var user = {};  
            user.FName = $("#FirstName").val(); // FName as per name of Employee Class  
            user.LName = $("#Surname").val();  
            user.MName = $("#MiddleName").val();  
            user.Gender = $("#Male").val();  
            user.Email = $("#EmailId").val();  
            user.Dob = $("#Dob").val();  
            user.MaritalStatus = $("#MaritalStatus").val();  
            user.Hobbies = $("#Hobbies").val();  
            user.HomeMobile = $("#TelephoneNo").val();  
            user.OfficeMobile = $("#MobileNo").val();  
            user.Address = $("#ResidentialAddress").val();  
            user.Pincode = $("#PinCode").val();  
            user.State = $("#State").val();  
            user.Nationality = $("#Nationality").val();  
            user.Doj = $("#Doj").val();  
            user.CreatedDateTime = new Date();  
            user.ModifiedDateTime = new Date();  
            $.ajax({  
                type: "POST",  
                url: "AjaxCrud.aspx/SaveUser", // Default.aspx is the page and SaveUser is the WebMethod to save data in database  
                data: '{objEmployee: ' + JSON.stringify(user) + '}', //objEmployee is the object of Employee Class defined in .cs  
                dataType: "json",  
                contentType: "application/json; charset=utf-8",  
                success: function() {  
                    alert("User has been added successfully.");  
                    getDetails(); //This method is to bind the added data into my HTML Table through Ajax call instead of page load  
                    // window.location.reload(); we can also use this to load window to show updated data  
                },  
                error: function() {  
                    alert("Error while inserting data");  
                }  
            });  
            return false;  
        });  
    });





    function getDetails() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Default.aspx/GetData", //Default.aspx is page and GetData is the WebMethod  
            data: {},
            dataType: "json",
            success: function (data) {
                $('#dataTables-example tbody').remove(); // Every time I am removing the body of Table and applying loop to display data  
                //console.log(data.d);    
                for (var i = 0; i < data.d.length; i++) {
                    $("#dataTables-example").append(
                        "<tr><td>" + data.d[i].FName + "</td><td>" + data.d[i].Email + "</td>" +
                        "<td>" + data.d[i].HomeMobile + "</td>" + "<td>" + data.d[i].OfficeMobile + "</td>" +
                        "<td>" + data.d[i].Doj + "</td>" + "<td>" + data.d[i].Dob + "</td>" +
                        "<td>" + "<input type='button' class='btn btn-primary editButton' data-id='" + data.d[i].EmpId + "' data-toggle='modal' data-target='#myModal' name='submitButton' id='btnEdit' value='Edit' />" + "</td>" +
                        "<td><input type='button' class='btn btn-primary' name='submitButton' id='btnDelete' value='Delete'/> </td></tr>");
                }
            },
            error: function () {
                alert("Error while Showing update data");
            }
        });
    }


</script> 

<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="col-lg-8">  
    <div class="panel panel-primary">  
        <div class="panel-heading">  
            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Employee Details </h3>  
        </div>  
        <div class="panel-body">  
            <div class="form-group col-lg-4">  
                <label>First Name</label>  
                <input type="text" name="FirstName" id="FirstName" class="form-control" placeholder="First Name" required="" />  
            </div>  
            <div class="form-group col-lg-4">  
                <label>Middle Name</label>  
                <input type="text" name="MiddleName" id="MiddleName" class="form-control" placeholder="Kumar" required="" />  
            </div>  
            <div class="form-group col-lg-4 ">  
                <label>Surname</label>  
                <input type="text" name="Surname" id="Surname" class="form-control" placeholder="Gupta" required="" />  
            </div>  
            <div class="clearfix"></div>  
            <div class="form-group col-lg-6">  
                <label>Email ID</label>  
                <input type="email" name="EmailId" id="EmailId" class="form-control" placeholder="abc@someone.com" required="" />  
            </div>  
            <div class="form-group col-lg-6">  
                <label>Date of Birth </label>  
                <input type="date" name="Dob" id="Dob" min="1920-01-02" class="form-control datepicker" required="" />  
            </div>  
            <div class="form-group col-lg-6">  
                <label>MaritalStatus</label>  
                <select name="MaritalStatus" id="MaritalStatus" class="form-control" required="">  
                    <option value="" disabled="disabled">-- Select -- </option>  
                    <option value="Single">Single</option>  
                    <option value="Married">Married</option>  
                </select>  
            </div>  
            <div class="form-group col-lg-6">  
                <label>Hobbies</label>  
                <input type="text" name="Hobbies" id="Hobbies" class="form-control" placeholder="Football, Cricket etc." />  
            </div>  
  
            <div class="form-group col-lg-6">  
                <label>Home Telephone</label>  
                <input type="text" name="TelephoneNo" id="TelephoneNo" class="form-control" placeholder="1234567890" />  
            </div>  
  
            <div class="form-group col-lg-6">  
                <label>Mobile</label>  
                <input type="tel" name="MobileNo" id="MobileNo" class="form-control" required="" placeholder="0987654321" />  
            </div>  
            <div class="form-group col-lg-12">  
                <label>Residential Address</label>  
                <textarea rows="2" name="ResidentialAddress" id="ResidentialAddress" class="form-control" required=""> 
                    </textarea> 
                    <div class="form-group col-lg-6 ">  
                        <label>Pin Code</label>  
                        <input name="PinCode" id="PinCode" class="form-control" placeholder="999999" type="text"/>  
                    </div>  
  
                    <div class="form-group col-lg-6">  
                        <label>State</label>  
                        <select name="State" id="State" class="form-control" required="">  
                            <option value="" disabled="disabled">-- Select -- </option>  
                            <option value="Maharashtra">Maharastra</option>  
                            <option value="Assam">Assam</option>  
                            <option value="UP">UP</option>  
                            <option value="Gujarat">Gujarat</option>  
                            <option value="AP">Andhra Pradesh</option>  
                        </select>  
                    </div>  
                    <div class="form-group col-lg-6">  
                        <label>Nationality</label>  
                        <input name="title" id="Nationality" class="form-control" placeholder="Indian" type="text" />  
                    </div>  
                    <div class="form-group col-lg-6">  
                        <label>Date of Joining</label>  
                        <input name="Doj" id="Doj" class="form-control datepicker" required="" type="date"/>
                    </div>  
                    <div class="form-group col-lg-8">  
                        <div style="float: right">  
                            <input value="Cancel" id="BtnCancel" class="btn btn-primary" type="button"/>  
                            <input class="btn btn-primary" name="submitButton" id="btnSave" value="Save" type="button"/>  
                        </div>  
                    </div>  
            </div>  
        </div>  
    </div>  
</div>


   



    </form>
</body>
</html>
