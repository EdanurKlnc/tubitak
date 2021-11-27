<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  
    <link rel="stylesheet" href="Css/giris.css"> 
    <link rel="stylesheet" href="Css/style.css"> 

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
       <a href="anasayfa.html"><i class="fas fa-home"></i>Anasayfa</a> 
       <a href="hakkimizda.html"><i class="fas fa-info"></i>Hakkımızda</a> 
       <a href="iletisim.html"><i class="fas fa-phone-volume"></i>İletişim</a> 
       <a href="giris.html"><i class="fas fa-user"></i>Giriş Yap</a> 
       <a href="kayit.html"><i class="fas fa-user-plus"></i>Kayıt Ol</a>
    </nav>
    </section>
    <form action="" method="POST">
    <div class="box">
        <form>
            <span class="text-center">Giriş</span>
        <div class="input-container">
            <input type="mail" required=""/ id="mail" name="mail">
            <label>E-mail</label>		
        </div>
        <div class="input-container">		
            <input type="password" required=""/ id="sifre" name="sifre">
            <label>Sifre</label>
           <br> </br>
            <a href="kayit.html">Kayıt Ol</a>
        </div>
            <button type="button" class="btn">GİRİŞ</button>
    </form>	
    </div>
    
</form>


<?php 
require_once "includes/pdo.php"
if($_POST){
    $kullanici_mail=$_POST['mail'];
    $kullanici_sifre=$_POST['ksifre'];
    $hashing_sifre;
    function encrypt_decrypt($action, $kullanici_sifre) {
        $output = true;
        $sifreleme_kodlari = 'AES-256-CTR'; //sifreleme yontemi
        $sifreleme_key = '25760'; //sifreleme anahtari
        $sifre_baslangici = '**109'; //gerekli sifreleme baslama vektoru
        $key = hash('sha256', $sifreleme_key); //anahtar hast fonksiyonu ile sha256 algoritmasi ile sifreleniyor
        $key_substr = substr(hash('sha256', $sifre_baslangici), 0, 16); //0. ve 16. sifrelenmiş harfi göstermeyecek
        if( $action == 'encrypt' ) {
            $output = urlencode(serialize(base64_encode(gzcompress(openssl_encrypt($kullanici_sifre,$sifreleme_kodlari, $key, 0, $key_substr)))));
          }
          return $output;

          



?>
</body>
</html>