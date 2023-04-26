class DataItem {
  final int id;
  final String name;
  bool isDone;

  DataItem({
    required this.id,
    required this.name,
    this.isDone = false,
  });

  static List<DataItem> todoList() {
    return [
      DataItem(
        id: 1,
        name: "Morning Exercise",
        isDone: true,
      ),
      DataItem(
        id: 2,
        name: "Buy Groceries",
        isDone: true,
      ),
      DataItem(
        id: 3,
        name: "Check Emails",
      ),
      DataItem(
        id: 4,
        name: "Team Meeting",
      ),
      DataItem(
        id: 5,
        name: "Work on mobile apps for",
      ),
      DataItem(
        id: 6,
        name: "Gymnastic",
      ),
    ];
  }
}
