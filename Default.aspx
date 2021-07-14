<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="CellWidth80">
        <tr>
            <td class="CellWidth60">
                <div class="container">
    			
	        	</div>
            </td>
            <td class="CellWidth40">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"  
            BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"  
            ForeColor="#663399" ShowGridLines="True" OnDayRender="Calendar1_DayRender"  
           OnSelectionChanged="Calendar1_SelectionChanged"  
            OnVisibleMonthChanged="Calendar1_VisibleMonthChanged" Width="70%">  
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />  
            <SelectorStyle BackColor="#FFCC66" />  
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />  
            <OtherMonthDayStyle ForeColor="#CC9966" />  
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />  
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />  
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />  
        </asp:Calendar>
                <asp:Label ID="LabelAction" runat="server"></asp:Label><br />
                 <%--<asp:DataList ID="dlstEmp" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" Width="90%" ShowFooter="false">
                        <ItemTemplate>
                            <table style="width: 100%;" cellpadding="1" cellspacing="1">
                                <tr>
                                    
                                    <td >
                                        <asp:Label ID="Label2" Text='<%#Eval("DayLabel") %>' runat="server"></asp:Label>
                                        <asp:Label ID="Label1" Text='<%#Eval("Leave") %>' runat="server"></asp:Label>
                                        <small><asp:Label ID="Label3" Text='<%#Eval("Holiday") %>' runat="server"></asp:Label></small>
                                    </td>
                                 </tr>   
                        </ItemTemplate>

                     

                    </asp:DataList>--%>
            </td>
        </tr>
    </table>
    <main class="content">
		
		
       
	</main>
     
</asp:Content>