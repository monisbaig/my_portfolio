part of 'util.dart';

class LaunchUrl {
  static Future<void> openWhatsApp(String phone) async {
    final Uri whatsappUri = Uri.parse("https://wa.me/$phone");
    if (!await launchUrl(whatsappUri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not open WhatsApp");
    }
  }

  static Future<void> makePhoneCall(String phone) async {
    final Uri telUri = Uri(scheme: "tel", path: phone);
    if (!await launchUrl(telUri)) {
      throw Exception("Could not make phone call");
    }
  }
}
