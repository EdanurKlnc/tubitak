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
       <a href="anasayfa.php"><i class="fas fa-home"></i>Anasayfa</a> 
       <a href="hakkimizda.php"><i class="fas fa-info"></i>Hakkımızda</a> 
       <a href="iletisim.php"><i class="fas fa-phone-volume"></i>İletişim</a> 
       <a href="giris.php"><i class="fas fa-user"></i>Giriş Yap</a> 
       <a href="kayit.php"><i class="fas fa-user-plus"></i>Kayıt Ol</a>
    </nav>
    </section>
    
    <div class="box">
        <form>
            <span class="text-center">Kayıt</span>
        <div class="input-container" id="ad">
            <input type="name" required="name"/>
            <label>Ad</label>		
        </div>
        <div class="input-container" id="soyad"> 
            <input type="sname" required="sname"/>
            <label>Soyad</label>		
        </div>
        <div class="input-container-mail" id="mail">
            <input type="mail" required="mail"/>
            <label>E-mail</label>		
        </div>
        <div class="input-container" id="sifre">
            <input type="password" required="password"/>
            <label>Şifre</label>		
        </div>
        <div class="input-container" id="tel">		
            <input type="tel" pattern="\d{11}" required="tel" title="Başında '0' olarak tuşlayınız"/>
            <label>Telefon Numarası</label>

        </div>
            <button type="button" class="btn">KAYIT</button>
    </form>	
    </div>



    
</body>
</html>
<?php

include("baglanti.php");


?>