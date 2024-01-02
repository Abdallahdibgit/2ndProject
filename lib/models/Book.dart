class Book {
  String title;
  String author;
  String imageUrl;

  Book({required this.title, required this.author, required this.imageUrl});
}

List<Book> newbooks = [
  Book(title: 'Force Of Nature', author: 'Jane Harper' , imageUrl: 'assets/images/ForceOfNature.jpg'),
  Book(title: 'The Covenant Of Water', author: 'Abraham Verghese' , imageUrl: 'assets/images/WaterBook.jpg'),
  Book(title: 'Maybe Now', author: 'Colleen Hoover' ,imageUrl: 'assets/images/MaybeNow.jpg'),
];