import 'package:flutter/material.dart';

class PageFavorites extends StatefulWidget {
  @override
  _PageFavoritesState createState() => _PageFavoritesState();
}

class _PageFavoritesState extends State<PageFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Container(
        color: Colors.orange[200],
        child: Text('Favorite'),
//        child: FutureBuilder<NewsApi>(
//          future: getNewsDataByCategory(category: 'technology', cacheName: 'cacheTechnology'),
//          builder: (context, snapshot) {
//            if (snapshot.hasError)
//              return Center(
//                child: Text('Something went wrong!'),
//              );
//            else {
//              if (snapshot.connectionState == ConnectionState.done) {
//                return _buildListView(snapshot.data.articles);
//              } else {
//                return Center(
//                  child: CircularProgressIndicator(),
//                );
//              }
//            }
//          },
//        ),
      ),
    );
  }

//  _buildListView(List<Article> articles) {
//    String category = 'Technology';
//    return ListView.builder(
//      itemCount: articles.length,
//      itemBuilder: (context, index) {
//        return kBuildListItemTopSideImg(articles[index], context, category);
//      },
//    );
//  }

}
