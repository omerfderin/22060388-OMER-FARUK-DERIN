import 'dart:io';

class Ogrenci {
    String ad;
    String soyad;
    List<double> notlar = [];

    Ogrenci(this.ad, this.soyad);

    double ortalamaHesapla() {
        if (notlar.isEmpty) {
            print('Not bilgisi bulunmadığından ortalama hesaplanamadı');
            return 0.0;
        }
        double toplam = 0;
        notlar.forEach((not) {
            toplam += not;
        });
        return toplam / notlar.length;
    }

    void notEkle(double not) {
        notlar.add(not);
        print('Not başarıyla eklendi.');
    }
}
    Ogrenci ogrenciOlustur() {
        stdout.write('Öğrenci Adı:');
        String? ad = stdin.readLineSync();

        stdout.write('Öğrenci Soyadı:');
        String? soyad = stdin.readLineSync();

        return Ogrenci(ad ?? '', soyad ?? '');
    }

    void calistir(Ogrenci ogrenci) {
      while (true) {
        stdout.write('Eklenecek notu girin (bitirmek için "bitir" yazınız): ');
        String? girdi = (stdin.readLineSync() ?? '').toLowerCase();

        if (girdi == 'bitir') {
            break;
        }

        double? not = double.tryParse(girdi);
        if (not != null && not >= 0 && not <= 100) {
            ogrenci.notEkle(not);
            double ortalama = ogrenci.ortalamaHesapla();
            if (ortalama > 0) {
                print('Öğrencinin Not Ortalaması: $ortalama');
            }
        } else {
            print('Lütfen geçerli bir not değeri girin.');
        }
    }
    }

void main() {
    Ogrenci ogrenci = ogrenciOlustur();
    calistir(ogrenci);
}