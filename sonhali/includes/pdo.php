<?php   

$vt_sunucu="localhost";
$vt_kullanici="root";
$vt_sifre="";
$vt_adi="yeni";

$baglan=mysqli_connect($vt_sunucu, $vt_kullanici, $vt_sifre, $vt_adi );

if(!$baglan)
{
    die("Veritabanı bağlanti işlemi başarısız".mysqli_connect_error());
}
/*
else {

    echo "BAĞLANTI BAŞARILI";

} 
*/
?>