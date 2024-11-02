import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode theme = ThemeMode.light;  //Açık temaya sahip theme değişkeni tanımlandı

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(                  //Bir materialapp tanımlandı ve açık tema parlaklığı, ana tema rengi,
        brightness: Brightness.light,    //scaffold arkaplan rengi appbar arkaplan rengi ve başlık rengi ayarlandı
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData( //Buton arkaplan rengi ayarlandı
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
        ),
      ),
      darkTheme: ThemeData(            //Koyu tema için tema parlaklığı, ana tema rengi,
        brightness: Brightness.dark,   //scaffold arkaplan rengi appbar arkaplan rengi ve başlık rengi ayarlandı
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData( //Buton arkaplan rengi ayarlandı
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
        ),
      ),
      themeMode: theme,    //Açılış tema modu başlangıçta tanımlanan açık temaya ayarlandı
      home: Scaffold(
        appBar: AppBar(      //Scaffold tanımlandı ve içerisinde başlıklı bir appbar tanımlandı
          centerTitle: true, //Başlık font kalınlığı ayarlandı
          title: Text(
            'Tema Değiştirme',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(      //Scafoldun body kısmına center widgetı yerleştirildi ve onun içerisine de
          child: Column(   //column eklendi onu içerisine ise bir text widgetı yerleştirildi ve
            mainAxisAlignment: MainAxisAlignment.center, //temaya göre temanın ne olduğu yazdırıldı
            children: [                //font rengi ve büyüklüğü ayarlandı
              Text(
                "Şu anki tema: ${theme == ThemeMode.dark ? "Karanlık" : "Açık"}",
                style: TextStyle(
                  color: theme == ThemeMode.dark ? Colors.white : Colors.black,
                  fontSize: 20,
                ),
              ),
              ElevatedButton(      //column içerisine bir buton eklendi ve tıklanması durumunda
                onPressed: () {    //temayı değiştirmesi sağlandı(değişkeni değiştirerek)
                  setState(() {
                    if (theme == ThemeMode.dark) {
                      theme = ThemeMode.light;
                    } else {
                      theme = ThemeMode.dark;
                    }
                  });
                },
                child: Text(          //Butonun içerisine text widgetı yerleştirildi
                  'Temayı Değiştir',  //Temaya göre renk ayarlaması yapıldı
                  style: TextStyle(  //Font boyutu ayarlandı
                    color:
                    theme == ThemeMode.dark ? Colors.black : Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}