import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<Event> restartable<Event>() {
  return (events, mapper) => events.switchMap(mapper);
}
