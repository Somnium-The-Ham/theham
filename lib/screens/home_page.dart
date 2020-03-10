import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theham/constants/size.dart';
import 'package:theham/firebase/firestore_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/theham_logo.png', height: 20,),
        actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: ImageIcon(AssetImage('assets/cart2.png'), color: Colors.green))
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
          itemBuilder: (BuildContext context, int index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _AdImage(),
                Padding(
                  padding: const EdgeInsets.all(common_gap),
                  child: Text('카테고리',),
                ),
                CategoryImage(),
                Padding(
                  padding: const EdgeInsets.all(common_gap),
                  child: Text('그들의 이야기'),
                ),
                StoryImage()
              ],
            );
          }),
    );
  }

  CachedNetworkImage StoryImage() {
    return CachedNetworkImage(imageUrl: 'https://picsum.photos/id/1/200/300',
                imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
                    AspectRatio(
                      aspectRatio: 2/1,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),);
  }

  Row CategoryImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  'https://picsum.photos/id/1/200/300'
              ),
              radius: 40,
            ),
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  'https://picsum.photos/id/1/200/300'
              ),
              radius: 40,
            ),
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  'https://picsum.photos/id/1/200/300'
              ),
              radius: 40,
            ),
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  'https://picsum.photos/id/1/200/300'
              ),
              radius: 40,
            ),
          ],
        );
  }

  CachedNetworkImage _AdImage() {
    return CachedNetworkImage(imageUrl: 'https://picsum.photos/id/1/200/300',
          imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
              AspectRatio(
                aspectRatio: 6/1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),);
  }
}
