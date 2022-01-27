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
       <h1 class="AdmiBarTittle">Mesajlar</h1>
                        </div>
                        <div class="AdminSectionInner">

                                <div class="adminSectionTable">
                                        <table class="table table-dark table-striped">
                                                <thead>
                                                  <tr>
                                                    <th>Sıra No</th>
                                                    <th>Ad Soyad</th>
                                                    <th>Telefon Numarası</th>
                                                    <th>Konu</th>
                                                    <th>Mail</th>
                                                    <th>Mesaj</th>                                                   
                                                    <th>Sil</th>
                                                  </tr>
                                                </thead>                                            
                                                  <?php

                                                $sonuc=mysqli_query($baglanti,"SELECT * from iletisim");
                                                mysqli_set_charset($baglanti, "utf8");
                                                while($mesajlar_row=mysqli_fetch_assoc($sonuc))
                                                  { 
                                                    $iletisim_id=$mesajlar_row['iletisim_id'];                         
                                                    $ad = $mesajlar_row['iletisim_adsoyad'];
                                                    $tel = $mesajlar_row['iletisim_tel'];
                                                    $konu = $mesajlar_row['iletisim_konu'];
                                                    $mail = $mesajlar_row['iletisim_mail'];
                                                    $mesaj = $mesajlar_row['iletisim_mesaj'];
                                                    
                                                    
                                                  echo '<form action="" method="POST">'; 
                                                  echo '<input type ="hidden" name ="iletisim_id" value = "'.$iletisim_id.'">';
                                                  echo ' <tbody>';
                                                  echo ' <tr>';
                                                   echo ' <tr>';
                                                   echo ' <td>'.$iletisim_id.'</td>';
                                                   echo ' <td>'.$ad.'</td>';
                                                   echo '<td>'.$tel.'</td>';
                                                   echo '<td>'.$konu.'</td>';
                                                   echo '<td>'.$mail.'</td>';
                                                   echo '<td><p>'.$mesaj.'</p></td>';                                                                      
                                                   echo ' <td><input type="submit"  name="sil" value="Sil"></td>';
                                                   echo ' </tr>';
                                                   echo '</tbody>';
                                                   echo '</form>';
                                                  }
                                               
                                                    ?>
                                            </table>
                                            
                                <?php
                                  if(isset($_POST['sil'])){
                                    $iletisim_id = $_POST['iletisim_id'];
                                    $sql = "DELETE FROM iletisim WHERE iletisim_id='$iletisim_id'";
                                    $sonuc=mysqli_query($baglanti,"SELECT * from iletisim where iletisim_id='$iletisim_id'");
                                    $satir=mysqli_fetch_assoc($sonuc);
                                        if (mysqli_query($baglanti, $sql)) { 
                                      echo "Record deleted successfully";
                                      header('LOCATION: adminMesajlar.php');
                                    } else {
                                    echo "Error deleting record: " . mysqli_error($baglanti);
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