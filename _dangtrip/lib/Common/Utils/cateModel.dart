class CategoryModel {
  final String name;
  final bool isSelected;

  CategoryModel({
    required this.name,
    required this.isSelected,
  });

  CategoryModel copyWith({
    String? name,
    bool? isSelected,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
