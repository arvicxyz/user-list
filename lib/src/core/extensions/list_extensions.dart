extension RemoveDuplicates<T, Id> on List<T> {
  List<T> removeDuplicates([Id Function(T item)? id, bool inplace = true]) {
    final ids = <Id>{};
    var list = inplace ? this : List<T>.from(this);
    list.retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }
}
