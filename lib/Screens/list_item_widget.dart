import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class ListItemWidget extends StatelessWidget{
  final ListItem item;
  final Animation<double>animation;
  final VoidCallback? onClicked;
  const ListItemWidget( {
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
}):super(key: key);
  @override
  Widget build(BuildContext context) => SizeTransition(
    key: ValueKey(item.urlImage),
      sizeFactor: animation,
  child: buildItem(),);
  Widget buildItem()=>Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.grey,
    ),
    child: ListTile(
      contentPadding: EdgeInsets.all(16),
      leading: CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(item.urlImage),
      ),
      title: Text(
        item.title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete,color: Colors.red,size: 32,),
        onPressed: onClicked,
      ),
    ),
  );
}