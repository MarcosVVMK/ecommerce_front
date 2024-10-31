import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Para gerenciar o estado com o controller
import '../controllers/category_controller.dart';
import '../widgets/category_card.dart';
import 'add_category_popup.dart'; // A tela de adicionar categoria

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Carregar os categoria quando a tela for construída
    final controller = Provider.of<CategoryController>(context, listen: false);
    controller.loadCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implementar a funcionalidade de pesquisa
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Abrir a tela de adicionar produto em um popup
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddCategoryPopup();
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.update),
            onPressed: () {
              // Implementar a funcionalidade de pesquisa
            },
          ),
        ],
      ),
      body: Consumer<CategoryController>(
        builder: (context, controller, child) {
          if (controller.categories.isEmpty) {
            return const Text("nenhum produto cadastrado");
          }
          return ListView.builder(
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(category: controller.categories[index]);
            },
          );
        },
      ),
    );
  }
}