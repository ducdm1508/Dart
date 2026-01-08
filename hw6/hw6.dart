import 'dart:async';

Future<Map<String, dynamic>> fetchUserById(int id) {
  return Future.delayed(Duration(seconds: 7), () {
    if (id == 101) {
      return {'id': 101, 'name': 'User101', 'age': 20};
    } else if (id == 102) {
      return {'id': 102, 'name': 'User102', 'age': 25};
    } else {
      throw Exception('not found');
    }
  });
}

void main() {
  List<int> userId = [101, 102, 103, 104, 105];

  for (int id in userId) {
    fetchUserById(id)
        .then((userData) {
          print('User Data: $userData');
        })
        .catchError((error) {
          print('Error: $error');
        });
  }
}
