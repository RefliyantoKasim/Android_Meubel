import 'package:flutter/material.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel data;
  final VoidCallback onCartButton;

  const ProductCard({
    super.key,
    required this.data,
    required this.onCartButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.card),
          borderRadius: BorderRadius.circular(19),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.disabled.withOpacity(0.4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                data.image,
                width: 68,
                height: 68,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
            ),
          ),
          const Spacer(),
          Text(
            data.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SpaceHeight(8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Rp ${data.price}', // atau pakai NumberFormat
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onCartButton,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    color: AppColors.primary,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
