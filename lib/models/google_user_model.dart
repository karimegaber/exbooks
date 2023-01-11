class GoogleUserModel {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final String serverAuthCode;
  final String accessToken;
  final String idToken;

  GoogleUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.serverAuthCode,
    required this.accessToken,
    required this.idToken,
  });
}
