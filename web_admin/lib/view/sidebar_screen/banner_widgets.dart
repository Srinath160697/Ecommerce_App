import 'package:flutter/material.dart';
import 'package:web_admin/controllers/banner_controller.dart';
import 'package:web_admin/models/banner_model.dart';

class BannerWidgets extends StatefulWidget {
  const BannerWidgets({super.key});

  @override
  State<BannerWidgets> createState() => _BannerWidgetsState();
}

class _BannerWidgetsState extends State<BannerWidgets> {
  late Future<List<BannerModel>> futureBanners;

  @override
  void initState() {
    super.initState();
    futureBanners = BannerController().fetchBanners();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureBanners,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data!.isEmpty || !snapshot.hasData) {
          return Center(child: Text('No banners found'));
        } else {
          final banners = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: banners.length,
            itemBuilder: (context, index) {
              final banner = banners[index];
              return Image.network(banner.image, height: 100, width: 100);
            },
          );
        }
      },
    );
  }
}
