<?php
include("includes/pdo.php");

?>

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
       <a href="anasayfa.php"><i class="fas fa-home"></i>Anasayfa</a> 
       <a href="hakkimizda.php"><i class="fas fa-info"></i>Hakkımızda</a> 
       <a href="iletisim.php"><i class="fas fa-phone-volume"></i>İletişim</a> 
       <a href="giris.php"><i class="fas fa-user"></i>Giriş Yap</a> 
       <a href="kayit.php"><i class="fas fa-user-plus"></i>Kayıt Ol</a>
    </nav>
    </section>
    <section id="iletisim">
        <div class="container">
            <h1 id="h1iletisim">İletişim</h1>
            <form action="<?= htmlspecialchars($_SERVER['PHP_SELF'])?>" method="POST">

            <div id="iletisimopak">
                <div id="formgroup">
                    <div id="solform">
                        <input type="text" name="kadsoyad"
                        placeholder="Ad Soyad" required class="form-control"> 
                        <input type="text" name="ktel"
                        placeholder="Telefon Numarası" required class="form-control">
                    </div>
                    <div id="sagform">
                        <input type="email" name="kmail"
                        placeholder="Email Adresi " required class="form-control"> 
                        <input type="text" name="kkonu"
                        placeholder="Konu Başlığı" required class="form-control">
                   
                    </div>
                    <textarea name="kmesaj" id="" cols="30" 
                    placeholder="Mesaj Giriniz" rows="10" required class="form-contol"></textarea>
                    
                    <input type="submit" value="Gönder" name="gonder">
                </div>
                </form>

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
    
     <a href="anasayfa.php"><i class="fas fa-chevron-up"></i></a>
      </footer>
        </div>
    </section>

    
    
</body>
</html>

<?php

if(isset($_POST["gonder"])){
    $kullanici_adsoyad= $_POST['kadsoyad'];
    $kullanici_mail= $_POST['kmail'] ;
    $kullanici_tel=$_POST['ktel'] ;
    $kullanici_konu= $_POST['kkonu'];
    $kullanici_mesaj= $_POST['kmesaj'];

    $ekle = "INSERT INTO iletisim (iletisim_adsoyad,iletisim_mail,iletisim_tel,iletisim_konu,iletisim_mesaj) values ('".$kullanici_adsoyad."','".$kullanici_maili."','".$kullanici_teli."','".$kullanici_konu."','".$kullanici_mesaj."')";
    /* $sonuc=mysqli_query($baglan,$sql); */
    $pdo->exec($ekle);

    if($pdo==0) {
        echo"mesajınız alınamadı";

    }
    else{
        echo "<script type='text/javascript'>alert('Mesajınız başarıyla gönderildi,İletişim Sayfasına Yönlendiriliyorsunuz...')</script>";
           header("Refresh: 0; url=iletisim.php");
    }
}



?>