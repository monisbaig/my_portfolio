part of 'util.dart';

class LaunchUrl {
  static Future<void> openResume(String resumeUrl) async {
    final uri = resumeUrl.startsWith('http')
        ? Uri.parse(resumeUrl)
        : Uri.base.resolve(resumeUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not open resume');
    }
  }
}
