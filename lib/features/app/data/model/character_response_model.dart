class CharacterResponseModel {
  CharacterResponseModel({
    required this.name,
    required this.imageUrl,
    required this.role,
  });
  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) {
    return CharacterResponseModel(
      name: json['character']['name'] as String,
      imageUrl: json['character']['images']['jpg']['image_url'] as String,
      role: json['role'] as String,
    );
  }

  final String name;
  final String imageUrl;
  final String role;
}
