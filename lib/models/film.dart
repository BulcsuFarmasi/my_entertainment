abstract class Film {

  final int id;

  final String title;

  // The date when the film first released anywhere
  final DateTime premier;

  Film({required this.id, required this.title, required this.premier});
}
