using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using HUS_new.Models;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Security;

namespace Proje_Otostop1
{
    public partial class Giris : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "Register";
            //// Parola sıfırlama işlevi için hesap doğrulama etkinleştirildiğinde bunu etkinleştirin
            ////ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            //var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            //if (!String.IsNullOrEmpty(returnUrl))
            //{
            //    RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            //}
        }

        protected void LogIn(object sender, EventArgs e)
        {
            //if (IsValid)
            //{
            //    // Kullanıcı parolasını doğrulayın
            //    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //    var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

            //    // Bu, hesap kilitlenmesine yönelik oturum açma hatalarını saymaz
            //    // Parola hatalarının kilitlenmeyi tetiklemesini sağlamak için shouldLockout: true olarak değiştirin
            //    var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

            //    switch (result)
            //    {
            //        case SignInStatus.Success:
            //            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            //            break;
            //        case SignInStatus.LockedOut:
            //            Response.Redirect("/Account/Lockout");
            //            break;
            //        case SignInStatus.RequiresVerification:
            //            Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}", 
            //                                            Request.QueryString["ReturnUrl"],
            //                                            RememberMe.Checked),
            //                              true);
            //            break;
            //        case SignInStatus.Failure:
            //        default:
            //            FailureText.Text = "Geçersiz oturum açma denemesi";
            //            ErrorMessage.Visible = true;
            //            break;
            //    }
            //
            //
            //}

            if (UserName.Text != "" && Password.Text != "")
            {
                KULLANICI_KONTROL();
            }
        }

        public void KULLANICI_KONTROL()
        {

            //string sql_select_str = "SELECT Kullanici_Adi FROM TBL_KULLANICILAR WHERE Kullanici_Adi='" + Login1.UserName + "' and Kullanici_Sifresi='" + Login1.Password + "'";
            //string sql_select_str = "SELECT Program_Amaci,Program_Kazanci,Kimler_Katilabilir FROM TBL_PROGRAMLAR WHERE Program_Id=1";

            string sql_select_str = "SELECT Kullanici_Adi FROM TBL_KULLANICILAR WHERE Kullanici_Adi=@username and Kullanici_Sifresi=@password";

            SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["my_ConnectionString"].ToString());
            SqlCommand sqlCommand = new SqlCommand(sql_select_str, sqlConnection);

            sqlCommand.Parameters.AddWithValue("@username", UserName.Text);
            sqlCommand.Parameters.AddWithValue("@password", Password.Text);

            sqlConnection.Open();

            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                FormsAuthentication.RedirectFromLoginPage(UserName.Text, false);
                //Response.Redirect("~/Account/Pas_ayarlar.aspx?Kullanici_Adi=" + reader["Kullanici_Adi"]);
                Response.Redirect("Pas_ayarlar.aspx");
                //Response.Redirect("~/Account/pas_ayarlar.aspx?Kullanici_Adi=" + reader["Kullanici_Adi"]);
                //IdentityHelper.RedirectToReturnUrl(Request.QueryString["~/pas_ayarlar.aspx?Kullanici_Adi=" + reader["Kullanici_Adi"]], Response);
            }



            reader.Close();
            sqlConnection.Close();

        }
    }



}