import 'package:flutter/material.dart';
import 'package:hello_world/model/product_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../model/review_model.dart';

class ReviewPage extends StatelessWidget {
  final Product product;
  ReviewPage(this.product,{Key? key}) : super(key: key);
  List<Review> lsReviews = [
    Review("https://i.picsum.photos/id/420/80/80.jpg?hmac=eaI_ri0-1OUWUeml6X3gTo6y4CLGCyOlB_MIgMpbIbU","Xx_kikoolol_xX", "Really nice article !", 1, "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"),
    Review("https://i.picsum.photos/id/420/80/80.jpg?hmac=eaI_ri0-1OUWUeml6X3gTo6y4CLGCyOlB_MIgMpbIbU","Xx_kikoolol_xX", "nice article !", 2.5, "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"),
    Review("https://i.picsum.photos/id/420/80/80.jpg?hmac=eaI_ri0-1OUWUeml6X3gTo6y4CLGCyOlB_MIgMpbIbU","Xx_kikoolol_xX", "good article !", 3, "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"),
    Review("https://i.picsum.photos/id/420/80/80.jpg?hmac=eaI_ri0-1OUWUeml6X3gTo6y4CLGCyOlB_MIgMpbIbU","Xx_kikoolol_xX", "Really good article !", 5, "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"),
    ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Les Avis")),
      body: ListView.builder(
        itemCount: lsReviews.length,
        itemBuilder: (context, int index){
          return ListTile(
            leading: Image.network(lsReviews[index].profilPic, width: 40, height: 40,),
            title: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 3.0),
                      child: Text(lsReviews[index].username),
                    )
                ) ,

                Row(
                  children: [
                    Text("${lsReviews[index].title}   ", style: TextStyle(fontWeight: FontWeight.bold)),
                    RatingBar(
                        initialRating: lsReviews[index].note,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                         full: Icon(Icons.star, color: Colors.yellow),
                         half: Icon(Icons.star_half, color: Colors.yellow),
                         empty: Icon(Icons.star_border, color: Colors.yellow),
                      ),
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemSize: 18.0,
                        onRatingUpdate: (rating) {
                        print(rating);
                        },
                      ignoreGestures: true,
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(lsReviews[index].description),
            ),
          );
        }
      )
    );
  }
}
