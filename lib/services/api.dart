import 'dart:convert';
import 'package:http/http.dart' as http; //Gerekli paketler import edildi

class ApiService {
  final String baseUrl = "http://localhost:3000";

  Future<List<dynamic>> getOgrenciler() async { //Future tipi dinamik işlemlerde geç gelen veriler döndürmek için kullanılır.
    final response = await http.get(Uri.parse('$baseUrl/ogrenciler')); //Öğrencilerin veri tabanından
    if (response.statusCode == 200) {                                  //getirilme işlemi.
      return json.decode(response.body);        //Statuscode 200 durumunda veriler alınmış demektir.
    } else {
      throw Exception('Veriler alınamadı: ${response.statusCode}');
    }
  }
  Future<void> addOgrenci(Map<String, dynamic> data) async { //Veri tabanına yeni öğrenci ekleme işlemi
    final response = await http.post(
      Uri.parse('$baseUrl/ogrenciler'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'}, //Yollanan öğrenci dosyasının tipi belirtildi.
    );
    if (response.statusCode != 200) {
      throw Exception('Öğrenci eklenemedi: ${response.statusCode}');
    }
  }
  Future<void> updateOgrenci(int id, Map<String, dynamic> data) async {
    final response = await http.put(           //Öğrenci güncelleme işlemi isteği
      Uri.parse('$baseUrl/ogrenciler/$id'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Öğrenci güncellenemedi: ${response.statusCode}');
    }
  }
  Future<void> deleteOgrenci(int id) async {    //Öğrenci silme isteği
    final response = await http.delete(Uri.parse('$baseUrl/ogrenciler/$id'));
    if (response.statusCode != 200) {
      throw Exception('Öğrenci silinemedi: ${response.statusCode}');
    }
  }
}