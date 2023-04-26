import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:todolists/constants/colors.dart';
import 'package:todolists/model/item.dart';

class CardBody extends StatelessWidget {
  CardBody({Key? key , required this.index , required this.handleDelete , required this.handleOnChange , required this.item,}) : super(key: key);

  final int index;
  final Function handleDelete;
  final Function handleOnChange;
  DataItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 3.0,
        ),
        onTap: () {
          handleOnChange(item);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        tileColor: Colors.white,
        leading: Icon(
          item.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          item.name,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: item.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          margin: const EdgeInsets.symmetric(vertical: 12.0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: IconButton(
            onPressed: () async{
              if(await confirm(context)){
                handleDelete(item.id);
              }
              return;
            },
            iconSize: 18,
            color: Colors.white,
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
