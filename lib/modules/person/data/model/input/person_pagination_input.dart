import 'package:equatable/equatable.dart';

class PersonPaginationInput extends Equatable {
  const PersonPaginationInput({
    this.quantity = 0,
    this.seed = 0,
  });

  final int quantity;
  final int seed;

  @override
  List<Object?> get props => [quantity, seed];
}
