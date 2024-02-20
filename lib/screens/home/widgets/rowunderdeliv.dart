import 'package:amazon_clone/screens/categoryproducts/categorywiseproduct.dart';
import 'package:flutter/material.dart';

class underdelivrow extends StatelessWidget {
  const underdelivrow({super.key});

  void navigateTocategory(BuildContext context , String category){
    Navigator.pushNamed(context, categorywiseproduct.routeName , arguments: category);
  }

  @override
  Widget build(BuildContext context) {
     const List<Map<String, String>> categoryImages = [
      {
        'title': 'Mobiles',
        'image': 'lib/assets/mobiles.jpeg',
      },
      {
        'title': 'Essentials',
        'image': 'lib/assets/essentials.jpeg',
      },
      {
        'title': 'Appliances',
        'image': 'lib/assets/appliances.jpeg',
      },
      {
        'title': 'Books',
        'image': 'lib/assets/books.jpeg',
      },
      {
        'title': 'Fashion',
        'image': 'lib/assets/fashion.jpeg',
      },
    ];
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: categoryImages.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
          return InkWell(
            onTap:() => navigateTocategory(context,
                categoryImages[index]['title']!,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  categoryImages[index]['title']!,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
          }
      ),
    );
  }
}
