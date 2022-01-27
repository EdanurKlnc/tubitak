<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pas_ayarlar.aspx.cs" Inherits="HUS_new.Account.Pas_ayarlar" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        
                    <ContentTemplate>

    <asp:SqlDataSource ID="SqlDataSource_patients" runat="server" ConnectionString="<%$ ConnectionStrings:my_ConnectionString %>" DeleteCommand="DELETE FROM [Patients] WHERE [sno] = @sno" InsertCommand="INSERT INTO [Patients] ([phone_number], [name_surname], [grp_id]) VALUES (@phone_number, @name_surname, @grp_id)" SelectCommand="SELECT sno, phone_number, name_surname, grp_id,

CASE
    WHEN (Select count(phone_number) from Phones 
		  Where phone_number=Patients.phone_number and 
		  CAST(Conn_Date as DATE) = CAST(GETDATE() as DATE) and 
		  convert(char(5), dateadd(minute, 5, Conn_Date), 108) &gt;= 
		  convert(char(5), dateadd(minute, 0, getdate()), 108))&gt;0 THEN 'Yes'
	else 'No'
	END as ponline,(Select FORMAT (max(Conn_Date), 'MM.dd.yyyy') + '   ' +FORMAT (max(Conn_Date), 't', 'tr-TR') from Phones Where phone_number=Patients.phone_number) as Last_conn_date
FROM Patients 
WHERE (name_surname LIKE '%' + @name + '%')" UpdateCommand="UPDATE [Patients]  SET [name_surname] = @name_surname, [grp_id] = @grp_id WHERE [sno] = @sno">
        <DeleteParameters>
            <asp:Parameter Name="sno" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="phone_number" Type="String" />
            <asp:Parameter Name="name_surname" Type="String" />
            <asp:Parameter Name="grp_id" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="name_TextBox" Name="name" PropertyName="Text" DefaultValue=" " />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="sno" Type="Int32" />
            <asp:Parameter Name="name_surname" Type="String" />
            <asp:Parameter Name="grp_id" Type="String" />
            <asp:Parameter Name="phone_number" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_patients_form" runat="server" ConnectionString="<%$ ConnectionStrings:my_ConnectionString %>" DeleteCommand="DELETE FROM [Patients] WHERE [sno] = @sno" InsertCommand="INSERT INTO [Patients] ([phone_number], [name_surname], [grp_id]) VALUES (@phone_number, @name_surname, @grp_id)" SelectCommand="SELECT * FROM [Patients] WHERE ([sno] = @sno)" UpdateCommand="UPDATE [Patients] SET [name_surname] = @name_surname, [grp_id] = @grp_id WHERE [sno] = @sno">
        <DeleteParameters>
            <asp:Parameter Name="sno" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="phone_number" Type="String" />
            <asp:Parameter Name="name_surname" Type="String" />
            <asp:Parameter Name="grp_id" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="sno" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="sno" Type="Int32" />
            <asp:Parameter Name="name_surname" Type="String" />
            <asp:Parameter Name="grp_id" Type="String" />
            <asp:Parameter Name="phone_number" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_schedule" runat="server" ConnectionString="<%$ ConnectionStrings:my_ConnectionString %>" SelectCommand="SELECT S.sno,P.phone_number, P.name_surname,S.first_date,S.last_date,S.alert_time,S.alert_text,every_x_days 
FROM [Schedule] as S LEFT OUTER JOIN [Patients] as P ON S.patient_sno=P.sno
WHERE S.patient_sno=@patient_sno
 ORDER BY S.patient_sno">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="patient_sno" PropertyName="SelectedValue" />
        </SelectParameters>
                        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_schedule_form" runat="server" ConnectionString="<%$ ConnectionStrings:my_ConnectionString %>" DeleteCommand="DELETE FROM [Schedule] WHERE [sno] = @sno" SelectCommand="SELECT sno,patient_sno,first_date,last_date,alert_time,alert_text,(Select phone_number + ' ' + name_surname From Patients Where Patients.sno=Schedule.patient_sno) as phone_name,every_x_days FROM [Schedule] WHERE ([sno] = @sno)">
                    <DeleteParameters>
                        <asp:Parameter Name="sno" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView2" Name="sno" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_alert_patient_combo" runat="server" ConnectionString="<%$ ConnectionStrings:my_ConnectionString %>" SelectCommand="SELECT S.sno, (RTRIM(P.phone_number) + ' (' + RTRIM(P.name_surname) + ') ' + CONVERT(varchar, S.first_date,1) + ' - ' + CONVERT(varchar, S.last_date,1) + ' (' + S.alert_time + ') [' + RTRIM(S.alert_text) +']' ) as text_value FROM Schedule as S LEFT OUTER JOIN Patients as P on S.patient_sno=P.sno"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_alert_check" runat="server" ConnectionString="<%$ ConnectionStrings:my_ConnectionString %>" SelectCommand="SELECT SA.sno,S.patient_sno,P.phone_number,P.name_surname,SA.mobile_alert_date,SA.mobile_alert_time,
SA.approval_time,
CASE
    WHEN SA.approval_type=0 THEN 'Generated by system (0)'
    WHEN SA.approval_type=1 THEN 'Read by patient (1)'
    WHEN SA.approval_type=2 THEN 'Accepted (2)'
    WHEN SA.approval_type=3 THEN 'Unaccepted (3)'
    ELSE 'error'
END as approval_type,
CASE
    WHEN SA.mobile_alert_time&gt;GETDATE() and SA.approval_type=0 THEN ':('
    WHEN SA.mobile_alert_time&lt;GETDATE() and SA.approval_type=0 THEN ':|'
    WHEN SA.approval_type=1 or SA.approval_type=2 or SA.approval_type=3 THEN ':)'
END as decision_alert
 
FROM Schedule_Alerts as SA LEFT OUTER JOIN Schedule as S on SA.schedule_sno=S.sno LEFT OUTER JOIN Patients as P on S.patient_sno=P.sno
WHERE S.first_date&gt;=@my_first_date and S.last_date&lt;=@my_last_date and SA.schedule_sno=@schedule_sno
" DeleteCommand="DELETE FROM Schedule_Alerts WHERE sno=@sno">
                <DeleteParameters>
                    <asp:Parameter Name="sno" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="my_first_date" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="TextBox2" Name="my_last_date" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="GridView2" Name="schedule_sno" PropertyName="SelectedValue" />
                </SelectParameters>
                </asp:SqlDataSource>
    <table class="nav-justified">
        <tr>
            <td style="width: 578px">
                
                <h1>Hastalar</h1></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td>
                <table>
                    <tr>
                        <td>Ad :</td>
                        <td style="width: 20px"></td>
                        <td>
                            <asp:TextBox ID="name_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td style="width: 20px"></td>
                        <td>
                            <asp:Button ID="list_Button" runat="server" OnClick="list_Button_Click" Text="Listele" CssClass="form-control" Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </td>

                        <td>
                            &nbsp;</td>

            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 578px">
                <div style="width: 400px">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" DataSourceID="SqlDataSource_patients" ForeColor="#333333" GridLines="None" Width="133%" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound" BorderStyle="Solid" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" >
                        <ItemStyle Width="100px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="phone_number" HeaderText="Telefon" ReadOnly="True" SortExpression="phone_number" >
                        <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="name_surname" HeaderText="Ad Soyad" SortExpression="name_surname" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="grp_id" HeaderText="Grup No" SortExpression="grp_id" >
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Last_conn_date" HeaderText="Son Bağlanma" SortExpression="Last_conn_date">
                        <ItemStyle HorizontalAlign="Center" Width="120px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Online">
                        <ItemTemplate> 
                          <asp:Image ID="MyImage" Runat="Server" 
                                     ImageUrl='<%# GetImageToDisplay((String)Eval("Ponline")) %>' />
                        </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                    </div>
            </td>
            <td>
                <asp:FormView ID="FormView1" runat="server" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataKeyNames="sno" DataSourceID="SqlDataSource_patients_form" ForeColor="#333333" Height="214px" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated" Width="375px">
                    <EditItemTemplate>
                        <table class="nav-justified">
                            <tr>
                                <td>Telefon :</td>
                                <td>
                                    <asp:Label ID="phone_numberLabel1" runat="server" Text='<%# Eval("phone_number") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Ad :</td>
                                <td>
                                    <asp:TextBox ID="name_surnameTextBox" runat="server" Text='<%# Bind("name_surname") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Grup No:</td>
                                <td>
                                    <asp:TextBox ID="grp_idTextBox" runat="server" Text='<%# Bind("grp_id") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="snoLabel1" runat="server" Text='<%# Eval("sno") %>' Visible="False" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Değiştir" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Vazgeç" />
                    </EditItemTemplate>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <InsertItemTemplate>
                        <table class="nav-justified">
                            <tr>
                                <td>Telefon :</td>
                                <td>
                                    <asp:TextBox ID="phone_numberTextBox" runat="server" Text='<%# Bind("phone_number") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Ad :</td>
                                <td>
                                    <asp:TextBox ID="name_surnameTextBox" runat="server" Text='<%# Bind("name_surname") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Grup No:</td>
                                <td>
                                    <asp:TextBox ID="grp_idTextBox" runat="server" Text='<%# Bind("grp_id") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        &nbsp;<br />&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Kaydet" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Vazgeç" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table class="nav-justified">
                            <tr>
                                <td>Telefon :</td>
                                <td>
                                    <asp:Label ID="phone_numberLabel" runat="server" Text='<%# Eval("phone_number") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Ad :</td>
                                <td>
                                    <asp:Label ID="name_surnameLabel" runat="server" Text='<%# Bind("name_surname") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Grup No:</td>
                                <td>
                                    <asp:Label ID="grp_idLabel" runat="server" Text='<%# Bind("grp_id") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="snoLabel" runat="server" Text='<%# Eval("sno") %>' Visible="False" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Değiştir" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Yeni" Visible="False" />
                    </ItemTemplate>
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                </asp:FormView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><h1>Hasta Programları</h1></td>
            <td><span class="VIiyi" jsaction="mouseup:BR6jm" jsname="jqKxS" lang="tr"><span class="JLqJ4b ChMk0b" data-language-for-alternatives="tr" data-language-to-translate-into="en" data-phrase-index="0" jsaction="agoMJf:PFBcW;usxOmf:aWLT7;jhKsnd:P7O7bd,F8DmGf;Q4AGo:Gm7gYd,qAKMYb;uFUCPb:pvnm0e,pfE8Hb,PFBcW;f56efd:dJXsye;EnoYf:KNzws,ZJsZZ,JgVSJc;zdMJQc:cCQNKb,ZJsZZ,zchEXc;Ytrrj:JJDvdc;tNR8yc:GeFvjb;oFN6Ye:hij5Wb" jscontroller="Zl5N8" jsdata="uqLsIf;_;$69" jsmodel="SsMkhd" jsname="txFAF"><span jsaction="click:qtZ4nf,GFf3ac,tMZCfe; contextmenu:Nqw7Te,QP7LD; mouseout:Nqw7Te; mouseover:qtZ4nf,c2aHje" jsname="W297wb">Kayıtların güncellenmesi, önceki tüm kayıtları silecektir.</span></span></span> </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <div style="width: 800px">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource_schedule" ForeColor="#333333" GridLines="None" DataKeyNames="sno" Width="723px" OnDataBound="GridView2_DataBound" BorderStyle="Solid" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" >
                        <ItemStyle Width="100px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="phone_number" HeaderText="Telefon" SortExpression="phone_number" >
                        <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="name_surname" HeaderText="Ad Soyad" SortExpression="name_surname" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="first_date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Başlangıç" SortExpression="first_date" >
                        <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="last_date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Bitiş" SortExpression="last_date" >
                        <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="alert_time" HeaderText="Saat" SortExpression="alert_time" >
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="alert_text" HeaderText="Uyarı Metni" SortExpression="alert_text" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="every_x_days" HeaderText="Her x Günde" SortExpression="every_x_days" >

                        <ItemStyle Width="100px" />
                        </asp:BoundField>

                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                    </div>
            </td>
            <td>
                <asp:Label ID="hata_label" runat="server"></asp:Label>
               
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="sno" DataSourceID="SqlDataSource_schedule_form" Height="207px" Width="501px" CellPadding="4" ForeColor="#333333" OnItemDeleted="FormView2_ItemDeleted" OnItemInserted="FormView2_ItemInserted" OnItemUpdated="FormView2_ItemUpdated" style="margin-right: 5px" BorderStyle="Solid" BorderWidth="1px" OnDataBound="FormView2_DataBound">
                    <EditItemTemplate>
                        <table class="nav-justified">
                            <tr>
                                <td>Başlangıç:</td>
                                <td>
                                    <asp:TextBox ID="first_dateTextBox_update" runat="server" Text='<%# Bind("first_date", "{0:yyyy-MM-dd}") %>' TextMode="Date" Width="150px" />
                                </td>
                            </tr>
                            <tr>
                                <td>Bitiş :</td>
                                <td>
                                    <asp:TextBox ID="last_dateTextBox_update" runat="server" Text='<%# Bind("last_date", "{0:yyyy-MM-dd}") %>' TextMode="Date" Width="150px" />
                                </td>
                            </tr>
                            <tr>
                                <td>Saat :</td>
                                <td>
                                    <asp:TextBox ID="alert_timeTextBox_update" runat="server" Text='<%# Bind("alert_time") %>' TextMode="Time" />
                                </td>
                            </tr>
                            <tr>
                                <td>Uyarı Metni :</td>
                                <td>
                                    <asp:TextBox ID="alert_textTextBox_update" runat="server" Text='<%# Bind("alert_text") %>' Height="50px" TextMode="MultiLine" Width="250px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Her x Günde :</td>
                                <td>
                                    <asp:TextBox ID="xdays_textTextBox_update" runat="server" Text='<%# Bind("every_x_days") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="snoLabel1" runat="server" Text='<%# Eval("sno") %>' Visible="False" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" Text="Değiştir" OnClick="UpdateButton_Click" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Vazgeç" />
                    </EditItemTemplate>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <InsertItemTemplate>
                        <table class="nav-justified">
                            <tr>
                                <td>Başlangıç:</td>
                                <td>
                                    <asp:TextBox ID="first_dateTextBox" runat="server" Text='<%# Bind("first_date","{0:yyyy-MM-dd}") %>' TextMode="Date" Width="150px" />
                                </td>
                            </tr>
                            <tr>
                                <td>Bitiş :</td>
                                <td>
                                    <asp:TextBox ID="last_dateTextBox" runat="server" Text='<%# Bind("last_date","{0:yyyy-MM-dd}") %>' TextMode="Date" Width="150px" />
                                </td>
                            </tr>
                            <tr>
                                <td>Saat :</td>
                                <td>
                                    <asp:TextBox ID="alert_timeTextBox" runat="server" Text='<%# Bind("alert_time") %>' TextMode="Time" />
                                </td>
                            </tr>
                            <tr>
                                <td>Uyarı Metni :</td>
                                <td>
                                    <asp:TextBox ID="alert_textTextBox" runat="server" Text='<%# Bind("alert_text") %>' Height="50px" TextMode="MultiLine" Width="250px" />
                                </td>
                            </tr>
                            <tr>
                                <td>Her x Günde:</td>
                                <td>
                                    <asp:TextBox ID="alert_textTextBox0" runat="server" Text='<%# Bind("every_x_days") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" Text="Kaydet" OnClick="InsertButton_Click" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Vazgeç" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table class="nav-justified">
                            <tr>
                                <td>Ad :</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("phone_name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Başlangıç:</td>
                                <td>
                                    <asp:Label ID="first_dateLabel" runat="server" Text='<%# Eval("first_date", "{0:d}") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Bitiş :</td>
                                <td>
                                    <asp:Label ID="last_dateLabel" runat="server" Text='<%# Eval("last_date", "{0:d}") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 20px">Saat :</td>
                                <td style="height: 20px">
                                    <asp:Label ID="alert_timeLabel" runat="server" Text='<%# Bind("alert_time") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Uyarı Metni :</td>
                                <td>
                                    <asp:Label ID="alert_textLabel" runat="server" Text='<%# Bind("alert_text") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Her x Günde :</td>
                                <td>
                                    <asp:Label ID="alert_textLabel0" runat="server" Text='<%# Bind("every_x_days") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="snoLabel" runat="server" Text='<%# Eval("sno") %>' Visible="False" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Değiştir" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" Text="Sil" OnClick="DeleteButton_Click" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Yeni Kayıt" />
                    </ItemTemplate>
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                </asp:FormView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>

         <tr>
            <td><h1>Programlara İlişkin Uyarılar </h1></td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="nav-justified">
                    <tr>
                        <td>Başlangıç :</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Date" Width="150px">2019-11-30</asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="height: 22px">Bitiş :</td>
                        <td style="height: 22px">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date" Width="150px">2021-01-01</asp:TextBox>
                        </td>
                        <td style="height: 22px">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Listele" CssClass="form-control" Width="120px"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 22px"></td>
                        <td style="height: 22px">
                            
                        <td style="height: 22px">
                            <asp:Button ID="Button2" runat="server" CssClass="form-control" OnClick="Button2_Click" Text="Raporla" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 22px">&nbsp;</td>
                        <td style="height: 22px">
                            &nbsp;</td>
                        <td style="height: 22px">&nbsp;</td>
                    </tr>
                </table>
            </td>
            
            <td>
                <asp:FormView ID="FormView4" runat="server" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataKeyNames="sno" DataSourceID="SqlDataSource_alert_check_form" ForeColor="#333333" OnItemUpdated="FormView4_ItemUpdated" Width="434px">
                    <EditItemTemplate>
                        <table class="nav-justified">
                            <tr>
                                <td></td>
                                <td>Tarih:<asp:Label ID="mobile_alert_dateLabel1" runat="server" Text='<%# Eval("mobile_alert_date") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Saat:</td>
                                <td>
                                    <asp:TextBox ID="mobile_alert_timeTextBox" runat="server" Text='<%# Bind("mobile_alert_time") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Onay Zamanı:</td>
                                <td>
                                    <asp:TextBox ID="approval_timeTextBox" runat="server" Text='<%# Bind("approval_time") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Onay Şekli:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_edit_schedules" runat="server" SelectedValue='<%# Bind("approval_type") %>' Width="200px">
                                        <asp:ListItem Value="0">Oluşturuludu (0)</asp:ListItem>
                                        <asp:ListItem Value="1">Okundu (1)</asp:ListItem>
                                        <asp:ListItem Value="2">Onaylandı (2)</asp:ListItem>
                                        <asp:ListItem Value="3">Onaylanmadı (3)</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Label ID="snoLabel1" runat="server" Text='<%# Eval("sno") %>' Visible="False" />
                                </td>
                            </tr>
                        </table>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Değiştir" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Vazgeç" />
                    </EditItemTemplate>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <InsertItemTemplate>
                        schedule_sno:
                        <asp:TextBox ID="schedule_snoTextBox" runat="server" Text='<%# Bind("schedule_sno") %>' />
                        <br />
                        mobile_alert_date:
                        <asp:TextBox ID="mobile_alert_dateTextBox" runat="server" Text='<%# Bind("mobile_alert_date") %>' />
                        <br />
                        mobile_alert_time:
                        <asp:TextBox ID="mobile_alert_timeTextBox" runat="server" Text='<%# Bind("mobile_alert_time") %>' />
                        <br />
                        approval_time:
                        <asp:TextBox ID="approval_timeTextBox" runat="server" Text='<%# Bind("approval_time") %>' />
                        <br />
                        approval_type:
                        <asp:TextBox ID="approval_typeTextBox" runat="server" Text='<%# Bind("approval_type") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Kaydet" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Vazgeç" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table class="nav-justified">
                            <tr>
                                <td>Tarih:</td>
                                <td>
                                    <asp:Label ID="mobile_alert_dateLabel" runat="server" Text='<%# Eval("mobile_alert_date") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Saat:</td>
                                <td>
                                    <asp:Label ID="mobile_alert_timeLabel" runat="server" Text='<%# Bind("mobile_alert_time") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 22px">Onay Zamanı:</td>
                                <td style="height: 22px">
                                    <asp:Label ID="approval_timeLabel" runat="server" Text='<%# Bind("approval_time") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Onay Şekli:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" Enabled="False" SelectedValue='<%# Bind("approval_type") %>' Width="200px">
                                        <asp:ListItem Value="0">Oluşturuldu (0)</asp:ListItem>
                                        <asp:ListItem Value="1">Okundu (1)</asp:ListItem>
                                        <asp:ListItem Value="2">Onaylandı (2)</asp:ListItem>
                                        <asp:ListItem Value="3">Onaylanmadı (3)</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Label ID="snoLabel" runat="server" Text='<%# Eval("sno") %>' Visible="False" />
                                </td>
                            </tr>
                        </table>
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Değiştir" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Yeni" Visible="False" />
                    </ItemTemplate>
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                </asp:FormView>
            </td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <caption>
            </caption>
        <tr>
            <td>
                <div style="width: 800px">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource_alert_check" ForeColor="#333333" GridLines="None" Width="817px" DataKeyNames="sno">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" >
                        <ItemStyle Width="50px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="phone_number" HeaderText="Telefon" SortExpression="phone_number" >
                        <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="name_surname" HeaderText="Ad Soyad" SortExpression="name_surname" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mobile_alert_date" HeaderText="Tarih" DataFormatString="{0:dd/MM/yyyy}" SortExpression="mobile_alert_date" >
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mobile_alert_time" HeaderText="Saat" SortExpression="mobile_alert_time" >
                        <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="approval_time" HeaderText="Onay Zamanı" SortExpression="approval_time" >
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="approval_type" HeaderText="Onay Şekli" SortExpression="approval_type" >
                        <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="decision_alert" HeaderText="Durum" SortExpression="decision_alert" >
                        <ItemStyle Width="50px" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                    </div>
            </td>
            
            <td >
                &nbsp;</td>
                  
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td> 
                <asp:SqlDataSource ID="SqlDataSource_alert_check_form" runat="server" ConnectionString="<%$ ConnectionStrings:my_ConnectionString %>" DeleteCommand="DELETE FROM [Schedule_Alerts] WHERE [schedule_sno] = @schedule_sno AND [mobile_alert_date] = @mobile_alert_date" InsertCommand="INSERT INTO [Schedule_Alerts] ([schedule_sno], [mobile_alert_date], [mobile_alert_time], [approval_time], [approval_type]) VALUES (@schedule_sno, @mobile_alert_date, @mobile_alert_time, @approval_time, @approval_type)" SelectCommand="SELECT * FROM [Schedule_Alerts] WHERE ([sno] = @sno)" UpdateCommand="UPDATE [Schedule_Alerts] SET [approval_time] = @approval_time, [approval_type] = @approval_type WHERE [sno] = @sno">
                    <DeleteParameters>
                        <asp:Parameter Name="schedule_sno" Type="Int32" />
                        <asp:Parameter Name="mobile_alert_date" Type="DateTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="schedule_sno" Type="Int32" />
                        <asp:Parameter Name="mobile_alert_date" Type="DateTime" />
                        <asp:Parameter Name="mobile_alert_time" Type="String" />
                        <asp:Parameter Name="approval_time" Type="DateTime" />
                        <asp:Parameter Name="approval_type" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView3" Name="sno" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="sno" Type="Int32" />
                        <asp:Parameter Name="mobile_alert_time" Type="String" />
                        <asp:Parameter Name="approval_time" Type="DateTime" />
                        <asp:Parameter Name="approval_type" Type="Int32" />
                        <asp:Parameter Name="schedule_sno" Type="Int32" />
                        <asp:Parameter Name="mobile_alert_date" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            
        </tr>
        <tr>
            <td> 
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>

    </table>
<table>
    <tr>
        <td>
<div><rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"></rsweb:ReportViewer> </div>
        </td>
            </tr>
 </table>
    </ContentTemplate>
        
                </asp:UpdatePanel>

</asp:Content>
