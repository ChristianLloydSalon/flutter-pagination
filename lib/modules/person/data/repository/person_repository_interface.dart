import 'package:exam/modules/person/data/model/input/person_pagination_input.dart';
import 'package:exam/modules/person/data/model/output/person.dart';

abstract interface class PersonRepositoryInterface {
  Future<List<Person>> fetchPersons({required PersonPaginationInput input});
}
