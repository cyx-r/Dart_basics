// ignore_for_file: unused_local_variable
import "dart:math";

class DelimetersCalculator {
  List<int> list = [];

  int nod(int a, int b) {
    //нахождение НОД
    int buf = 0;
    if (a < b) {
      buf = a;
      a = b;
      b = buf;
    }
    while (b > 1) {
      a %= b;
      buf = a;
      a = b;
      b = buf;
    }
    return a;
  }

  int nok(int a, int b) {
    //Нахожение НОК
    return ((a * b) ~/ nod(a, b));
  }

  List<int> multiplier(int a) {
    //Разбиваем числа на множители
    if (a % 2 == 0) {
      a = a ~/ 2;
      list += [2];
      multiplier(a);
    } else if (a % 3 == 0) {
      a = a ~/ 3;
      list += [3];
      multiplier(a);
    } else {
      list += [a, 1];
    }
    return list;
  }
}

class Point {
  double x;
  double y;
  double z;
  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.single() {
    return Point(1, 1, 1);
  }

  double distanceTo(Point another) {
    //Расстояние до точки
    return sqrt((another.x - x) * (another.x - x) +
        (another.y - y) * (another.y - y) +
        (another.z - z) * (another.z - z));
  }
}

double power(double value, double exponent) {
  var buf = value;
  for (int i = 0; i < exponent; i++) {
    //мой метод, как pow из dart:math
    value *= buf;
  }
  return value;
}

class MyMath {
  String twoToTen(int value) {
    String s = '';
    while (value >= 1) {
      s = (value % 2).toString() + s;
      value = value ~/ 2;
    }
    return s;
  }

  num tenToTwo(String string) {
    //Перевод в двоичную систему из 10-ной
    num value = 0;
    for (int i = 0; i < string.length; i++) {
      value += pow(int.parse(string[i]), string.length - i - 1);
    }
    return value;
  }
}

double numParce(double value, int exponent) {
  double x = value / exponent;
  for (int i = 0; i < 10000; i++) {
    try {
      x = (1 / exponent) * ((exponent - 1) * x) +
          value / power(x, exponent - 1);
    } on IntegerDivisionByZeroException {
      throw 'делить на ноль нельзя';
    }
  }
  try {
    return x.roundToDouble();
  } on FormatException {
    throw 'Формат не соответствует нужному';
  }
}

extension on num {
  // ignore: unused_element
  double numParce(double value, int exponent) {
    double x = value / exponent;
    for (int i = 0; i < 10000; i++) {
      try {
        x = (1 / exponent) * ((exponent - 1) * x) +
            value / power(x, exponent - 1);
      } on IntegerDivisionByZeroException {
        throw 'делить на ноль нельзя';
      }
    }
    try {
      return x.roundToDouble();
    } on FormatException {
      throw 'Формат не соответствует нужному';
    }
  }
}

Set<int> Converter(List<String> stringList) {
  Set<int> intSet = {};
  for (int i = 0; i < stringList.length; i++) {
    // Преобразуем List строк в Set чисел
    switch (stringList[i]) {
      case 'zero':
        intSet.add(1);
        break;
      case 'one':
        intSet.add(2);
        break;
      case 'three':
        intSet.add(3);
        break;
      case 'four':
        intSet.add(4);
        break;
      case 'five':
        intSet.add(5);
        break;
      case 'six':
        intSet.add(6);
        break;
      case 'seven':
        intSet.add(7);
        break;
      case 'eight':
        intSet.add(8);
        break;
      case 'nine':
        intSet.add(9);
        break;
      default:
        break;
    }
  }
  return intSet;
}

Map mapFromList(List<String> list) {
  var buf = 0;
  Map<String, int> map = {};

  for (int i = 0; i < list.length; i++) {
    buf = 0;
    for (int j = 0; j < list.length; j++) {
      if (list[i] == list[j]) buf++;
    }
    map.addAll({list[i]: buf});
  }
  return map;
}

class User {
  String email;
  User(this.email);
}

class AdminUser extends User with GetMailSystem {
  AdminUser(
    String email,
  ) : super(email);
}

class GeneralUser extends User with GetMailSystem {
  GeneralUser(String email) : super(email);
}

mixin GetMailSystem on User {
  String getMail() {
    List<String> list = super.email.split('@');
    return list[1];
  }
}

class UserManager<T extends User> {
  List<T> userList = [];
  void userAdd(T user) {
    this.userList.add(user);
  }

  void userDel(T user) {
    this.userList.remove(user);
  }

  void getUsersMail() {
    for (T element in userList) {
      if (element is User && element is! AdminUser) {
        print(element.email);
      }
      if (element is AdminUser) {
        print(element.getMail());
      }
    }
  }
}

List<num> findInString(String string) {
  //Поиск чисел в строке
  List<num> numList = [];
  List<String> stringList = string.split(" ");
  for (var element in stringList) {
    if (element is int) {
      numList += [num.parse(element)];
    }
  }
  return numList;
}

void main() {
  // print(DelimetersCalculator().nod(15, 20)); //expect:5

  // print(DelimetersCalculator().nok(15, 20)); //expect:60

  //print(MyMath().twoToTen(2)); //expect: 10

  print(MyMath().tenToTwo('10')); //expect: 2

  // print(mapFromList(['3', 'test', '1', 'code', 'test', '1', '3']));

  // print(Converter(['one', 'test', 'four', 'mycode', '123', 'seven']));

//   Point firstPoint = new Point(-5, 4, 13);
//   print(firstPoint.distanceTo(Point(4, 15, 3))); //expect: ~17,378

//   print(numParce(1024, 2)); //expect: 32

  // UserManager manager = new UserManager();
  // manager.userAdd(User('ema@mail.com'));
  // manager.userAdd(AdminUser('admin@mail.com'));
  // manager.getUsersMail();
}
