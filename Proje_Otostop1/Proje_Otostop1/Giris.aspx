<%@ Page Title="Giriş Yap" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Giris.aspx.vb" Inherits="Proje_Otostop1.Giris" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="girisForm">
                <div class="form-horizontal">
                    <h4>Sisteme giriş için kullanıcı adı ve şifrenizi kullanın</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger"><a href="Global.asax">Global.asax</a>
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Kullanıcı Adı</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-danger" ErrorMessage="Kullanıcı adı gereklidir." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Şifre</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Şifre gereklidir." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Beni hatırla</asp:Label>
                            </div>
                        </div>
                    </div>

                   <div class="form-group">
                       <div class="col-md-offset-2 col-md-10">
                                     <asp:Button ID="btnSignin" runat="server" OnClick="LogIn" Text="Giriş" CssClass="btn btn-default" Height="53px" Width="136px" />

                    </div>
                    </div>
                
            </section>
        </div>  
    </div>
</asp:Content>
