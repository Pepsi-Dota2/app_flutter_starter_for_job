import 'package:app_flutter_starter_for_job/src/core/utils/custom_solution_break_character_util.dart';
import 'package:flutter/material.dart';

class ProductCardDetail extends StatelessWidget {
  final String desc;
  final String title;
  final String location;
  final String imageUrl;
  final double price;
  final String followerCount;
  final String itemCount;
  final VoidCallback? onBuyNow;
  final VoidCallback? onMakeOffer;
  final String? sellerImageUrl;
  final bool isVerified;

  const ProductCardDetail({
    Key? key,
    required this.desc,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.followerCount,
    required this.itemCount,
    this.onBuyNow,
    this.onMakeOffer,
    this.sellerImageUrl,
    this.isVerified = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            height: size.height * 0.25,
            width: size.width * 1,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/44803.jpg",
                fit: BoxFit.cover,
                height: size.height * 0.25,
                width: size.width * 1,
              );
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Seller Info
              _buildSellerInfo(),

              const SizedBox(height: 8),

              // Product Info
              Text(
                desc,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 4),

              // Location and Status
              _buildLocationAndStatus(),

              const SizedBox(height: 8),

              // Price and Buttons
              _buildPriceAndButtons(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSellerInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: sellerImageUrl != null ? NetworkImage(sellerImageUrl!) : null,
          child: sellerImageUrl == null ? const Icon(Icons.person) : null,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextUtil.wrapText(title, 26),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                '$followerCount fans • $itemCount items',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter, 
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Message seller'),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationAndStatus() {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          location,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'New with tags',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'includes Buyer Protection',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextButton(
              onPressed: onMakeOffer,
              child: const Text('Make an offer'),
              style: TextButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                foregroundColor: Colors.blue,
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: onBuyNow,
              child: const Text('Buy now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
