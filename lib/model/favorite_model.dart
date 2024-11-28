// class Favorite {
//   final int id;
//   final String title;
//   final String imageUrl;
//   bool isFavorite;

//   Favorite({
//     required this.id,
//     required this.title,
//     required this.imageUrl,
//     this.isFavorite = false,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       'imageUrl': imageUrl,
//       'isFavorite': isFavorite ? 1 : 0,
//     };
//   }

//   static Favorite fromMap(Map<String, dynamic> map) {
//     return Favorite(
//       id: map['id'],
//       title: map['title'],
//       imageUrl: map['imageUrl'],
//       isFavorite: map['isFavorite'] == 1,
//     );
//   }


  
// }
