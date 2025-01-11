import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/subcategory_controller.dart'; // Importa o controlador de subcategorias
import '../widgets/subcategory_card.dart'; // Importa o widget SubCategoryCard
import 'add_subcategory_popup.dart'; // Importa a tela de pop-up para adicionar novas subcategorias

class SubCategoryListScreen extends StatelessWidget {
  const SubCategoryListScreen({super.key});

  // final int categoryId; // ID da categoria para carregar as subcategorias

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<SubCategoryController>(
          builder: (context, controller, child) {
            if (controller.sub_categories.isEmpty) {
              return const Center(
                  child: Text("Nenhuma subcategoria cadastrada"));
            }
            return ListView.builder(
              itemCount: controller.sub_categories.length,
              itemBuilder: (context, index) {
                return SubCategoryCard(
                    subCategory: controller.sub_categories[
                        index]); // Exibe cada subcategoria usando SubCategoryCard
              },
            );
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AddSubCategoryPopup(); // Widget responsável por adicionar novas subcategorias
                },
              );
            },
            backgroundColor:
                Colors.orange,
            child: const Icon(Icons.add), // Define a cor de fundo do botão como laranja
          ),
        ),
      ],
    );
  }
}
