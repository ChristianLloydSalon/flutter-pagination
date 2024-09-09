import 'package:exam/config/http_client.dart';
import 'package:exam/modules/person/data/data_source/remote/person_remote_source.dart';
import 'package:exam/modules/person/data/repository/person_repository.dart';

final personRemoteSource = PersonRemoteSource(httpClient);
final personRepository = PersonRepository(personRemoteSource);
