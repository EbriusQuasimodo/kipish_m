class Constants {
  static const String baseUrl =
      "${IS_DEV ? "" : ""}";
  static const String wsUrl =
      "${IS_DEV ? "" : ""}";


  static int CALENDAR = -2;
  static int ROADMAPS = -3;
  static int PRIORITIES = -4;
  static int NEWS = -5;
  static const bool IS_DEV = true;
}