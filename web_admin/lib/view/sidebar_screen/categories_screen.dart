import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  static const String id = '\categoriesscreen';
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  pickedImage() async {
    // Implement your image picking logic here
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
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
              child: Center(child: Text('Category Image')),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 220,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Category Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            TextButton(onPressed: () {}, child: Text('Cancle')),
            ElevatedButton(onPressed: () {}, child: Text('Submit')),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {}, child: Text('Pick Image')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(thickness: 1, color: Colors.grey),
        ),
      ],
    );
  }
}
