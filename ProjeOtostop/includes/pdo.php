
    <?php
       //ana veri tabanı bağlantımız heryerde kullandığımız pdo yöntemiyle bağlandık çünkü günümüz dünyasında hacklenmesi zor bir bağlantı
       $pdo = new PDO ('mysql:host=localhost; port=3307;  dbname=proje;charset=utf8','root','asdfghjkl..1');
       $pdo ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
       $baglanti = new mysqli("localhost", "root","asdfghjkl..1", "proje");
      
        
        ?>