class Planets {
  String position;
  String name;
  String image;
  String velocity;
  String distance;
  String description;

  Planets({
    required this.position,
    required this.name,
    required this.image,
    required this.velocity,
    required this.distance,
    required this.description,
  });

  factory Planets.fromJson({required Map json}) => Planets(
        position: json["position"],
        name: json["name"],
        image: json["image"],
        velocity: json["velocity"],
        distance: json["distance"],
        description: json["description"],
      );
}
