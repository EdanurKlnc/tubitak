<?php
include("includes/pdo.php");

?>

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
    <form action="<?= htmlspecialchars($_SERVER['PHP_SELF'])?>" method="POST">
        
            <span class="text-center">Kayıt</span>
        <div class="input-container" id="ad"  autocomplete="off"  required autofocus oninvalid="alert('Kullanıcı Adını Girmeniz Zorunludur!')">
            <input type="name" required="name" name="kadi"/>
            <label>Ad</label>		
        </div>
        <div class="input-container" id="soyad"  autocomplete="off" required autofocus oninvalid="alert('Soyadınızı Girmeniz Zorunludur!')"> 
            <input type="sname" required="sname" name="ksoyadi"/>
            <label>Soyad</label>		
        </div>
        <div class="input-container-mail" id="mail" autocomplete="off" required autofocus oninvalid="alert('E-mailinizi Girmeniz Zorunludur!')">
            <input type="mail" required="mail" name="kmail" />
            <label>E-mail</label>		
        </div>
        <div class="input-container" id="sifre"  autocomplete="off" required autofocus oninvalid="alert('Şifrenizi Girmeniz Zorunludur!')">
            <input type="password" required="password" name="ksifre"/>
            <label>Şifre</label>		
        </div>
        <div class="input-container" id="tel"  >		
            <input type="tel" pattern="\d{11}" required="tel" name="ktel" title="Başında '0' olarak tuşlayınız"/>
            <label>Telefon Numarası</label>

        </div>
            <button type="submit" class="btn" name="kayit">KAYIT</button>
     </form>
    </div>
   



    

<?php


if(isset($_POST["kayit"])){
    $kullanici_adi= $_POST['kadi'];
    $kullanici_soyadi= $_POST['ksoyadi'];
    $kullanici_mail= $_POST['kmail'];
    $kullanici_sifre= md5($_POST['ksifre']);
    $kullanici_tel= $_POST['ktel'];


    $ekle = "INSERT INTO kayit (kayit_ad,kayit_soyad,kayit_mail,kayit_sifre,kayit_tel) values ('".$kullanici_adi."','".$kullanici_soyadi."','".$kullanici_mail."','".$kullanici_sifre."','".$kullanici_tel."')";
    $sonuc=mysqli_query($baglan,$ekle);

    if($sonuc==0){
        echo "veriler eklenemedi";
    }
    else{

        echo "<script> alert('Kayıt başarıyla oluşturuldu, anasayfaya yönlendiriliyorsunuz')</script>";
    }
    header ("location:giris.php");

}



?>

</body>
</html>