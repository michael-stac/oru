import 'package:image_picker/image_picker.dart';

class OpenCamera {
  final ImagePicker _picker = ImagePicker();

  Future<String> pickCamera({ImageSource? source}) async {
    XFile? image =
        await _picker.pickImage(source: source ?? ImageSource.camera);

    if (image != null) {
      return image.path;
    } else {
      return '';
    }
  }
}
