import 'dart:convert';
import 'dart:io';

class Student {
  String name;
  double tuitionFee;
  List<double> otherFees;
  double scholarship;

  Student({
    required this.name,
    required this.tuitionFee,
    required this.otherFees,
    required this.scholarship,
  });

  bool isValid() {
    if (scholarship < 0) return false;
    for (var fee in otherFees) {
      if (fee > tuitionFee) return false;
    }
    return true;
  }

  double get netTuition {
    final sumOther = otherFees.fold(0.0, (a, b) => a + b);
    return tuitionFee - scholarship + sumOther;
  }

  double get educationTax {
    final net = netTuition;
    if (net > 15000) return net * 0.10;
    if (net >= 7000) return net * 0.05;
    return net * 0.02;
  }

  double projectedAnnualCost(double monthlyLiving) {
    return netTuition + monthlyLiving * 12 + educationTax;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'tuitionFee': tuitionFee,
      'otherFees': otherFees,
      'scholarship': scholarship,
    };
  }

  /// Serialize + GZIP
  List<int> serializeAndCompress() {
    final jsonStr = jsonEncode(toMap());
    return gzip.encode(utf8.encode(jsonStr));
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'],
      tuitionFee: (map['tuitionFee'] as num).toDouble(),
      scholarship: (map['scholarship'] as num).toDouble(),
      otherFees: (map['otherFees'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }

  static Student decompressAndDeserialize(List<int> data) {
    final decoded = utf8.decode(gzip.decode(data));
    final map = jsonDecode(decoded);
    return Student.fromMap(map);
  }

  @override
  String toString() {
    return 'Student(name: $name, netTuition: ${netTuition.toStringAsFixed(2)})';
  }
}
