abstract class Series {
  final String title;

  // The date when the series aired its first episode
  final DateTime? premier;

  // The date when the series aired its last episode
  final DateTime? finale;

  Series({required this.title, this.premier, this.finale});
}
