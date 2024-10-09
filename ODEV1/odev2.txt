import 'dart:io';

void printEven(List<int> numbers) {
    List<int> numlist = [];
    numbers.forEach((number) {
        if (number % 2 == 0)
            numlist.add(number);
    });
    if (numlist.isEmpty) {
        print('Listede çift sayı yok.');
    } else {
        print('Listedeki çift sayılar: $numlist');
    }
}

List<int> getList() {
    print('Listeye eklenecek sayıyı giriniz (İşlemi bitirmek için bitir yazınız.): ');
    List<int> Liste = [];
    while(true) {
        String? num = stdin.readLineSync();
        if(num == '' || num == null) {
            print('Lütfen geçerli bir sayı giriniz.');
            continue;
        } else if (num.toLowerCase() == 'bitir') {
            return Liste;
        }
        Liste.add(int.parse(num));
    }
}
void main() {
    List<int> numbers = getList();
    printEven(numbers);
}