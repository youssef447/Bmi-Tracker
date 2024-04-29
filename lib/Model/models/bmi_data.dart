import 'package:cloud_firestore/cloud_firestore.dart';

class BmiData {
  final Timestamp currentTime;
  final double weight, height;
  final int age;
  final String status;
  final double score;

  BmiData({
    required this.score,
    required this.currentTime,
    required this.weight,
    required this.height,
    required this.age,
    required this.status,
  });

  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      currentTime:json['current_time'] as Timestamp ,
    weight: json['weight'],
      height: json['height'],
      age: json['age'],
      status: json['status'],
      score: json['score'],
    );
  }

  Map<String,dynamic> toJson() {
    return {
      'current_time': currentTime,
      'weight': weight,
      'height': height,
      'age': age,
      'status': status,
      'score': score,
    };
  }
}
