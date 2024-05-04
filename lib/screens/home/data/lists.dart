class Section {
  final String title;
  final String imagePath;

  Section({required this.title, required this.imagePath});
}

List<Section> sections = [
  Section(title: "Beauty", imagePath: "assets/images/beauty.jpg"),
  Section(title: "Fashion", imagePath: "assets/images/fashion.jpg"),
  Section(title: "Kids", imagePath: "assets/images/kids.jpg"),
  Section(title: "Mens", imagePath: "assets/images/men.jpg"),
  Section(title: "Womens", imagePath: "assets/images/women.jpg"),
];
