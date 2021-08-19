import 'package:flutter/material.dart';
import 'package:sociaworld/gonderiKarti.dart';

class ProfilSayfasi extends StatelessWidget {
  final String adSoyad;
  final String kullaniciAdi;
  final String kapakResimLinki;
  final String profilResimLinki;

  const ProfilSayfasi(
      {Key key,
      this.adSoyad,
      this.kullaniciAdi,
      this.kapakResimLinki,
      this.profilResimLinki})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      //appBar: AppBar(),
      body: ListView(
        children: [
          Stack(
            //üst üste dizileceği için stack widgetı
            children: [
              Container(
                //en alt container
                height: 230.0,
                //color: Colors.pink[900], Stack sınırını görmek için ekleyebilirsin
              ),
              Container(
                //kapak fotoğrafı containeruı
                height: 180.0,
                decoration: BoxDecoration(
                    color: Colors.pink[100],
                    image: DecorationImage(
                        image: NetworkImage(kapakResimLinki),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                //tek bir elemenı hizalamak için istediğimiz containerı bu widgetın içine aldık
                bottom: 0.0, //alt kenara olan uzaklığı sıfır olsun
                left: 20.0,
                child: Container(
                  //profil resmi containerı
                  width: 120.0,
                  height: 120.0,

                  decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(60.0),
                      border: Border.all(width: 2.0, color: Colors.white),
                      image: DecorationImage(
                          image: NetworkImage(
                              profilResimLinki), //hangi profile tıklandıysa o resmi göstersin diye
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                top: 185.0,
                left: 145.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, //textlerin ikisinide sola hizaladık
                  children: [
                    Text(
                      //ad soyad texti
                      adSoyad, //aynı kullanıcı adı profil sayfasında da göründü
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      //kullanıcı adı texti
                      kullaniciAdi,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 130.0,
                right: 15.0,
                child: Container(
                  //takip et coteinerı
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey[200],
                      border: Border.all(width: 2.0, color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Takip Et",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
          SizedBox(
            height: 20.0,
          ), //20 pixellik boşluk bırakarak takip bilgileri containerına geçebiliriz.
          Container(
            height: 75.0,
            color: Colors.grey.withOpacity(
                0.1), //renk tou ile değil opaklık ile rengi ayarladık
            child: Row(
              //yan yana durmaları için row
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                sayac("Takipçi", "20K"),
                sayac("Takip", "500"),
                sayac("Paylaşım", "75"),
              ],
            ),
          ),
          GonderiKarti(
            adSoyad: "Selin Yakan",
            gecenSure: "2 saat önce",
            aciklama: "...",
            profilResimLink:
                "https://cdn.pixabay.com/photo/2017/05/13/12/40/fashion-2309519__340.jpg",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2017/03/28/22/55/night-photograph-2183637__340.jpg",
          ),
        ],
      ),
    );
  }

  Column sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //alt alta durmaları için column
      children: [
        Text(
          sayi,
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 1.0,
        ),
        Text(
          baslik,
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ],
    );
  }
}
