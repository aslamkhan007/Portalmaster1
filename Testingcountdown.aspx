<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="Testingcountdown.aspx.cs" Inherits="Testingcountdown" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <!DOCTYPE html>

    
   
    <style>
        /* Style to set the body alignment into center */
        body {
            text-align:center;
        }
        
        /* Style to set the div style to display
            countdown timer */
        #countDownTimer{
            font-family: Times new roman;
            color: white;
            display: inline-block;
            font-size: 72px;
            font-weight: bold;
            text-align: center;
        }
 
        #countDownTimer > div{
            padding: 10px;
            border-radius: 3px;
            background: #e1e1e1;
            display: inline-block;
        }
 
        #countDownTimer div > span {
            background: #04456f;
            display: inline-block;
            padding: 20px;
            border-radius: 5px;
        }
 
        .timeText{
            font-weight:bold;
            padding-top: 5px;
            font-size: 35px;
            color:black;
        }
    </style>

  
 
    <div id="countDownTimer">
        <div>
            <span id="days"></span>
            <div class="timeText">Days</div>
        </div>
        
        <div>
            <span id="hours"></span>
            <div class="timeText">Hours</div>
        </div>
        
        <div>
            <span id="minutes"></span>
            <div class="timeText">Minutes</div>
        </div>
        
        <div>
            <span id="seconds"></span>
            <div class="timeText">Seconds</div>
        </div>
    </div>
    
    <script>
        
        // Set the date and time for countdown timer
        // in string format
        var countDownDate = new Date("Jan 1, 2021 12:30:25").getTime();
 
        // Increase the count down timer
        // with every 1 second
        var x = setInterval(function() {
 
            // Get the current date and time
            var currentTime = new Date().getTime();
    
            // Difference between current and given date
            // in milliseconds
            var timeDifference = countDownDate - currentTime;
    
            // The difference of time converted into days,
            // hours, minutes and seconds
            var days = Math.floor(timeDifference 
                            / (1000 * 60 * 60 * 24));
 
            var hours = Math.floor((timeDifference % 
                   (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
 
            var minutes = Math.floor((timeDifference %
                       (1000 * 60 * 60)) / (1000 * 60));
 
            var seconds = Math.floor((timeDifference %
                            (1000 * 60)) / 1000);
    
            // Display the output
            document.getElementById("days").innerHTML = days;
            document.getElementById("hours").innerHTML = hours;
            document.getElementById("minutes").innerHTML = minutes;
            document.getElementById("seconds").innerHTML = seconds;
    
            // If the count down is over, write some text 
            if (timeDifference < 0) {
                clearInterval(x);
                document.getElementById("countDownTimer").innerHTML
                                = "Countdown Timer Ended!";
            }
        }, 1000);
    </script>    
</body>
 



</asp:Content>

