import 'package:equatable/equatable.dart';

class PersonPaginationInput extends Equatable {
  const PersonPaginationInput({
    this.quantity = 0,
    this.seed = 0,
  });

  final int quantity;
  final int seed;

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'seed': seed,
    };
  }

  @override
  List<Object?> get props => [quantity, seed];
}
