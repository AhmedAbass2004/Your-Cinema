import 'package:your_cinema/features/movies/domain/entities/producer.dart';

class ProducerModel extends Producer {
  ProducerModel({required super.id, required super.name, super.logoPath});

  factory ProducerModel.fromJson(Map<String, dynamic> json) {
    return ProducerModel(
      id: json['id'],
      name: json['name'],
      logoPath: json['logo_path'],
    );
  }
}
