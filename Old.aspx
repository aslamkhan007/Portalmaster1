<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="Old.aspx.cs" Inherits="Old" %>
<%--<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="Old.aspx.cs" Inherits="Old" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="js/jquery.min.2.2.0.js"></script>
    <script type="text/javascript">
       
        $(document).ready(function () {            
            debugger;
            if (sessionStorage.getItem('firstVisit') === "1") {             
                
                $(".message").hide();
            }
            else {
                debugger;
                $(".message").show();
                sessionStorage.setItem('firstVisit', '1');
            }
            

            //Close element.
            $(".message").click(function () {
                $(this).hide();
            });

            $(".message").css({
                'height': $(document).height() + 'px'
            });
            $(".message_pad").css({
                'left': ($(document).width() / 2 - 500 / 2) + 'px'
            });
        });

    </script>
    <h1>-----o----- </h1>

    <div class="message" style ="display:none;" >
    <div class="message_pad">
        <div id="message"></div>
        <div class="message_leave">
            hi message 
        </div>
    </div>
</div>

</asp:Content>

