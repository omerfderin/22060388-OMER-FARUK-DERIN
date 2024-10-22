// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(              // Bu kısımda Scaffold içerisinde bir appbar tanımlandı
        appBar: AppBar(            // yüksekliği ve rengi değiştirildi ve ortasına text yerleştirildi
          leading: Icon(           // daha sonrasında bu appbar içerisine leading ile iconun
            Icons.arrow_back,      // başta olması sağlanması sağlandı, boyutu ve rengi değiştirildi.
            size: 35,
            color: Colors.white,
          ),
          toolbarHeight: 80,
          backgroundColor:
          const Color.fromARGB(255, 15, 23, 255).withOpacity(0.77),
          centerTitle: true,
          title: const Text(
            "Firmalar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        body: Container(                           //Scaffoldun kalan alt gövdesine bir container yerleştirildi, rengi değiştirildi
          color: const Color.fromARGB(185, 255, 255, 255),
          child: Padding(                                                //Container içerisine ise container ın sol ve sağdan 20 alt
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), //ve üstten ise 10 piksel boşluk bırakmasını sağlayan
            child: Column(                                               //padding tanımlandı.
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Kalan alan içerisine bir column tanımlandı ve içerisine eklenecek
              children: [                                       //elemanlar arası eşit boşluk bırakılması sağlandı(y ekseninde).
                Container(
                  height: 60,
                  decoration: BoxDecoration(                //Column içerisine Container tanımlandı ve boyut, renk, gölge ve köşe
                    borderRadius: BorderRadius.circular(14),// geometrisi ayarlandı.
                    color: const Color.fromARGB(255, 25, 18, 205),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(                     //Columna eklenen ilk containerın içerisine row widgetı tanımlandı
                    children: [                   //ardından içerisine soldan 10 piksel boşluk bırakılması sağlandı.
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Image(                      //Row içerisine bir sağlık temalı resim tanımlandı ve boyu değiştirildi.
                        image: AssetImage("lib/assets/images/eczane.png"),
                        height: 50,
                      ),
                      Expanded(
                        child: Container(                     //Row içerisine bir expanded tanımlandı ki içerisine yerleştireceğimz
                          padding: EdgeInsets.only(right: 65),//container kalan alanı kullanabilsin, ardından içerisine bir
                          child: Center(                      //center tanımlandı fakat center widgetı icondan
                            child: Text(                      //kalan alanın ortasını aldığından ana menü başlığı ve container
                              "Sağlık",                       //içine yerleştireceğimiz text tam olarak hizalanamamış olacağından
                              style: TextStyle(               //padding ile hizalama yaptık.
                                fontSize: 30,
                                fontWeight: FontWeight.w900, //Daha sonrasında center widgetı içerisine bir text tanımlandı
                                color: Colors.white,       // ve renk, font boyutu, font kalınlığı ayarlandı.
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(                            //Column içerisine bir container daha tanımlandı ve sonrasında yükseklik,
                  height: 65,                         //köşe geometrisi rengi ve arka planında bırakacağı gölge ayarlandı.
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(                            //Tanımlanan 2.container içerisine bir row widgetı tanımlandı ve içerisine
                    children: [                          //bir container tanımlandı ve bu container içerisine soldan 10 piksel
                      Container(                         //boşluk bırakılacak şekilde bir büyüteç resmi eklendi ve rengi
                        padding: EdgeInsets.only(left: 10),//değiştirildi.
                        child: Image(
                          image: AssetImage("lib/assets/images/buy1.png"),
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(             //2. container içerisine bir ikonun sağından 10 piksel sağa yerleştirilecek bir
                          'Firma Ara',           //text tanımlandı ve renk font boyutu, font kalınlığı ve rengi ayarlandı.
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(                                    //2. container ın alt tarafına denk gelicek şekilde bir container
                  alignment: Alignment.centerLeft,            //tanımlandı ve sol orta tarafa yerleştirildi içerisine
                  padding: EdgeInsets.fromLTRB(20, 0, 90, 0), //ise bir text widgetı tanımlandı ve
                  child: Text(                                //font boyutu, font kalınlığı ve rengi ayarlandı.
                    "İstediğiniz firmada indirim yakalama fırsatı...",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                      color: const Color.fromARGB(255, 122, 121, 121),
                    ),
                  ),
                ),
                Container(                                //Column içerisine 4. bir container daha yerleştirildi ve
                  height: 75,                             //boyutu, köşe geometrisi,rengi ve arka plan gölgesi ayarlandı.
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,   //Yukarıda eklenen container içerisine bir row widgetı
                    children: [                                          //eklendi ve içerisine eklenicek öğelerden ilkinin
                      Container(                                         //sola ikincisin ortaya sonuncusunun ise sağa
                        padding: EdgeInsets.fromLTRB(3, 0, 10, 0),       //dayalı konumlandırılacağı şekilde ayarlandı.
                        child: Image(
                          width: 40,                                      //Daha sonra row widgetına bir container yerleştirildi
                          image: AssetImage("lib/assets/images/ok2.png"), //ve soldan 3 sağdan 10 piksel boşluk bırakılması
                          color: Colors.black,                          //sağlandı ve sonrasında container içerisine bir
                        ),                                                //ok resmi eklenerek rengi ve genişliği ayarlandı.
                      ),
                      Flexible(                                            //Row widgetına bir flexible widgetı yerleştirildi ki
                        flex: 75,                                          //bu widget daha sonra bu row içerisine
                        child: Column(                                     //yerleştirilecek diğer flexible widgetının row
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,//widgetında kapladığı aran oransal olarak ayarlansın.
                          children: [
                            Container(                           //Tanımlanan ilk flexible widgetı içerisine bir column yetleştirildi
                              alignment: Alignment.centerLeft,   // ve elemanlar arası eşit boşluk olması sağlandı.
                              child: Text(                       //(2 satırlık mesaj için)
                                'Firma Adı Uzun Firma',
                                style: TextStyle(                //Column widgetı içerisine bir container eklendi ve container sol
                                  color: Colors.black,         //orta konumuna getirildi.
                                  fontSize: 20,                  //Container içerisine bir text widgetı tanımlandı
                                  fontWeight: FontWeight.bold,   //ve renk, font boyutu, font kalınlığı ve rengi ayarlandı.
                                ),
                              ),
                            ),
                            Container(                           //Column widgetı içerisine ikinci bir container tanımlandı ve aynı
                              alignment: Alignment.centerLeft,   //şekilde text tanımlanarak nitelikleri ayarlandı.
                              child: Text(
                                'Adı',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(           //Row widgetına 3. olarak flexible yerleştirildi ve üstte tanımlanan flexible ile oranlandı.
                        flex: 30,         //İçerisine bir container yerleştirildi ve köşe geometrisi, rengi ayarlandı.
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.zero, right: Radius.circular(14)),
                            color: const Color.fromARGB(255, 19, 16, 204),
                          ),
                          alignment: Alignment.center,  //Container ın merkezine bir text widgetı yerleştirildi
                          child: Text(                  //ve font boyutu,font kalınlığı ve rengi ayarlandı.
                            '%10',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(                                     //Buradan aşağıda kalan kısım yukarısı ile tekrar etmekte yalnızca
                  height: 75,                                  //"firma adı" ve "firma adı uzun firma adı"
                  decoration: BoxDecoration(                   //yazan containerlar arasında bir fark var "firma adı" yazan
                    borderRadius: BorderRadius.circular(14),   //containerlarda column widgetı yok çünkü tek
                    color: Colors.white,                     //satırlık mesaj yazılmak istenmişti.
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 0, 10, 0),
                        child: Image(
                          width: 40,
                          image: AssetImage("lib/assets/images/ok2.png"),
                          color: Colors.black,
                        ),
                      ),
                      Flexible(
                        flex: 75,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Firma Adı',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.zero, right: Radius.circular(14)),
                            color: const Color.fromARGB(255, 19, 16, 204),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '%10',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 0, 10, 0),
                        child: Image(
                          width: 40,
                          image: AssetImage("lib/assets/images/ok2.png"),
                          color: Colors.black,
                        ),
                      ),
                      Flexible(
                        flex: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Firma Adı Uzun Firma',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Adı',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.zero, right: Radius.circular(14)),
                            color: const Color.fromARGB(255, 19, 16, 204),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '%10',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 0, 10, 0),
                        child: Image(
                          width: 40,
                          image: AssetImage("lib/assets/images/ok2.png"),
                          color: Colors.black,
                        ),
                      ),
                      Flexible(
                        flex: 75,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Firma Adı',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.zero, right: Radius.circular(14)),
                            color: const Color.fromARGB(255, 19, 16, 204),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '%10',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 0, 10, 0),
                        child: Image(
                          width: 40,
                          image: AssetImage("lib/assets/images/ok2.png"),
                          color: Colors.black,
                        ),
                      ),
                      Flexible(
                        flex: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Firma Adı Uzun Firma',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Adı',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.zero, right: Radius.circular(14)),
                            color: const Color.fromARGB(255, 19, 16, 204),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '%10',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),   //Scaffoldun body kısmında tanımlanan büyük container burada sonlanıyor.
      ),
    );
  }
}
