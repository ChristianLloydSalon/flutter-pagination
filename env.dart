import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:exam/common/helper/extension/string_extension.dart';

void main() {
  final env = DotEnv()..load();

  final variables = [
    'API_URL',
  ];

  const filename = 'lib/config/environment.dart';

  final buffer = StringBuffer()..write('class AppConfig {\n');

  for (final variable in variables) {
    final value = env[variable] ?? Platform.environment[variable] ?? '';

    buffer.write(
      "  static const String ${variable.snakeToCamelCase()} = '$value';\n",
    );
  }

  buffer.write('}\n');

  File(filename).writeAsString(buffer.toString());
}
