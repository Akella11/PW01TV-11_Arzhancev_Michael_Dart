import 'dart:io';

double inputDouble(String prompt) {
  print(prompt);
  String input = stdin.readLineSync()!.trim();
  return double.parse(input);
}

void task2() {
  print("Завдання 2:");
  double Hg = inputDouble("Вміст водню, %");
  double Cg = inputDouble("Вміст вуглецю, %");
  double Og = inputDouble("Вміст кисню, %");
  double Sg = inputDouble("Вміст сірки, %");
  double Qdaf = inputDouble("Нижча теплота згоряння горючої маси мазуту, МДж/кг");
  double Wg = inputDouble("Вологість робочої маси палива, %;");
  double Ag = inputDouble("Зольність сухої маси, %;");
  double Vg = inputDouble("Вміст ванадію, мг/кг;");


  // Обчислення складу робочої маси мазути
  double Cp = Cg * (100 - Wg - Ag) / 100;
  double Hp = Hg * (100 - Wg - Ag) / 100;
  double Op = Og * (100 - Wg - Ag) / 100;
  double Sp = Sg * (100 - Wg * 0.1 - Ag * 0.1) / 100;
  double Ap = Ag * (100 - Wg) / 100;
  double Vp = Vg * (100 - Wg) / 100;
  double Qp = Qdaf * ((100 - Wg - Ap) / 100) - 0.025 * Wg;

  // Вивід результату
  print('\nРезультати: \n' +
      'Склад горючої маси мазуту: H^Г=$Hg%, C^Г=$Cg%, S^Г=$Sg%, O^Г=$Og%, V^Г=$Vg мг/кг, W^Г=$Wg%, A^Г=$Ag%;' +
      'та нижчою теплотою згоряння Qi^daf=$QdafМД/кг:\n' +
      'Склад робочої маси мазуту: H^Р=$Hp%, C^Р=$Cp%, S^Р=$Sp%, O^Р=$Op%, V^Р=$Vp мг/кг, A^Р=$Ap%;\n' +
      'Нижча теплота згоряння мазуту на робочу масу для робочої маси: $Qp Мдж/кг.');
}

void main() {
  task2();
}
