import 'package:exam/modules/person/data/data_source/remote/person_remote_source.dart';
import 'package:exam/modules/person/data/model/input/person_pagination_input.dart';
import 'package:exam/modules/person/data/model/output/person.dart';
import 'package:exam/modules/person/data/repository/person_repository_interface.dart';

class PersonRepository implements PersonRepositoryInterface {
  const PersonRepository(this._remoteSource);

  final PersonRemoteSource _remoteSource;

  @override
  Future<List<Person>> fetchPersons({
    required PersonPaginationInput input,
  }) async {
    return await _remoteSource.fetchPersons(input: input);
  }
}
