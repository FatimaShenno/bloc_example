import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../domain/entity/entity_product.dart';

class AnimationList extends StatelessWidget {
  final List<ProductEntity> products;
  final bool isFitched;
  const AnimationList({
    super.key,
    required this.products,
    required this.isFitched,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 300),
              child: SlideAnimation(
                verticalOffset: isFitched ? 0.0 : -50.0,
                delay: const Duration(milliseconds: 20),
                child: FadeInAnimation(
                  child: CupertinoListTile(
                    leadingSize: 80,
                    padding: const EdgeInsets.all(10.0),
                    additionalInfo: Text('${products[index].price.toString()}.SR'),
                    title: Text(products[index].title),
                    subtitle: Text(
                      products[index].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textScaler: const TextScaler.linear(1.3),
                    ),
                    leading: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: double.maxFinite,
                        imageUrl: products[index].images[0],
                        errorWidget: (_, url, error) => const Center(
                          child: Icon(Icons.error_outline),
                        ),
                        progressIndicatorBuilder: (_, url, progress) =>
                            const CupertinoActivityIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
