import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/routes_path.dart';

class ItemsElement extends StatelessWidget {
  final int itemId;
  final String title;
  final String description;
  final String imageUrl;

  const ItemsElement({
    super.key,
    required this.itemId,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(
          '${RoutePath.items.path}${RoutePath.itemDetail.path}/$itemId',
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 2,
        child: ListTile(
          tileColor: Theme.of(context).colorScheme.surfaceContainer,
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              height: 60,
              width: 60,
              imageUrl: imageUrl,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
