import 'package:flutter/material.dart';
import 'package:todolists/constants/colors.dart';
import 'package:todolists/model/item.dart';
import 'package:todolists/widgets/modal_widget_add_button.dart';
import 'package:todolists/widgets/todo_item.dart';

import '../widgets/search_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var items = DataItem.todoList();
  List<DataItem> _foundTodo = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foundTodo = items;
  }

  void _handleAddTask(String name) {
    final newItem = DataItem(id: items.last.id + 1, name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(int id) {
    setState(() {
      items.removeWhere((element) => element.id == id);
    });
  }

  void _handleToDoChange(DataItem item) {
    setState(() {
      item.isDone = !item.isDone;
    });
  }

  void _handleSearchTask(String keyword){
    List<DataItem> results = [];
    if(keyword.isEmpty){
      results = items;
    }else{
      results = items.where((element) => element.name.toLowerCase().contains(keyword.toLowerCase())).toList();
    }

    setState(() {
       _foundTodo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: tdBGColor,
        appBar: _buildAppBar(),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                searchBox(handleSearch : _handleSearchTask),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                    top: 50,
                    bottom: 20,
                  ),
                  child: const Text(
                    "All To Do",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: _foundTodo.reversed
                        .map((item) => CardBody(
                            index: _foundTodo.indexOf(item),
                            handleDelete: _handleDeleteTask,
                            handleOnChange: _handleToDoChange,
                            item: item))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red.shade300,
          tooltip: "Add",
          child: const Text(
            "+",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,

            ),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ModalWidgeAddButton(handleAddTask: _handleAddTask);
              },
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          CircleAvatar(
            child: ClipOval(
              child: Image.asset("assets/images/avatar-generations_prsz.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
