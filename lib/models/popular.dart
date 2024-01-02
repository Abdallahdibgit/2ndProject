class Popular {
  String title;
  String author;
  String imageUrl;
  String price;

  Popular({required this.title, required this.author ,required this.imageUrl, required this.price});
}

List<Popular> populars = [
  Popular(title: 'Maybe Now', author: 'Colleen Hoover' , imageUrl: 'assets/images/MaybeNow.jpg' , price: '21'),
  Popular(title: 'All Light We Cannot see', author: 'Anthony Doerr' , imageUrl: 'assets/images/light.jpg', price: '15'),
  Popular(title: 'Five Feet Apart', author: 'Rachael' ,imageUrl: 'assets/images/FiveFeet.jpg', price : '33'),
];
