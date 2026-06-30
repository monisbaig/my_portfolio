part of 'util.dart';

class ContactFormException implements Exception {
  ContactFormException(this.message);

  final String message;
}

class ContactFormService {
  ContactFormService._();

  static Future<void> submit({
    required String email,
    required String message,
  }) async {
    final response = await http.post(
      Uri.parse(PortfolioConfig.formspreeUrl),
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'email': email.trim(),
        'message': message.trim(),
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ContactFormException('Could not send your message. Please try again.');
    }
  }
}
