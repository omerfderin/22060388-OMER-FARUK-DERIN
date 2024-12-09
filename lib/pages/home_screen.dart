import 'package:flutter/material.dart';
import '../../services/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService(); //import edilen ApiService sınıfından nesne oluşturuldu
  late Future<List<dynamic>> _ogrenciler;  //Öğrenci listesi için değişken tanımlandı

  @override
  void initState() {
    super.initState();
    _ogrenciler = _apiService.getOgrenciler(); //Widget ilk defa oluşturulurken öğrenci listesi
  }                                            //alımı sağlandı

  void _addOgrenci() async {     //ApiService sınıfında tanımlanan metodun detaylı kullanımı
    await _apiService.addOgrenci({
      "ad": "Yeni",
      "soyad": "Öğrenci",
      "bolumID": 4,
    });
    setState(() {
      _ogrenciler = _apiService.getOgrenciler(); //Öğrenciler değişkeni güncelleneceği için state tanımlandı
    });
  }

  void _deleteOgrenci(int id) async {
    await _apiService.deleteOgrenci(id); //Öğrenci silme işlemi
    setState(() {
      _ogrenciler = _apiService.getOgrenciler();
    });
  }

  void _updateOgrenci(    //Öğrenci güncelleme işlemi
      int id, String currentAd, String currentSoyad, int currentBolumid) async {
    final TextEditingController adController =    //Her bir öğrenci nesnesi niteliği için
    TextEditingController(text: currentAd);       //controller tanımlandı
    final TextEditingController soyadController =
    TextEditingController(text: currentSoyad);
    final TextEditingController bolumidController =
    TextEditingController(text: currentBolumid.toString());

    showDialog(       //Ekleme işlemi sırasında ekranda diyalog penceresi göstermek için kullanıldı.
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(         //Gösterilecek diyalog penceresi build edildi.
          title: const Text('Öğrenci Güncelle'), //Diyalog pencere mesajı
          content: Column(             //Column yerleştirildi ve içerisine öğrenci
            mainAxisSize: MainAxisSize.min, //niteliklerini alacağımız 3 textfield yerleştirildi
            children: [
              TextField(
                controller: adController,
                decoration: const InputDecoration(labelText: 'Ad'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: soyadController,
                decoration: const InputDecoration(labelText: 'Soyad'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: bolumidController,
                decoration: const InputDecoration(labelText: 'Bölüm ID'),
              ),
            ],
          ),
          actions: [     //Diyalog penceresi işlemleri
            TextButton(     //Güncelleme işlemini tamamlayan buton
              onPressed: () async {
                String ad = adController.text;
                String soyad = soyadController.text;
                String bolumID = bolumidController.text;

                Map<String, dynamic> updatedData = {
                  'ad': ad,
                  'soyad': soyad,
                  'bolumID': bolumID,
                };
                await _apiService.updateOgrenci(id, updatedData); //Güncelleme işlemi isteği

                setState(() {
                  _ogrenciler = _apiService.getOgrenciler(); //Güncelleme işlemi yapıldıktan sonra
                });                                         //yeni hali alındı

                Navigator.of(context).pop();  //Güncelleme işlemi bittikten sonra pencereyi kapatır

                ScaffoldMessenger.of(context).showSnackBar(  //işlem başarılı mesajı gösteren snackbar
                  const SnackBar(content: Text('Öğrenci başarıyla güncellendi.')),
                );
              },
              child: const Text('Kaydet'), //Buton texti
            ),
            TextButton(   //İptal işlemi gerçekleştiren buton
              onPressed: () {
                Navigator.of(context).pop();  //Pencereyi kapatır
              },
              child: const Text('İptal'), //Buton texti
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Öğrenci Listesi')),
      body: Column(    //Scaffold body kısmına column tanımlandı
        children: [
          Expanded(           //içerisine bir expanded tanımlandı ki Future tipli widget oluşturulurken
            child: Container( //alan konusunda bir sıkıntı çıkmasın, içerisine de container yerleştirildi
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0), //Boşluklar ayarlandı
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), //Köşe geometrisi ve kenar rengi ayarlandı
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: FutureBuilder<List<dynamic>>(   //Öğrenci listesini tutan widget
                future: _ogrenciler,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) { //Oluşturma sırasında gösterilecek
                    return const Center(child: CircularProgressIndicator()); //widget tanımı
                  } else if (snapshot.hasError) {
                    return Center(    //Hata varsa hata mesajı basımı
                        child: Text('Hata oluştu: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return ListView.builder( //Hata yoksa dinamik liste oluşturur
                      itemCount: snapshot.data!.length, //öğrenci sayısı kadar listtile oluşturma
                      itemBuilder: (context, index) {
                        final ogrenci = snapshot.data![index]; //O sırada hangi öğrencinin listeye yerleştirildiğini
                        return Container(                      //tutacak değişken
                          margin: const EdgeInsets.all(10),    //Build edilecek container tanımlandı ve köşe geometrisi,
                          decoration: BoxDecoration(           //kenar rengi ayarlandı
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.blueGrey,
                            ),
                          ),
                          child: ListTile(    //Container içerisine listtile tanımlandı ve içerisine yerleştirelen
                            title: Text(      //öğrenci bilgileri text widgetı ile yazıldı
                                '${ogrenci['ad']} ${ogrenci['soyad']}'),
                            subtitle:
                            Text('Bölüm ID: ${ogrenci['bolumID']}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(    //Listtile ın sağa yapışık biçimde güncelleme işlemini yapacak
                                  icon: const Icon(Icons.edit, //Buton tanımlandı
                                      color: Colors.blue),
                                  onPressed: () {
                                    _updateOgrenci(    //Butonun çağırdığı update işlemi
                                      ogrenci['ogrenciID'],
                                      ogrenci['ad'],
                                      ogrenci['soyad'],
                                      ogrenci["bolumID"],
                                    );
                                  },
                                ),
                                IconButton(    //Güncelleme butonunun sağına yerleştirilecek öğrenci silme butonu
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () =>     //Butonun gerçekleştirdiği işlem
                                      _deleteOgrenci(ogrenci['ogrenciID']),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('Veri yok')); //Hata ve öğrenci bilgisi yoksa
                  }
                },
              ),
            ),
          ),
          Container(      //Öğrenci tablosy aşağısında bir container oluşturuldu
            padding: const EdgeInsets.all(10), //Renk ve boşluklar ayarlandı
            color: Colors.blue.shade200,
            child: FutureBuilder<List<dynamic>>(  //Öğrenci sayısını alacağımızdan dolayı container içerisine
              future: _ogrenciler,                //futurebuilder ile oluşturulacak widget koyulacak
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();  //Bekleme durumunda boş kutu
                } else if (snapshot.hasData) {
                  return Text(    //Öğrenci sayısı yazdıran text widgetı
                    'Toplam Kayıtlı Öğrenci: ${snapshot.data!.length}',
                    style: const TextStyle(fontSize: 16),
                  );
                } else {
                  return const Text(    //Kayıtlı öğrenci olmadığı durumda yazdırılacak mesaj
                    'Kayıtlı öğrenci bilgisi yok.',
                    style: TextStyle(fontSize: 16),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( //Öğrenci ekleme işlemi gerçekleştiren buton
        onPressed: _addOgrenci, //Öğrenci ekleme metodunu çağırdı
        child: const Icon(Icons.add), //+ işaretli icon
      ),
    );
  }
}