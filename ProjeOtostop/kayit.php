<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="Css/kayit.css"> 
    <link rel="stylesheet" href="Css/style.css"> 

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/c20485228a.js"
    crossorigin="anonymous" > </script> 

    <title>Kayıt Ol</title>
</head>
<body>
    <section id="menu">
        <div id="logo">Kayıt Ol</div>
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
            <span class="text-center">Kayıt</span>
        <div class="input-container" id="ad">
            <input type="text" required="name" autocomplete="off" pattern="[a-zA-Z<?=$trChars?>\s.]*" required autofocus oninvalid="alert('Kullanıcı Adını Girmeniz Zorunludur!')" name="kadi"/>
            <label>Ad</label>		
        </div>
        <div class="input-container" id="soyad"> 
            <input type="text" required="sname" autocomplete="off" required autofocus oninvalid="alert('Soyadınızı Girmeniz Zorunludur!')" name="ksoyadi"/>
            <label>Soyad</label>		
        </div>
        <div class="input-container-mail" id="mail">
            <input type="text" required="mail" autocomplete="off" required autofocus oninvalid="alert('E-mailinizi Girmeniz Zorunludur!')" name="email"/>
            <label>E-mail</label>		
        </div>
        <div class="input-container" id="sifre">
            <input type="password" required="password" autocomplete="off" required autofocus oninvalid="alert('Şifrenizi Girmeniz Zorunludur!')" name="ksifre"/>
            <label>Şifre</label>		
        </div>
        <div class="input-container" id="tel">		
            <input type="tel" pattern="\d{11}" required="tel" title="Başında '0' olarak tuşlayınız"/>
            <label>Telefon Numarası</label>

        </div>
            <button type="button" class="btn">KAYIT</button>
    </form>	
    </div>
    </form>

    <?php 
require_once "includes/pdo.php"
$mail_kontrol;
$kullanici_mail;
$kullanici_info;
$hashing_sifre;

if($_POST){
    
    $kullanici_adi = htmlentities(trim($_POST['kadi']));
    $kullanici_sifre=htmlentities(trim($_POST['ksifre']));
    $kullanici_sifre_tekrar=htmlentities(trim($_POST['ksifretkrar']));
    $kullanici_email=htmlentities(trim($_POST['mail']));
    
    

?>>
</body>
</html>





$hashing_sifre = encrypt_decrypt('encrypt',$kullanici_sifre);//ŞİFREmizi hashing sifre değişkenine aktarır
          //$kullanici_info=$pdo->query("SELECT * FROM kayit WHERE kullanici_adi='$kullanici_adi' ")->fetch();
          $mail_kontrol=$pdo->query("SELECT * FROM kayit WHERE email='$kullanici_email' ")->fetch();
          $sifre_kontrol=$pdo->query("SELECT * FROM kayit WHERE kullanici_sifre='$kullanici_sifre' ")->fetch();