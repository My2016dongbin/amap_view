part of amap_search;

class AmapSearch {
  static const MethodChannel _channel = const MethodChannel('plugins.muka.com/amap_search');

  /// POI 关键字查询
  ///
  /// keyword [查询关键字，多个关键字用“|”分割]
  ///
  /// city [不强制传递 一般来说不传拿不到数据]
  ///
  /// location [如果设置，在此location附近优先返回搜索关键词信息]
  ///
  /// 请求多次只返回一次 所以尽量请求时给个loading
  static Future<List<SearchPoi>> poiKeywordsSearch(
    String keywords, {
    String city,
    LatLng location,
  }) async {
    dynamic pois = await _channel.invokeMethod('poiKeywordsSearch', {
      'keywords': keywords,
      'city': city,
      'latitude': location?.latitude,
      'longitude': location?.longitude,
    });
    return List<SearchPoi>.from(pois.map((i) => SearchPoi.fromJson(i)));
  }

  /// 输入提示查询
  ///
  /// keyword [查询关键字]
  ///
  /// city [不强制传递 一般来说不传拿不到数据]
  ///
  /// location [如果设置，在此location附近优先返回搜索关键词信息]
  ///
  /// 请求多次只返回一次 所以尽量请求时给个loading
  static Future<List<InputTip>> inputTipsSearch(
    String keywords, {
    String city,
    LatLng location,
  }) async {
    dynamic inputTips = await _channel.invokeMethod('inputTipsSearch', {
      'keywords': keywords,
      'city': city,
      'location': location != null ? '${location.longitude},${location.latitude}' : null,
    });
    return List<InputTip>.from(inputTips.map((i) => InputTip.fromJson(i)));
  }
}
