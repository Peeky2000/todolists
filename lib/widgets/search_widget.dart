import 'package:flutter/material.dart';

import '../constants/colors.dart';

class searchBox extends StatelessWidget {
  searchBox({
    super.key,
    required this.handleSearch,
  });

  Function handleSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        onChanged: (value) => handleSearch(value),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20.0,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
}