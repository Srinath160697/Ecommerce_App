import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:web_admin/controllers/banner_controller.dart';
import 'package:web_admin/view/sidebar_screen/banner_widgets.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String id = '\bannerscreen';
  const UploadBannerScreen({super.key});

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final BannerController _bannerController = BannerController();
  dynamic _image;
  Future<void> pickedImage() async {
    // Implement your image picking logic here
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text('Upload Banner Screen'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(thickness: 1, color: Colors.grey),
        ),
        Row(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: _image != null
                    ? Image.memory(_image)
                    : Text('Category Image'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  await _bannerController.uploadBanner(
                    pickedImage: _image,
                    context: context,
                  );
                },
                child: Text('Save'),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              pickedImage();
            },
            child: Text('Pick Image'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(thickness: 1, color: Colors.grey),
        ),
        BannerWidgets(),
      ],
    );
  }
}
