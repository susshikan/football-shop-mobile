import 'package:flutter/material.dart';
import 'package:vintage_sports/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.black12.withOpacity(0.06),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                offset: Offset(0, 10),
                blurRadius: 30,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail + badges
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: _buildThumbnail(),
                    ),
                    if (product.isFeatured)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.secondary.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Text(
                            'Featured',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    if (product.exclusive)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.65),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Text(
                            'Exclusive',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            product.category,
                            style: TextStyle(
                              fontSize: 11,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                        if (product.historyValue.isNotEmpty) ...[
                          const SizedBox(width: 4),
                          const Text(
                            '•',
                            style: TextStyle(fontSize: 11),
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              product.historyValue,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            product.description.length > 100
                                ? '${product.description.substring(0, 100)}...'
                                : product.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.65),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Rp ${product.price}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    if (product.season.isNotEmpty ||
                        (product.userUsername ?? '').isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          if (product.season.isNotEmpty)
                            Text(
                              product.season,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black.withOpacity(0.55),
                              ),
                            ),
                          if (product.season.isNotEmpty &&
                              (product.userUsername ?? '').isNotEmpty)
                            Text(
                              '  •  ',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          if ((product.userUsername ?? '').isNotEmpty)
                            Text(
                              'by ${product.userUsername}',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black.withOpacity(0.55),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    if (product.thumbnail != null && product.thumbnail!.isNotEmpty) {
      return Image.network(
        'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail!)}',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _placeholder(),
      );
    }
    return _placeholder();
  }

  Widget _placeholder() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.grey,
          size: 40,
        ),
      ),
    );
  }
}
