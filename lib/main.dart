import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociaworld/gonderiKarti.dart';
import 'package:sociaworld/profilSayfasi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 1.0, //gölge efekti
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
              size: 32.0,
            ),
            onPressed: () {}),
        title: Text(
          "SociaWorld",
          style: TextStyle(fontSize: 20.0, color: Colors.grey),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.red[200],
                size: 32.0,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
        //alt alta bir şey sıralanacaksa kullanılır
        children: [
          SizedBox(height: 4.0),
          Container(
            //cevrimici kullanıcılar
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(
                  color: Colors.grey[400],
                  offset: Offset(0.0, 3.0), //gölge
                  blurRadius: 5.0 //gölge keskinliği
                  ),
            ]),
            height: 85.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                profilKartiOlustur(
                    "evayakan",
                    "https://cdn.pixabay.com/photo/2014/06/21/08/43/rabbit-373691__340.jpg",
                    "Eva Yakan",
                    "https://cdn.pixabay.com/photo/2016/12/30/19/33/children-1941336_960_720.png"),
                profilKartiOlustur(
                    "selinyakan",
                    "https://cdn.pixabay.com/photo/2017/05/13/12/40/fashion-2309519__340.jpg",
                    "Selin Yakan",
                    "https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569__340.jpg"),
                profilKartiOlustur(
                    "tom.5",
                    "https://cdn.pixabay.com/photo/2018/08/28/13/29/avatar-3637561_960_720.png",
                    "Tom B",
                    "https://cdn.pixabay.com/photo/2017/04/19/20/06/colorado-2243446__340.jpg"),
                profilKartiOlustur(
                    "emma.98",
                    "https://cdn.pixabay.com/photo/2018/08/28/14/40/avatar-3637701_960_720.png",
                    "Emma D",
                    "https://cdn.pixabay.com/photo/2013/11/13/21/14/san-francisco-210230__340.jpg"),
                profilKartiOlustur(
                    "r.robert",
                    "https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png",
                    "R Robert",
                    "https://cdn.pixabay.com/photo/2017/03/02/06/03/photomanipulation-2110496__340.jpg"),
                profilKartiOlustur(
                    "mary_",
                    "https://cdn.pixabay.com/photo/2012/04/13/00/21/lady-31217_960_720.png",
                    "Mary Ocea",
                    "https://cdn.pixabay.com/photo/2016/11/21/18/07/automotive-1846910__340.jpg"),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GonderiKarti(
            adSoyad: "Selin Yakan",
            gecenSure: "1 dk önce",
            aciklama: "Muhteşem...",
            profilResimLink:
                "https://cdn.pixabay.com/photo/2020/10/19/13/26/british-shorthair-5667822__340.jpg",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2017/10/06/21/10/horse-2824660__340.jpg",
          ),
          GonderiKarti(
            adSoyad: "Arda Yakan",
            gecenSure: "2 saat önce",
            aciklama: "Bugün böyle olsun",
            profilResimLink:
                "https://cdn.pixabay.com/photo/2018/08/19/21/54/lion-3617679__340.jpg",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2018/08/18/18/50/sunset-3615276__340.jpg",
          ),
        ],
      ),
    );
  }

  Widget profilKartiOlustur(String kullaniciAdi, String resimLinki,
      String adSoyad, String kapakResimLinki) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              // bir sayfayı diğer sayfanın üzerine eklemeyi sağlar
              context,
              MaterialPageRoute(
                  //MaterialPageRoute android cihazlarda sayfa geçişinin aşağıdan yukarı doğru olmasını sağlarken ios da cupertino gibi sağdan sola geçiş sağlar.
                  builder: (BuildContext context) => ProfilSayfasi(
                        profilResimLinki: resimLinki,
                        kullaniciAdi: kullaniciAdi,
                        adSoyad: adSoyad,
                        kapakResimLinki:
                            kapakResimLinki, //hangi profile tıklandıysa o resmi,o ismi göstersin diye
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd, //Alignment.topRight
                children: [
                  Container(
                    //kullanıcı adı,profil resmi
                    width: 55.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          //sınıf
                          width: 2.0,
                          color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(35.0),
                      image: DecorationImage(
                          image: NetworkImage(
                              resimLinki), //parametre olarak hangi resmi gönderirsek networkImage o resmi getirir.
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    //aktif mi?
                    width: 17.0,
                    height: 17.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 4.0),
              Text(
                kullaniciAdi,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
