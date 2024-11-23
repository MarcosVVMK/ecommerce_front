import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';
import '../models/user.dart';

class AddUserPopup extends StatefulWidget {
  const AddUserPopup({super.key});

  @override
  _AddUserPopupState createState() => _AddUserPopupState();
}

class _AddUserPopupState extends State<AddUserPopup> {
  final _formKey = GlobalKey<FormState>();
  String _userName = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Usuário'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome da Usuário'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome da usuario';
                }
                return null;
              },
              onSaved: (value) {
                _userName = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Senha'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome da senha';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Adicionar'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final newUser = User(id: 0, userName: _userName, password: _password, roleId: 1);
              Provider.of<UserController>(context, listen: false)
                  .addUser(newUser);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
