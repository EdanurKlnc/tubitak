<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil | OTOSTOP</title>

    <link rel="stylesheet" href="Css/profil.css"> 

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
<a href="afterlogincotact.php"><i class="fas fa-phone-volume"></i>Iletişim</a> 
<a href="profil.php"><i class="fa fa-user-circle-o"></i>Profil</a> 
</section>

    </nav>
    <div class="container" style="width: 100%; height: 100%;">

        <div class="image" style="width: 20%; height: 20%;">
<div class="ekle">
    <input type="submit" name="img-ekle" class="img" value="Fotoğraf Ekle">

</div>

</div>
<div class="content" style="width: 40%;height: 50%;">
    <div class="kullanici" ><p name="kadi" class="icerik">Ad </p></div>
    <div class="kullanici" ><p name="ksoyadi" class="icerik">Soyad</p></div>
    <div class="kullanici" ><p name="karac" class="icerik">E-mail</p></div>
    <div class="kullanici" ><p name="kaciklama" class="icerik">Numara</p></div>



</div>
<div class="other" style="width: 40%;height: 20%;">
    <p class="hakkimda" name="khakkinda"></p>
    <input type="button" value="Düzenle" class="about-btn">


</div>






    </div>




</body>
</html>
<?php

include("includes/pdo.php");

?>