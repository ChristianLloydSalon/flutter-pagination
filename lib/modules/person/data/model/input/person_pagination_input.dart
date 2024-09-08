import 'package:equatable/equatable.dart';

class PersonPaginationInput extends Equatable {
  const PersonPaginationInput({
    this.quantity = 0,
  });

  final int quantity;

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
    };
  }

  @override
  List<Object?> get props => [quantity];
}
