import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class carouselscrolls extends StatelessWidget {
  const carouselscrolls({super.key});

  static const List<String> carouselImages = [
    'https://images.hindustantimes.com/img/2024/01/12/550x309/amazon-republic-day-sale-2024-seo-image-dd1_1705041587477_1705041599337.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: carouselImages.map(
            (i) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              i,
              fit: BoxFit.cover,
              height: 200,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
