import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:web_admin/global_variable.dart';
import 'package:web_admin/models/banner_model.dart';
import 'package:http/http.dart' as http;
import 'package:web_admin/services/servides.dart';

class BannerController {
  uploadBanner({required dynamic pickedImage, required context}) async {
    try {
      final cloudinary = CloudinaryPublic('dzcgxmet2', 'ia1lk9mz');

      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedImage,
          identifier: 'pickedImage',
          folder: 'banners',
        ),
      );
      String image = imageResponse.secureUrl;

      BannerModel banner = BannerModel(id: '', image: image);

      http.Response response = await http.post(
        Uri.parse('$uri/api/banner'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: banner.toJson(),
      );

      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showsnackbar(context, 'Banner uploaded successfully');
        },
      );
    } catch (e) {
      print('Error uploading banner: $e');
    }
  }

  Future<List<BannerModel>> fetchBanners() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/banner'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<BannerModel> banners = data
            .map((banner) => BannerModel.fromJson(banner))
            .toList();
        return banners;
      } else {
        throw Exception('Failed to load banners');
      }
    } catch (e) {
      print('Error fetching banners: $e');
      return [];
    }
  }
}
