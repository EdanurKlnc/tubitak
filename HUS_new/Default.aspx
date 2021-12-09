<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HUS_new._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Hasta Uyarı Sistemi (HUS)</h1>
        <p class="lead">HUS tip 2 diyabetli bireyler için mobil uyarı sistemidir. Geliştirilen bu uygulama ile hastalara, araştırmacı tarafından hazırlanan ve diyabet eğitimini içeren bilgi mesajları gönderilecektir. Mesajlar 6 ay boyunca her iki günde bir gönderilecektir. Araştırmacı tarafından literatürden yararlanarak hazırlanan bilgi mesajlarının eğitim içeriği; hastaların diyabet yönetimine ilişkin beslenme, fiziksel aktivite, sağlık hizmetlerinin kullanımı, ilaç kullanımı, diyabetin komplikasyonları ve kan şekeri izlemi ile ilgili bilgi ve davranışlarına katkı sağlamak amacıyla oluşturulmuştur.</p>
        <p><a href="~/PASAPP/app-debug.apk" runat="server" class="btn btn-primary btn-lg">HUS'u Yükle &raquo;</a></p>
    
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Diyabet</h2>
            <p>
                Diyabet, tüm dünyada en yaygın görülen hastalıklardan biridir. Diyabetin en yaygın tipi olan Tip 2 diyabet, tüm diyabet vakalarının yaklaşık %90'ını oluşturur. Tip 2 diyabet prevalansı tüm dünyada artmakla birlikte daha çok yetişkinlerde görülmektedir. Ancak obezite, fiziksel hareketsizlik ve kötü beslenmenin yaygınlaşması ile çocuklarda, ergenlerde ve genç erişkinlerde de görülme sıklığı artmaktadır. Diyabet tedavisinin temelinde, uygun bir beslenme tarzının benimsenmesini, fiziksel aktivitenin arttırılmasını, sigara bırakma planını ve ideal vücut ağırlığının korunmasını içeren sağlıklı yaşam tarzı değişiklikleri yer almaktadır. 
            </p>
            <p>
                <!--<a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>-->
            </p>
        </div>
        <div class="col-md-4">
            <h2>Diyabet ve Uyum</h2>
            <p>
                Diyabetli bireylerde diyabet yönetimine uyumsuzluk yaygın olarak görülen bir durumdur. Diyabet gibi kronik hastalıklarda uyum sorunu özellikle tedavinin başarısını engellemekle birlikte, hastalık sürecinin olumsuz yönde ilerlemesine, başka hastalıkların ve ölümlerin gelişmesine, hastalık maliyetlerinin artmasına ve buna bağlı olarak da mesleki ve ailesel sorunlar oluşmasına ve sonuç olarak da hastanın yaşam kalitesi düşmesine neden olmaktadır. 
            </p>
            <p>
                <!--<a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>-->
            </p>
        </div>
        <div class="col-md-4">
            <h2>Diyabet Yönetimi</h2>
            <p>
                Diyabet yönetimi; tıbbi tedaviye uyum, diyete uyum, kan glukoz seviyesini izleme, fiziksel aktivite yapma ve ayak bakımı gibi pek çok boyutu içermektedir. Tip 2 diyabetli bireyler için diyabet yönetimi kompleks ve zordur. Birçok tip 2 diyabet komplikasyonu etkili bir diyabet özyönetimi ile önlenebilir ve/veya ertelenebilir olduğu belirtilmektedir. Teknoloji temelli eğitim ve izlem ile diyabetli bireylerin hem gün içinde flaş bilgilendirme ile eğitimlerinin sürdürülmesi hem de diyabet yönetimlerine uyum için günlük yaşam içinde değiştirilmesi zor gelen davranışlarında destek ve motivasyonun sağlanması uygun bir yöntem olabilir. 
            </p>
            <p>
                <!--<a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>-->
            </p>
        </div>
    </div>

</asp:Content>
