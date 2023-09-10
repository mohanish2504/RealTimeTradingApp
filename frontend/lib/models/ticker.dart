import 'package:equatable/equatable.dart';

class Ticker extends Equatable {
  final String? name;
  final double? price;
  final double? quantity;
  final DateTime? timestamp;

  const Ticker({this.name, this.price, this.quantity, this.timestamp});

  factory Ticker.fromJson(Map<String, dynamic> json) => Ticker(
        name: json['s'] as String?,
        price: json['p']!=null ? double.tryParse(json['p']) : null,
        quantity: json['q']!=null ? double.tryParse(json['q']) : null,
        timestamp: json['T']!=null ? DateTime.fromMillisecondsSinceEpoch(json['T']).toLocal(): null,
      );

  Map<String, dynamic> toJson() => {
        's': name,
        'p': price,
        'q': quantity,
        'T': timestamp,
      };

  Ticker copyWith({
    String? name,
    double? price,
    double? quantity,
   DateTime? timestamp,
  }) {
    return Ticker(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, price, quantity, timestamp];
}
