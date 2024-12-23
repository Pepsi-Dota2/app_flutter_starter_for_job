import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.image,
    required this.title,
    this.rating,
    this.reviews,
    required this.price,
    required this.desc,
  });
  
  final String image;
  final String title;
  final String desc;
  final double? rating;
  final int? reviews;
  final double price;

  @override
  Widget build(BuildContext context) {
       final size = MediaQuery.of(context).size;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2, 
            child: Stack(
              children: [
                SizedBox(
                  width: size.width * 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/44803.jpg",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3, 
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${rating ?? 0}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '| ${reviews ?? 0}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  const Spacer(),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}