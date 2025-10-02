import 'package:path/path.dart' as path;

class AssetUtils {
  static String getPartialPath(String completePath) {
    return path.dirname(completePath);
  }
}
