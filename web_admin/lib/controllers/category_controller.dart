import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:web_admin/global_variable.dart';
import 'package:web_admin/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:web_admin/services/servides.dart';

class CategoryController {
  Future<void> uploadCategory({
    required dynamic pickedImage,
    required dynamic pickedBanner,
    required String namee,
    required context,
  }) async {
    try {
      // Implement your upload logic here using pickedImage and pickedBanner
      // For example, you can use the cloudinary_public package to upload images to Cloudinary
      final cloudinary = CloudinaryPublic('dzcgxmet2', 'ia1lk9mz');

      // Upload the category image
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedImage,
          identifier: 'pickedImage',
          folder: 'categoryImages',
        ),
      );
      String image = imageResponse.secureUrl;
      // Upload the category banner
      CloudinaryResponse bannerResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedBanner,
          identifier: 'pickedBanner',
          folder: 'categoryBanners',
        ),
      );
      String banner = bannerResponse.secureUrl;

      Category category = Category(
        id: '',
        name: namee, // Replace with actual category name
        image: image,
        banner: banner,
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/category'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: category.toJson(),
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showsnackbar(context, 'Category uploaded successfully');
        },
      );
    } catch (e) {
      // Handle any errors that occur during the upload process
      print('Error uploading category: $e');
    }
  }
}
