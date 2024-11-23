import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard({required this.user}) : super(key: ValueKey(user.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.userName),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            Provider.of<UserController>(context, listen: false)
                .removeUser(user.id);
          },
        ),
      ),
    );
  }
}