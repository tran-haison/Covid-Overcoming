extension ListExtension<T> on List<T> {
  List<T> update(T t) {
    try {
      final int pos = indexOf(t);
      final List<T> list = <T>[];
      list.add(t);
      replaceRange(pos, pos + 1, list);
      return this;
    } catch (e) {
      return this;
    }
  }
}
