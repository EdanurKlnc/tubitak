 <?php  
/*

$vt_sunucu="localhost";
$vt_kullanici="root";
$vt_sifre="";
$vt_adi="proje";

$baglan=mysqli_connect($vt_sunucu, $vt_kullanici, $vt_sifre, $vt_adi );

if(!$baglan)
{
    die("Veritabanı bağlanti işlemi başarısız".mysqli_connect_error());
}

else {

    echo "BAĞLANTI BAŞARILI";

} */
 //ana veri tabanı bağlantımız heryerde kullandığımız pdo yöntemiyle bağlandık çünkü günümüz dünyasında hacklenmesi zor bir bağlantı
 $pdo = new PDO ('mysql:host=localhost; port=3306;  dbname=proje; charset=utf8','root','');
 $pdo ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
 $baglanti = new mysqli("localhost", "root","", "proje");

?>
