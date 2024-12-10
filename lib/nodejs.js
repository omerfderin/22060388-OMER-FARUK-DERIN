const express = require('express'); //Gerekli kütüphaneler import edildi
const mysql = require('mysql');
const cors = require('cors');

const app = express();
app.use(cors());  

app.use(express.json()); //Json verileri .body formatına dönüştürülür

const db = mysql.createConnection({ //mysql veritabanı bağlantısı oluşturma
    host: 'localhost',
    user: 'root',
    password: 'OD_22111971',
    database: 'ogrenciler'
});

db.connect(err => {   //Veri tabanına bağlanma işlemi (hata kontrolü)
    if (err) throw err;
    console.log('MySQL bağlandı');
});

app.get('/', (req, res) => {    //"localhost/" anasayfamızda hoş geldiniz mesajı.
    res.send('Ana sayfaya hoş geldiniz!');
});

app.get('/ogrenciler', (req, res) => {  //"localhost/ogrenciler" sayfamızda tüm öğrencileri listeleme sql sorgusu
    db.query('SELECT * FROM Ogrenci', (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.post('/ogrenciler', (req, res) => { //"localhost/ogrenciler" sayfamıza yeni öğrenci eklemek için sql sorgusu
    const { ad, soyad, bolumID } = req.body; 
    db.query('INSERT INTO Ogrenci (ad, soyad, bolumID) VALUES (?, ?, ?)', [ad, soyad, bolumID], (err) => {
        if (err) throw err;
        res.json({ message: 'Öğrenci eklendi' });
    });
});

app.put('/ogrenciler/:id', (req, res) => { ////"localhost/ogrenciler/id" sayfamızdaki öğrenci bilgilerini güncelleme sql sorgusu
    const { ad, soyad, bolumID } = req.body;
    db.query('UPDATE Ogrenci SET ad = ?, soyad = ?, bolumID = ? WHERE ogrenciID = ?', [ad, soyad, bolumID, req.params.id], (err) => {
        if (err) throw err;
        res.json({ message: 'Öğrenci güncellendi' });
    });
});

app.delete('/ogrenciler/:id', (req, res) => {  ////"localhost/ogrenciler" sayfasında kayıtlı öğrenci silme sql sorgusu
    db.query('DELETE FROM Ogrenci WHERE ogrenciID = ?', [req.params.id], (err) => {
        if (err) throw err;
        res.json({ message: 'Öğrenci silindi' });
    });
});

app.listen(3000); //Sunucu başlatma işlemi