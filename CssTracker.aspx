<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="CssTracker.aspx.cs" Inherits="CssTracker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style >
        
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  -webkit-animation-name: fadeIn; /* Fade in the background */
  -webkit-animation-duration: 0.4s;
  animation-name: fadeIn;
  animation-duration: 0.4s
}

/* Modal Content */
.modal-content {
  position: fixed;
  bottom: 0;
  background-color: #fefefe;
  width: 100%;
  -webkit-animation-name: slideIn;
  -webkit-animation-duration: 0.4s;
  animation-name: slideIn;
  animation-duration: 0.4s
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

/* Add Animation */
@-webkit-keyframes slideIn {
  from {bottom: -300px; opacity: 0} 
  to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
  from {bottom: -300px; opacity: 0}
  to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
  from {opacity: 0} 
  to {opacity: 1}
}

@keyframes fadeIn {
  from {opacity: 0} 
  to {opacity: 1}
}



        .container {
            width: 600px;
            margin: 100px auto;
        }

        .progressbar {
            counter-reset: step;
        }

            .progressbar li {
                list-style-type: none;
                width: 25%;
                float: left;
                font-size: 12px;
                position: relative;
                text-align: center;
                text-transform: uppercase;
                color: #7d7d7d;
            }

                .progressbar li:before {
                    width: 30px;
                    height: 30px;
                    content: counter(step);
                    counter-increment: step;
                    line-height: 30px;
                    border: 2px solid #7d7d7d;
                    display: block;
                    text-align: center;
                    margin: 0 auto 10px auto;
                    border-radius: 50%;
                    background-color: white;
                }

                .progressbar li:after {
                    width: 100%;
                    height: 2px;
                    content: '';
                    position: absolute;
                    background-color: #7d7d7d;
                    top: 15px;
                    left: -50%;
                    z-index: -1;
                }

    .progressbar li:first-child:after {
        content: none;
    }

    .progressbar li.active {
        color: green;
    }

        .progressbar li.active:before {
            border-color: #55b776;
        }

        .progressbar li.active + li:after {
            background-color: #55b776;
        }

    </style>

    <script type ="text/javascript">
        $(document).ready(function () {          
            $('#myBtn').click(function (event) {                
                event.preventDefault();
                $('#loadingmessage').show();
                $('ul.progressbar').empty();
               
                var inputvalue = $(this).val();
                //$.ajax({
                //    type: "POST",
                //    contentType: "application/json; charset=utf-8",
                //    url: "CssTracker.aspx/AddRoleForStaff",                    
                //    //dataType: "json",
                //    data: { "a": inputvalue },
                //    success: function (response) {
                //        alert('hi');
                //        $("#returndata").text(response.d);
                //    },
                //    error: function (response) {
                //        alert(response.d);
                //    }
                //});

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "CssTracker.aspx/AddRoleForStaff",
                    data: "{'a' : '" + inputvalue + "'  }",
                    dataType: "json",
                    success: function (data) {
                        debugger;                      
                        $("#returndata").text(data.d);
                        $('#myModal').show();

                        if (data.d == "hi this is the string")
                        {
                            $('<li />', { html: data.d }).appendTo('ul.progressbar').addClass('active');
                        }
                        $('#loadingmessage').hide();
                    },
                    error: function (result) {
                        alert("Error");
                    }
                });


                //$.ajax({
                //    type: "POST",
                //    contentType: "application/json; charset=utf-8",
                //    url: "CssTracker.aspx/AddRoleForStaff",
                //    data: "{}",
                //    dataType: "json",
                //    success: function (data) {
                //        for (var i = 0; i < data.d.length; i++) {
                //            $("#returndata").append("<tr><td>" + data.d[i].UserId + "</td><td>" + data.d[i].UserName + "</td><td>" + data.d[i].Location + "</td></tr>");
                //        }
                //    },
                //    error: function (result) {
                //        alert("Error");
                //    }
                //});

                //$('#myModal').show();



            });



            $('.close').click(function () {
                $('#myModal').hide();
            });


            $('#myBtn1').click(function () {
                debugger;
                $('#loadingmessage1').show();
            });
        });



    </script>



<!-- Trigger/Open The Modal -->
<button id="myBtn" value ="10">Open Modal</button>

    <button id="myBtn1" value ="10">Show circualar</button>

                                 <div id='loadingmessage1' style='display:none'>
       <img src='Image/load.gif'/>
</div>


<div id="returndata" >
    </div>


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Modal Header</h2>
        
    </div>
    <div class="modal-body">
   
 <div class="container">
                             <div id='loadingmessage' style='display:none'>
      <img src='Image/load.gif'/>
</div>
                    <ul class="progressbar">



                        <%--<li class="active">login</li>
                        <li>choose interest</li>
                        <li>add friends</li>
                        <li>View map</li>--%>
                    </ul>
                </div>
    </div>
    <div class="modal-footer">
      <h3>Modal Footer</h3>
    </div>
  </div>

</div>


</asp:Content>

