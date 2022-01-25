<?php
include("includes/pdo.php");


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  
    <link rel="stylesheet" href="Css/giris.css"> 
    <link rel="stylesheet" href="Css/style.css"> 
    <link rel="stylesheet" href="Css/adminOtostop.css">
    <link rel="stylesheet" href="admin.php">


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/c20485228a.js"
    crossorigin="anonymous" > </script> 

    <title>Giriş</title>
</head>
<body>
    <section id="menu">
        <div id="logo">Giriş Yap</div>
        <nav> 
       <a href="anasayfa.php"><i class="fas fa-home"></i>Anasayfa</a> 
       <a href="hakkimizda.php"><i class="fas fa-info"></i>Hakkımızda</a> 
       <a href="iletisim.php"><i class="fas fa-phone-volume"></i>İletişim</a> 
       <a href="giris.php"><i class="fas fa-user"></i>Giriş Yap</a> 
       <a href="kayit.php"><i class="fas fa-user-plus"></i>Kayıt Ol</a>
    </nav>
    </section>
    
    <div class="box">
        <form action="" method="POST">
            <span class="text-center">Giriş</span>
        <div class="input-container">
            <input type="mail" required=""/ id="mail" name="kmail">
            <label>E-mail</label>		
        </div>
        <div class="input-container">		
            <input type="password" required=""/ id="sifre" name="ksifre">
            <label>Sifre</label>
           <br> </br>
            <a href="kayit.php">Kayıt Ol</a>
        </div>
            <button type="submit" class="btn" name="giris"> GİRİŞ </button>
    </form>	
    </div>
    
    
</body>
</html>
<?php
session_start();

require_once "includes/pdo.php";


if(isset($_POST["giris"])){

$kullanici_mail = $_POST['kmail'];
$kullanici_sifre = md5($_POST['ksifre']);

$rol1=1;
$rol2=0;

$kullanici_kontrol =$pdo->query("SELECT * FROM kayit WHERE kayit_mail='$kullanici_mail' and kayit_sifre='$kullanici_sifre' AND rol='$rol2' ")->fetch();
$admin_kontrol =$pdo->query("SELECT * FROM kayit WHERE kayit_mail='$kullanici_mail' and kayit_sifre='$kullanici_sifre' AND rol='$rol1' ")->fetch();


if($kullanici_kontrol)
{
$_SESSION['kullanici_mail'] = $kullanici_mail; 
$_SESSION['kayit_sifre'] = $kullanici_sifre; 

header("Refresh: 0; url= profil.php");



}

else if($admin_kontrol)
{
    $_SESSION['kullanici_mail'] = $kullanici_mail; 
    $_SESSION['kayit_sifre'] = $kullanici_sifre; 

   
 /*   $_SESSION["admin"] = $admin_kontrol['kullanici_mail']; */

    echo "<script type='text/javascript'>alert('Hoşgeldiniz, Sayın, $kullanici_mail Admin Sayfasına Yönlendiriliyorsunuz')</script>";

    header("Refresh: 0; url= admin.php");


    
}
else{
        echo "<script type='text/javascript'>alert('Girmiş Olduğunuz Bilgiler Hatalıdır! Tekrar Deneyiniz')</script>";
        header("Refresh: 0; url= giris.php");

}

} 


?>