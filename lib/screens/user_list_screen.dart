import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart'; // Importa o controlador de usuários
import '../widgets/user_card.dart'; // Importa o widget userCard
import 'add_user_popup.dart'; // Importa a tela de pop-up para adicionar novos usuários

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context, listen: false);
    controller.loadUsers(); // Carrega a lista de usuários ao construir a tela

    return Stack(
      children: [
        Consumer<UserController>(
          builder: (context, controller, child) {
            // Exibe uma mensagem centralizada se a lista de usuários estiver vazia
            if (controller.users.isEmpty) {
              return const Center(child: Text("Nenhum usuário cadastrada"));
            }
            // Caso contrário, exibe uma ListView dos usuários
            return ListView.builder(
              itemCount: controller.users.length, // Número de usuários na lista
              itemBuilder: (context, index) {
                return UserCard(user: controller.users[index]); // Exibe cada usuário usando UserCard
              },
            );
          },
        ),
        // Botão flutuante adicionado ao Stack
        Positioned(
          bottom: 16, // Distância da parte inferior da tela
          right: 16, // Distância do lado direito da tela
          child: FloatingActionButton(
            onPressed: () {
              // Exibe o pop-up de adicionar usuário ao pressionar o botão
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AddUserPopup(); // Widget responsável por adicionar novos usuários
                },
              );
            }, // Ícone '+' para adicionar usuários
            backgroundColor: Colors.green,
            child: Icon(Icons.add), // Define a cor de fundo do botão como verde
          ),
        ),
      ],
    );
  }
}