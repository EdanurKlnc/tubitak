<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil | OTOSTOP</title>

    <link rel="stylesheet" href="Css/profil.css"> 
    <link rel="stylesheet" href="Css/style.css"> 

    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap" rel="stylesheet">
    
    <script src="https://kit.fontawesome.com/c20485228a.js"
    crossorigin="anonymous" > </script> 

</head>
<body>
    <section id="menu">
        <div id="logo">Profil</div>
        <nav> 
<a href="afterloginhome.php"><i class="fas fa-home"></i>Anasayfa</a> 
<a href="afterloginabout.php"><i class="fas fa-info"></i>Hakkımızda</a> 
<a href="afterlogincontact.php"><i class="fas fa-phone-volume"></i>İletişim</a>
<a href="profil.php"><i class="fa fa-user-circle-o"></i>Profil</a> 
<a href="anasayfa.php"><i class="fas fa-times-circle"></i></i>Çıkış Yap</a> 
</section>

    </nav>
    <div class="container" style="width: 100%; height: 40%;">

        <div class="image" style="width: 15%; height: 8%;">
<div class="ekle">
 
<input type="button" value="Fotoğraf Ekle" class="about-btn">

</div>

</div>
<div class="content" style="width: 30%;height: 40%;">

        

    <div class="kullanici" ><p name="kadi" class="icerik"> -- </p></div>
    <div class="kullanici" ><p name="ksoyadi" class="icerik"> --  </p></div>
    <div class="kullanici" ><p name="karac" class="icerik">  --  </p>  </div>
    <div class="kullanici" ><p name="kaciklama" class="icerik">  --   </p></div>



</div>
<div class="other" style="width: 40%;height: 25%;">
    <p class="hakkimda" name="khakkinda">HAKKIMDA KISMI</p>
    <input type="button" value="Düzenle" class="about-btn">


</div>

    </div>
    <?php
   

    ?>

<?php

include("includes/pdo.php");





?>


</body>
</html>
