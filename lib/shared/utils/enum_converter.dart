class EnumConverter {
  static String valueToString<T>(T enumValue) {
    String value = enumValue.toString();
    int separatorLocation = value.indexOf('.');
    return value.substring(separatorLocation + 1);
  }

  static T stringToValue<T>(String stringValue, List<T> items)  {
    return items.firstWhere((T item) => valueToString(item) == stringValue);
  }
}