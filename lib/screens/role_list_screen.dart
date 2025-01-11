import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/role_controller.dart'; // Importa o controlador de permissão
import '../widgets/role_card.dart'; // Importa o widget roleCard
import 'add_role_popup.dart'; // Importa a tela de pop-up para adicionar novos permissão

class RoleListScreen extends StatelessWidget {
  const RoleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RoleController>(context, listen: false);
    controller.loadRoles(); // Carrega a lista de permissão ao construir a tela

    return Stack(
      children: [
        Consumer<RoleController>(
          builder: (context, controller, child) {
            // Exibe uma mensagem centralizada se a lista de permissão estiver vazia
            if (controller.roles.isEmpty) {
              return const Center(child: Text("Nenhuma permissão cadastrada"));
            }
            // Caso contrário, exibe uma ListView dos permissão
            return ListView.builder(
              itemCount: controller.roles.length, // Número de permissão na lista
              itemBuilder: (context, index) {
                return RoleCard(role: controller.roles[index]); // Exibe cada usuário usando RoleCard
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
                  return const AddRolePopup(); // Widget responsável por adicionar novos permissão
                },
              );
            }, // Ícone '+' para adicionar permissão
            backgroundColor: Colors.green,
            child: const Icon(Icons.add), // Define a cor de fundo do botão como verde
          ),
        ),
      ],
    );
  }
}