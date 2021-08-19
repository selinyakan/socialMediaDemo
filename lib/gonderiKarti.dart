import 'package:flutter/material.dart';

class GonderiKarti extends StatelessWidget {
  final String profilResimLink;
  final String adSoyad;
  final String gecenSure;
  final String gonderiResimLinki;
  final String aciklama;

  const GonderiKarti(
      {Key key,
      this.profilResimLink,
      this.adSoyad,
      this.gecenSure,
      this.gonderiResimLinki,
      this.aciklama})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        //gönderi kartına yükseklik vermek için meterial ekledik
        elevation: 1.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          //gönderi kartları
          padding: EdgeInsets.all(
              15.0), //içine eklenen gönderiler kenara yapışmasın diye
          width: double.infinity,
          height: 380.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, //kolon içindekilerin yatay eksende sola hizalanması
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //isim resim ve 3nokta yan yana eklensin diye
                children: [
                  Row(
                    //pp ve isim tek row içinde olsun
                    children: [
                      Container(
                        //profil resmini gösteren container
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey[800],
                            image: DecorationImage(
                                image: NetworkImage(
                                  profilResimLink,
                                ),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        //pp containerı ile isim arasında boşluk olsun diye
                        width: 11.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            //isim texti
                            adSoyad,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            //gönderi zamanı
                            gecenSure,
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
              SizedBox(
                //resim açıklaması ve üstteki pp vs arasında biraz boşluk olsun diye
                height: 15.0,
              ),
              Text(
                aciklama,
                style: TextStyle(fontSize: 18.0, color: Colors.grey),
              ),
              /* Image(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/10/06/21/10/horse-2824660__340.jpg"
                    ),
              ),*/
              SizedBox(
                height: 20.0,
              ),
              Image.network(
                gonderiResimLinki,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //alttaki sosyal butonlar yan yana olsun diye row ekledik
                children: [
                  IkonluButonum(
                    ikonum: Icons.favorite,
                    yazi: "Beğen",
                    fonksiyonum: () {
                      print("Beğen");
                    },
                  ),
                  IkonluButonum(
                    ikonum: Icons.comment,
                    yazi: "Yorum Yap",
                    fonksiyonum: () {
                      print("Yorum Yap");
                    },
                  ),
                  IkonluButonum(
                    ikonum: Icons.share,
                    yazi: "Paylaş",
                    fonksiyonum: () {
                      print("Paylaş");
                    },
                  ),
                  //FlatButton.icon(Onpressed: () {}, icon: Icon(Icons.share,color:Colors.grey,), label: Text("Paylaş", style: TextStyle( color:Colors.grey,)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IkonluButonum extends StatelessWidget {
  final IconData ikonum; //parametre olarak gönderilmesi için
  final String yazi;
  final fonksiyonum;

  IkonluButonum({this.ikonum, this.yazi, this.fonksiyonum});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: fonksiyonum,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            //beğen butonu iki widget yan yana olsun diye row
            children: [
              Icon(
                ikonum,
                color: Colors.grey,
              ),
              SizedBox(
                width: 6.0,
              ),
              Text(
                yazi,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
