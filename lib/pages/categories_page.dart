import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendwise/models/category.dart';
import 'package:spendwise/services/data_service.dart';
import 'package:spendwise/theme/app_theme.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  final List<String> _defaultCategories = [
    'Alimentation',
    'Transport',
    'Logement',
    'Loisirs',
    'Santé',
    'Éducation',
    'Autres'
  ];

  @override
  void initState() {
    super.initState();
    _initializeDefaultCategories();
  }

  void _initializeDefaultCategories() {
    final existingCategories = DataService().getCategories();
    final existingNames = existingCategories.map((c) => c.name).toSet();

    for (final categoryName in _defaultCategories) {
      if (!existingNames.contains(categoryName)) {
        final category = Category(name: categoryName);
        DataService().addCategory(category);
      }
    }
  }

  void _restoreDefaultCategories() {
    // Supprimer toutes les catégories existantes
    final existingCategories = DataService().getCategories();
    for (final category in existingCategories) {
      DataService().deleteCategory(category);
    }

    // Ajouter les catégories par défaut
    for (final categoryName in _defaultCategories) {
      final category = Category(name: categoryName);
      DataService().addCategory(category);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _addCategory() {
    if (_formKey.currentState!.validate()) {
      final category = Category(
        name: _nameController.text,
      );
      DataService().addCategory(category);
      _nameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catégories'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.restore),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Restaurer les catégories par défaut'),
                  content: const Text(
                    'Voulez-vous restaurer les catégories par défaut ? Cela supprimera toutes les catégories personnalisées.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Annuler'),
                    ),
                    TextButton(
                      onPressed: () {
                        _restoreDefaultCategories();
                        Navigator.pop(context);
                      },
                      child: const Text('Restaurer'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nom de la catégorie',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un nom';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  ElevatedButton(
                    onPressed: _addCategory,
                    child: const Text('Ajouter'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: DataService().getCategoriesListenable(),
              builder: (context, Box<Category> box, _) {
                if (box.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.category_outlined,
                          size: 64,
                          color: AppTheme.textSecondaryColor,
                        ),
                        const SizedBox(height: AppTheme.spacingM),
                        Text(
                          'Aucune catégorie',
                          style: AppTheme.titleMedium.copyWith(
                            color: AppTheme.textSecondaryColor,
                          ),
                        ),
                        const SizedBox(height: AppTheme.spacingS),
                        Text(
                          'Ajoutez votre première catégorie',
                          style: AppTheme.bodyMedium.copyWith(
                            color: AppTheme.textSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(AppTheme.spacingM),
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final category = box.getAt(index)!;
                    final isDefault = _defaultCategories.contains(category.name);
                    
                    return Container(
                      margin: const EdgeInsets.only(bottom: AppTheme.spacingS),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceColor,
                        borderRadius: BorderRadius.circular(AppTheme.borderRadiusM),
                        boxShadow: AppTheme.shadowS,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                          child: Icon(
                            IconData(
                              int.parse(category.icon),
                              fontFamily: 'MaterialIcons',
                            ),
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        title: Text(
                          category.name,
                          style: AppTheme.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: isDefault ? const Text('Catégorie par défaut') : null,
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Confirmer la suppression'),
                                content: Text(
                                  'Voulez-vous vraiment supprimer la catégorie "${category.name}" ?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Annuler'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      DataService().deleteCategory(category);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Supprimer'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 