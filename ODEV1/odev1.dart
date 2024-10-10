import 'dart:io';

double summation(double num1, double num2) => num1 + num2;
double subtraction(double num1, double num2) => num1- num2;
double multiplication(double num1, double num2) => num1 * num2;
double division(double num1, double num2) => num1 / num2;

double getValue() {
    stdout.write('Sayı giriniz: ');
    String num = stdin.readLineSync() ?? '';

    if (num.toLowerCase() == 'cikis') {
        exit(0);
    } else {
        return double.parse(num);
    }
}
String getOption() {
    stdout.write('Bir işlem girin (Toplama,Cikarma,Carpma,Bolme):');
    String process = (stdin.readLineSync() ?? '').toLowerCase();

    if(process == 'cikis') {
        exit(0);
    }
    return process;
}

void run() {
    print('Hesap makinesinden çıkmak için "CIKIS" yazınız.');

    while (true) {
        double num1 = getValue();
        double num2 = getValue();

        switch (getOption()) {
        case 'toplama':
            print('İşlem sonucu: ${summation(num1, num2)}');
            break;
        case 'cikarma':
            print('İşlem sonucu: ${subtraction(num1, num2)}');
            break;
        case 'carpma':
            print('İşlem sonucu: ${multiplication(num1, num2)}');
            break;
        case 'bolme':
            if (num2 != 0) {
                print('İşlem sonucu: ${division(num1, num2)}');
            } else {
                print('Bir sayı 0 a bölünemez.');
            }
            break;
        default:
            print('Geçersiz işlem girildi.');
        }
    }
}
void main() {
    run();
}
