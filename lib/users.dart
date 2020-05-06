class User {
  String name;
  int points;

  User(this.name, this.points);
}

class UserBrain {
  List<User> users = [];

  void addUser(String name, int points) {
    users.add(User(name, points));
  }

  void printUSer() {
    print(users);
  }
}
