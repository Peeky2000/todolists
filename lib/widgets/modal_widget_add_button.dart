import 'package:flutter/material.dart';

class ModalWidgeAddButton extends StatefulWidget {
  ModalWidgeAddButton({
    super.key,
    required this.handleAddTask,
  });

  Function handleAddTask;


  @override
  State<ModalWidgeAddButton> createState() => _ModalWidgeAddButtonState();
}

class _ModalWidgeAddButtonState extends State<ModalWidgeAddButton> {

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  void _handleOnClick(BuildContext context) {
    final name = controller.text;
    name.isNotEmpty ? widget.handleAddTask(name) : null;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Your task",
                suffixIcon: controller.text.isNotEmpty ? IconButton(onPressed: (){
                  controller.clear();
                  setState(() {});
                }, icon: const Icon(Icons.remove_circle_outline)) : null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ))),
                onPressed: () {
                  _handleOnClick(context);
                },
                child: const Text("Add Task"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
