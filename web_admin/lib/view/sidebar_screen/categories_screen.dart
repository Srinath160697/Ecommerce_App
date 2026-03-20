import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:web_admin/controllers/category_controller.dart';

class CategoriesScreen extends StatefulWidget {
  static const String id = 'categoriesscreen';
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CategoryController _categoryController = CategoryController();
  late String categoryName;
  dynamic _image;
  dynamic _bannerimage;
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

  Future<void> pickedBannerImage() async {
    // Implement your image picking logic here
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _bannerimage = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text('Categories Screen'),
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
                child: SizedBox(
                  width: 220,
                  child: TextFormField(
                    onChanged: (value) {
                      categoryName = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a category name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Category Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              TextButton(onPressed: () {}, child: Text('Cancle')),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _categoryController.uploadCategory(
                      pickedImage: _image,
                      pickedBanner: _bannerimage,
                      namee: categoryName,
                      context: context,
                    );
                  }
                },
                child: Text('Save'),
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
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: _bannerimage != null
                  ? Image.memory(_bannerimage)
                  : Text('Category banner'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                pickedBannerImage();
              },
              child: Text('Pick banner'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(thickness: 1, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
