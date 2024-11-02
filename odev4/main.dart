import 'package:flutter/material.dart';

void main() {
  runApp(ProductApp());
}

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(          //Material app tanımlandı ve butonlara tıklandığında arkaplanının
      theme: ThemeData(          //mavi olması sağlandı
        primarySwatch: Colors.blue,
      ),
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Map<String, dynamic>> products = [  //Ürün bilgilerinin tutulduğu liste tanımlandı
    {'name': 'Ürün 1', 'price': 10.0},
    {'name': 'Ürün 2', 'price': 20.0},
    {'name': 'Ürün 3', 'price': 30.0},
    {'name': 'Ürün 4', 'price': 40.0},
    {'name': 'Ürün 5', 'price': 50.0},
  ];
  int? selectedProductIndex;  //Tıklanan ürününü indexini tutan değişken tanımlandı

  void selectProduct(int index) {
    setState(() {             //Değişkene index ataması yapıldı
      selectedProductIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(                      //Materialapp içerisine bir scaffold tanımlandı
      appBar: AppBar(                     //ve içerisine başlıklı bir appbar eklendi ve arkaplan
        backgroundColor: Colors.white24,  //rengi ayarlandı
        centerTitle: true,
        title: Text(
          'ÜRÜN LİSTESİ',
          style: TextStyle(              //Başlık tipi ayarlandı
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(         //Scaffoldun body bölümüne bir column tanımlandı ve içerisine
        children: [         //boyutu 100 olan ve dikey eksende 10 piksel boşluk bırakılacak
          Container(        //bir container koyuldu
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(            //Bu container içerisine yatay yönde bir liste eklendi
              scrollDirection: Axis.horizontal, //ve liste elemanlarının dinamik olarak oluşturulması sağlandı
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {                  //Liste elemanlarından birine tıklandığında elemanın indexinin yukarıda tanımlanan
                    int? doubletapIndex = selectedProductIndex; //değişkene geçirilmesi sağlandı ve 2.bir tıklama sonucunda
                    selectProduct(index);                       //seçili elemanın seçiminin kaldırılması sağlandı
                    if (selectedProductIndex == doubletapIndex)
                      selectedProductIndex = -1;
                  },
                  child: Container(           //Container içerisine genişliği 80 piksel olan bir container tanımlandı yatay eksende
                    width: 80,                //8 piksel boşluk bırakılması sağlandı(Bu container her liste elemanı oluştuğunda oluşur)
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: selectedProductIndex == index   //Eğer butona tıklanmışsa arka plan renginin mavi eğer tıklanmanmış ise
                          ? Colors.blue.withOpacity(0.5)     //gri renkte olması sağlandı ve köşe geometrisi ayarlandı
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(               //Tanımlanana containerların içine ürün isminin yazılı olduğu text tanımlandı
                      child: Text(               //ve font büyüklüğü ayarlandı
                        products[index]['name'],
                        style: TextStyle(fontSize: 14)
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(                         //Column içerisine bir expanded tanımlandı ki uygulama boyutu değiştiğinde boyutu genişleyebilsin
            child: GridView.builder(        //İçerisine ise dinamik eleman tanımlanan 2 sütunluk gridview tanımlandı
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];        //Tıklanan ürünün indexi değişkene atandı ve 2. tıklama durumunda seçimin
                final isSelected = selectedProductIndex == index; //kaldırılması sağlandı
                return InkWell(
                  onTap: () {
                    selectProduct(index);
                    if (isSelected)
                      selectedProductIndex = -1;
                  },
                  child: Container(                 //Oluşan her bir grid elemanı container cinsinden ve yatay ve dikey eksenden
                    margin: EdgeInsets.all(5),      //5 piksel boşluk bırakılacak şekilde oluşturuldu ve tıklanma durumunda mavi
                    decoration: BoxDecoration(      //tıklamanın kaldırılması durumunda beyaz renk olması sağlandı ve köşe geometrisi
                      color: isSelected ? Colors.blue[100] : Colors.white, //ayarlandı ve yine aynı şekilde seçilme durumunda kenar
                      borderRadius: BorderRadius.circular(8), //rengi mavi seçimin kaldırılması durumunda ise siyah olması sağlandı
                      border: isSelected
                          ? Border.all(color: Colors.blue, width: 2)
                          : Border.all(color: Colors.black),
                    ),
                    child: Column(                 //Tanımlanan her bir gtid elemanının içerisine ise column tanımlamdı ve içerisine
                      mainAxisAlignment: MainAxisAlignment.end, //eklenecek elemanların sondan eklenmesi sağlandı
                      children: [
                        Text(                 //column içerisine 2 tane text tanımlandı ve ürün bilgileri eklendi, font boyutu
                          product['name'],    //ayarlandı
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${product['price']} TL',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
