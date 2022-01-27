<%@ Page Title="İletişim" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="Proje_Otostop1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h4><%: Title %></h4>
    <p>Bize Ulaşın</p>

    <address>
        Bartın Üniversitesi <br />
        Mühendislik Mimarlık ve Tasarım Fakültesi<br />
        Bilgisayar Mühendisliği <br />
        <abbr title="phone"> Telefon :</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Destek:</strong><a href="mailto:info@bartin.edu.tr">info@bartin.edu.tr</a><br />
    </address>
</asp:Content>
