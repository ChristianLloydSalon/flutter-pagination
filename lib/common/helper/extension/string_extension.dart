import 'package:exam/common/helper/extension/iterable_extension.dart';

extension StringExtension on String {
  String snakeToCamelCase() {
    return toLowerCase().split('_').mapIndexed((index, element) {
      if (index == 0) {
        return element;
      } else {
        return element[0].toUpperCase() + element.substring(1);
      }
    }).join('');
  }
}
