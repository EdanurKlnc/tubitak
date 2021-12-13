<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="Css/hakkimizda.css"> 
    <link rel="stylesheet" href="Css/style.css"> 

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/c20485228a.js"
    crossorigin="anonymous" > </script> 
 
        <nav> 
        <a href="afterloginhome.php"><i class="fas fa-home"></i>Anasayfa</a> 
       <a href="afterloginabout.php"><i class="fas fa-info"></i>Hakkımızda</a> 
       <a href="afterlogincontact.php"><i class="fas fa-phone-volume"></i>İletişim</a>
       <a href="profil.php"><i class="fa fa-user-circle-o"></i>Profil</a> 
       <a href="anasayfa.php"><i class="fas fa-times-circle"></i></i>Çıkış Yap</a>  
    </nav>
    </section>
    
    <title>Hakkımızda</title>
</head>
<body>
    <section id="menu">
        <div id="logo">Hakkımızda</div>

    </section>
   <section id="hakkimizda">
       <h3>Hakkımızda</h3>
       <div id="container">
           <div id="sol">
               <h5 id="h5sol"> Bartın Üniversitesi Bilgisayar Mühendisliği Öğrencileri</h5>
            </div>

            <div id="sag">
                <h5 id="h5sag">Gelişen teknoloji ile geçmişteki alışkanlıklarımızı daha konforlu hale getirmeye amaçladık. Amaçlarımız doğrultusunda mobil otostop uygulamasını geliştirerek ‘otostop’ kavramını güncelleştirdik. Otostop çekmek isteyen bireylerin güzergahlarından araç geçecek mi, geçen araç otostop için duracak mı, nereye kadar bırakacak sorularını ortadan kaldırdık. Otostop için en önemli husus olan güvenilirlik korkusunu da uygulama içinde kullanıcıların bilgileri ile ortadan kaldırdık. Bu sayende her bireyin güven içinde otostop ile seyahat etmesini kolaylaştırdık.     </h5>
                <span></span>
                <p id="psag"> </p>

            </div>
           <img src="Resim/yolculuk.jpg" alt="" class="img-fluid mt100">

             <p id="pson"> Seyahat etmek hiç bu kadar kolay olmamıştı !</p>
        </div>
   </section>
        
    
</body>
</html>

<?php

include("includes/pdo.php");

?>