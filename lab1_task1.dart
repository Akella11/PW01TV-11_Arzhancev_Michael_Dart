import 'dart:io';

double inputDouble(String prompt) {
  print(prompt);
  String input = stdin.readLineSync()!.trim();
  return double.parse(input);
}

void task1() {
  print('Завдання 1\n');
  // Вводимо значення, необхідні для розрахунку
  double Hp = inputDouble("Вміст водню, %");
  double Cp = inputDouble("Вміст вуглецю, %");
  double Sp = inputDouble("Вміст сірки, %");
  double Np = inputDouble("Вміст азоту, %");
  double Op = inputDouble("Вміст кисню, %");
  double Wp = inputDouble("Вміст вологи, %");
  double Ap = inputDouble("Вміст попелу, %");

 
  // Коефіцієнт переходу від робочої до сухої маси
  double Krs = 100 / (100 - Wp);
  
  // Коефіцієнт переходу коефіцієнт переходу від робочої до горючої
  double Krg = 100 / (100 - Wp - Ap);

  // Обчислення складу сухої маси палива
  double Hc = Hp * Krs;
  double Cc = Cp * Krs;
  double Sc = Sp * Krs;
  double Nc = Np * Krs;
  double Oc = Op * Krs;
  double Ac = Ap * Krs;

  // Обчислення горючої маси палива
  double Hg = Hp * Krg;
  double Cg = Cp * Krg;
  double Sg = Sp * Krg;
  double Ng = Np * Krg;
  double Og = Op * Krg;

  // Обчислення нижчої теплота згоряння для робочої маси
  double Qrn = ((339 * Cp + 1030 * Hp - 108.8 * (Op - Sp) - 25 * Wp) / 1000);
  // Обчислення нижчої теплота згоряння для сухої маси
  double Qsn = ((Qrn + 0.025 * Wp) * 100 / (100 - Wp));
  // Обчислення нижчої теплота згоряння для горючої маси
  double Qhn = ((Qrn + 0.025 * Wp) * 100 / (100 - Wp - Ap));

  //Вивід результатів
  print('\nРезультати:\n' +
      'Компонентний склад - H^P: $Hp%, C^P: $Cp%, S^P: $Sp%, N^P: $Np%, O^P: $Op%, W^P: $Wp%, A^P: $Ap% \n' +
      'Коефіцієнт переходу від робочої до сухої маси -  $Krs \n' +
      'Коефіцієнт переходу від робочої до горючої маси -  $Krg \n' +
      'Склад сухої маси палива -  H^C: $Hc%, C^C: $Cc%, S^C: $Sc%, N^C: $Nc%, O^C: $Oc%, A^C: $Ac% \n' +
      'Склад горючої маси палива - H^G: $Hg%, C^G: $Cg%, S^G: $Sg%, N^G: $Ng%, O^G: $Og% \n' +
      'Нижча теплота згоряння для робочої маси - $Qrn МДж/кг \n' +
      'Нижча теплота згоряння для сухої маси - $Qsn МДж/кг \n' +
      'Нижча теплота згоряння для горючої маси - $Qhn МДж/кг');
}

void main() {
  task1();
}
