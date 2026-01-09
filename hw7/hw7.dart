Future<int> cong(int a, int b) async {
  return Future.delayed(Duration(seconds: 2), () {
    return a + b;
  });
}

Future<int> tru(int a, int b) async {
  return Future.delayed(Duration(seconds: 2), () {
    return a - b;
  });
}

Future<int> nhan(int a, int b) async {
  return Future.delayed(Duration(seconds: 4), () {
    return a * b;
  });
}

Future<double> chia(int a, int b) async {
  return Future.delayed(Duration(seconds: 2), () {
    if (b == 0) {
      throw Exception("Cannot divide by zero");
    }
    return a / b;
  });
}

void main() async {
  final tong = await cong(10, 5);
  print('Tổng = $tong');

  final hieu = await tru(10, 5);
  print('Hiệu = $hieu');

  final tich = await nhan(10, 5);
  print('Tích = $tich');
  try {
    final thuong = await chia(10, 3);
    print('Thương = $thuong');
  } catch (e) {
    print(e);
  }
}
