<?php
session_start();
ob_start();
require_once "includes/pdo.php";
/*if(!isset($_SESSION["admin"])){  echo "<script type='text/javascript'>alert('Öncelikle Giriş Yapmanız Gerekmektedir!')</script>";
  header("LOCATION: login.php");}
       
        else{
           header("Refresh: 9999999999; url= adminMesajlar.php");
        } */
       ?>
<!DOCTYPE html>
<html lang="en">
<head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Sayfası</title>
        <link rel="stylesheet" href="/ProjeOtostop/css/adminOtostop.css?key=<?=time()?>">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

       

</head>
<body>
       <?php 
       include_once('includes/adminMenu.php')
       ?>
       <h1 class="AdmiBarTittle">Kullanıcılar</h1>
                        </div>
                        <div class="AdminSectionInner">

                                <div class="adminSectionTable">
                                        <table class="table table-dark table-striped">
                                                <thead>
                                                  <tr>
                                                    <th>Sıra No</th>
                                                    <th>Kullanıcı Ad </th>
                                                    <th> Soyad</th>
                                                    <th>Kullanıcı Rol</th>
                                                    <th>Telefon Numarası</th>
                                                    <th>Mail</th>
                                                    <th>Parola</th>
                                                    <th>Sil</th>                                                   
                                                    <th>Düzenle</th>
                                                  </tr>
                                                </thead>                                            
                                                  <?php

                                                $sonuc=mysqli_query($baglanti,"SELECT * from kayit");
                                                mysqli_set_charset($baglanti, "utf8");
                                                while($kayit_row=mysqli_fetch_assoc($sonuc))
                                                  { 
                                                    $kayit_id=$kayit_row['kayit_id'];                         
                                                    $ad = $kayit_row['kayit_ad'];
                                                    $soyad = $kayit_row['kayit_soyad'];
                                                    $rol =$kayit_row['rol'];

                                                    $tel = $kayit_row['kayit_tel'];
                                                    $mail= $kayit_row['kayit_mail'];
                                                    $sifre = $kayit_row['kayit_sifre'];
                                                    
                                                    
                                                  echo '<form action="" method="POST">'; 
                                                  echo '<input type ="hidden" name ="kayit_id" value = "'.$kayit_id.'">';
                                                  echo ' <tbody>';
                                                  echo ' <tr>';
                                                   echo ' <tr>';
                                                   echo ' <td>'.$kayit_id.'</td>';
                                                   echo ' <td>'.$ad.'</td>';
                                                   echo '<td>'.$soyad.'</td>';
                                                   echo '<td>' .$rol.'</th>';
                                                   echo '<td>'.$tel.'</td>';
                                                   echo '<td>'.$mail.'</td>';
                                                   echo '<td><p>'.$sifre.'</p></td>';                                                                      
                                                   echo ' <td><input type="submit"  name="sil" value="Sil"></td>';
                                                   echo '<td><input type="submit"  name="guncelle" value="Rol Değiştir"></td>';


                                                   echo ' </tr>';
                                                   echo '</tbody>';
                                                   echo '</form>';
                                                  }
                                               
                                                    ?>
                                            </table>
                                            
                                <?php
                                  if(isset($_POST['sil'])){
                                    $iletisim_id = $_POST['kayit_id'];
                                    $sql = "DELETE FROM kayit WHERE kayit_id='$kayit_id'";
                                    $sonuc=mysqli_query($baglanti,"SELECT * from kayit where kayit_id='$kayit_id'");
                                    $satir=mysqli_fetch_assoc($sonuc);
                                        if (mysqli_query($baglanti, $sql)) { 
                                      echo "Record deleted successfully";
                                      header('LOCATION: AdminKullanicilar.php');
                                    } else {
                                    echo "Error deleting record: " . mysqli_error($baglanti);
                                    }
                            
                                    }  


                                    if(isset($_POST['guncelle'])){
                                      $kayit_id = $_POST['kayit_id']; 
                                      $rol_kontrol=$_POST['rol'];
                                      $rol='0';
                                      $rol1='1';
                                      if($rol_kontrol == 1){
                                           $sql = "update kayit set rol = '$rol' where kayit_id ='$kayit_id'";
                                          if($baglanti->query($sql) ==   true){
                                            header('LOCATION: AdminKullanicilar.php');
                                          }else {
                                            echo "Hata : ". $baglanti->error;
                                            header('LOCATION: AdminKullanicilar.php');
                                          }
                                      }
        
                                     else if($rol_kontrol == 0){
                                      $sql = "update kayit set rol = '$rol1' where kayit_id ='$kayit_id'";
                                      if($baglanti->query($sql) ==   true){
                                        header('LOCATION: AdminKullanicilar.php');
                                      }else {
                                        echo "Hata : ". $baglanti->error;
                                        header('LOCATION: AdminKullanicilar.php');
                                      }
        
                                       }
                                     
                                      }




                                 
                                 ?>
        
                                                </div>
                                                

                        </div>

                </div>

        </div>

        </form>
</body>
</html>
<?php
ob_end_flush();
?>