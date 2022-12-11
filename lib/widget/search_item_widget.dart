import 'package:flutter/material.dart';

class SearchItemWidget extends StatelessWidget {
  SearchItemWidget({
    Key? key,
    this.iconColor,
    this.title,
    this.desc,
    this.image,
  }) : super(key: key);

  final Color? iconColor;
  final String? title;
  final String? desc;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(image!),
        ),
        title:  Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        subtitle:  Text(desc!,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        trailing: Icon(
          Icons.favorite,
          color: iconColor,
        ),
      ),
    );
  }
}
