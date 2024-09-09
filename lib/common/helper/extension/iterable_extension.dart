extension IterableExtensions<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E element) f) {
    int index = 0;
    return map((e) => f(index++, e));
  }
}

extension EnumByValue<T extends Enum> on Iterable<T> {
  T? byValue(String? valueToFind) {
    if (valueToFind == null) return null;

    for (final enumItem in this) {
      if (enumItem.name.toLowerCase() == valueToFind.toLowerCase()) {
        return enumItem;
      }
    }

    return null;
  }
}
