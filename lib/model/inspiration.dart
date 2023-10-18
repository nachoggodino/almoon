class Inspiration {
  final int id;
  final String text;

  Inspiration({required this.text, required this.id});

  get image => "assets/$id.jpg";

}
