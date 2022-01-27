<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anasayfa | OTOSTOP</title>

    <link rel="stylesheet" href="Css/style.css"> 

    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap" rel="stylesheet">
    
    <script src="https://kit.fontawesome.com/c20485228a.js"
    crossorigin="anonymous" > </script> 

</head>
<body>
    <section id="menu">
        <div id="logo">Otostop</div>
        <nav> 
        <a href="afterloginhome.php"><i class="fas fa-home"></i>Anasayfa</a> 
       <a href="afterloginabout.php"><i class="fas fa-info"></i>Hakkımızda</a> 
       <a href="afterlogincontact.php"><i class="fas fa-phone-volume"></i>İletişim</a>
       <a href="profil.php"><i class="fa fa-user-circle-o"></i>Profil</a> 
       <a href="anasayfa.php"><i class="fas fa-times-circle"></i></i>Çıkış Yap</a>  
    </nav>
    </section>
    
    <section id="anasayfa">
        <div id="black"> </div>

        <div id="icerik">
            <h2>İçerik</h2>
            <hr width=300>
            <p>Otostop, motorlu taşıtları ile seyahat eden insanları seyahat ettikleri istikamet üzerinde durdurup, gidecekleri yönün sorulması suretiyle yapılan ücretsiz bir seyahat biçimidir.
            </p>

        </div>

    
    </section>

</body>
</html>

<?php

include("includes/pdo.php");

?>