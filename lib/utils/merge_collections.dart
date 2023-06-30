Map<String, List<T>> mergeStringListMaps<T>(
    List<Map<String, List<T>>> maps, List<String> keys) {
  Map<String, List<T>> finalMap = {};
  for (var key in keys) {
    finalMap[key] = [];
    for (var map in maps) {
      finalMap[key]!.addAll(map[key]!);
    }
  }
  return finalMap;
}
