<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  
    <link rel="stylesheet" href="Css/iletisim.css"> 
    <link rel="stylesheet" href="Css/style.css"> 

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/c20485228a.js"
    crossorigin="anonymous" > </script> 

    <title>İletişim</title>
</head>
<body>
    <section id="menu">
        <div id="logo">İletişim</div>
        <nav> 
       <a href="afterloginhome.php"><i class="fas fa-home"></i>Anasayfa</a> 
       <a href="afterloginabout.php"><i class="fas fa-info"></i>Hakkımızda</a> 
       <a href="afterlogincotact.php"><i class="fas fa-phone-volume"></i>İletişim</a> 
       <a href="profil.php"><i class="fa fa-user-circle-o"></i>Profil</a> 


    </nav>
    </section>
    <section id="iletisim">
        <div class="container">
            <h1 id="h1iletisim">İletişim</h1>

            <div id="iletisimopak">
                <div id="formgroup">
                    <div id="solform">
                        <input type="text" name="isim"
                        placeholder="Ad Soyad" required class="form-control"> 
                        <input type="text" name="tel"
                        placeholder="Telefon Numarası" required class="form-control">
                    </div>
                    <div id="sagform">
                        <input type="email" name="mail"
                        placeholder="Email Adresi " required class="form-control"> 
                        <input type="text" name="konu"
                        placeholder="Konu Başlığı" required class="form-control">
                   
                    </div>
                    <textarea name="mesaj" id="" cols="30" 
                    placeholder="Mesaj Giriniz" rows="10" required class="form-contol"></textarea>
                    
                    <input type="submit" value="Gönder">
                </div>

                <div id="adres">
                    <h4>Adres : </h4>
                    <p class="adresp">Bartın Üniversitesi </p>
                    <p  class="adresp" >Mühendislik Fakültesi</p>
    
                    <p class="adresp" >Bilgisayar Mühendisliği</p>
                    <p class="adresp">0212 xxx xx xx</p>
                    <p class="adresp">Email : xxx@bartın.edu.tr</p>


                </div>
            </div>
      <footer>
      <div id="copyright0"> 2021 |           
     Tüm Hakları Saklıdır </div>
    <div id="socialfooter"></div>
     <a href="#"><i class="fab fa-facebook-f social"></i></a>
     <a href="#"><i class="fab fa-google-plus-g social"></i></a>
     <a href="#"><i class="fab fa-twitter social"></i></a>
    
     <a href="anasayfa.html"><i class="fas fa-chevron-up"></i></a>
      </footer>
        </div>
    </section>

    
    
</body>
</html>
<?php

include("includes/pdo.php");

?>