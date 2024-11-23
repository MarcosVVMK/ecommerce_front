import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/category_controller.dart'; // Importa o controlador de categorias
import '../widgets/category_card.dart'; // Importa o widget categoryCard
import 'add_category_popup.dart'; // Importa a tela de pop-up para adicionar novos categorias

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CategoryController>(context, listen: false);
    controller.loadCategories(); // Carrega a lista de categorias ao construir a tela

    return Stack(
      children: [
        Consumer<CategoryController>(
          builder: (context, controller, child) {
            // Exibe uma mensagem centralizada se a lista de categorias estiver vazia
            if (controller.categories.isEmpty) {
              return const Center(child: Text("Nenhuma categoria cadastrada"));
            }
            // Caso contrário, exibe uma ListView dos categorias
            return ListView.builder(
              itemCount: controller.categories.length, // Número de categorias na lista
              itemBuilder: (context, index) {
                return CategoryCard(category: controller.categories[index]); // Exibe cada categoria usando CategoryCard
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
              // Exibe o pop-up de adicionar categoria ao pressionar o botão
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AddCategoryPopup(); // Widget responsável por adicionar novos categorias
                },
              );
            }, // Ícone '+' para adicionar categorias
            backgroundColor: Colors.green,
            child: Icon(Icons.add), // Define a cor de fundo do botão como verde
          ),
        ),
      ],
    );
  }
}