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
       <a href="anasayfa.php"><i class="fas fa-home"></i>Anasayfa</a> 
       <a href="hakkimizda.php"><i class="fas fa-info"></i>Hakkımızda</a> 
       <a href="iletisim.php"><i class="fas fa-phone-volume"></i>İletişim</a> 
       <a href="giris.php"><i class="fas fa-user"></i>Giriş Yap</a> 
       <a href="kayit.php"><i class="fas fa-user-plus"></i>Kayıt Ol</a>
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
               <h5 id="h5sol">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, ab earum. Sit, quis optio veritatis distinctio consequatur obcaecati, laboriosam facere consectetur et animi facilis impedit. Iste quidem ab enim dolores?</h5>
            </div>

            <div id="sag">
                <h5 id="h5sag">Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime vero voluptatibus repudiandae, nulla cumque error et esse maiores voluptas nemo itaque alias autem ipsam incidunt numquam quas in adipisci laborum.    </h5>
                <span>O</span>
                <p id="psag">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Amet voluptate pariatur animi iusto quia voluptatem autem, porro vel deleniti possimus eaque aut laboriosam quam id praesentium ad vitae quae reprehenderit!</p>

            </div>
           <img src="Resim/yolculuk.jpg" alt="" class="img-fluid mt100">

             <p id="pson">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Rerum ipsa quod quis ut itaque voluptas, quasi quia eligendi accusamus aliquam voluptates corporis laboriosam saepe dolor, facere fuga perferendis velit maxime.</p>
        </div>
   </section>
        
    
</body>
</html>

<?php

include("includes/pdo.php");

?>