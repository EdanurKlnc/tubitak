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
       <a href="anasayfa.php"><i class="fas fa-home"></i>Anasayfa</a> 
       <a href="hakkimizda.php"><i class="fas fa-info"></i>Hakkımızda</a> 
       <a href="iletisim.php"><i class="fas fa-phone-volume"></i>İletişim</a> 
       <a href="giris.php"><i class="fas fa-user"></i>Giriş Yap</a> 
       <a href="kayit.php"><i class="fas fa-user-plus"></i>Kayıt Ol</a>
    </nav>
    </section>
    
    <div class="box">
        <form>
            <span class="text-center">Giriş</span>
        <div class="input-container">
            <input type="mail" required=""/ id="mail">
            <label>E-mail</label>		
        </div>
        <div class="input-container">		
            <input type="password" required=""/ id="sifre">
            <label>Sifre</label>
           <br> </br>
            <a href="kayit.php">Kayıt Ol</a>
        </div>
            <button type="button" class="btn">GİRİŞ</button>
    </form>	
    </div>
    
    
</body>
</html>
<?php

include("includes/pdo.php");

?>