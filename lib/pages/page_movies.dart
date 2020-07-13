import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:moviesapi/helpers/movie_db.dart';
import 'package:moviesapi/pages/items_detail_movies_page.dart';

class PageMovies extends StatefulWidget {
  @override
  _PageMoviesState createState() => _PageMoviesState();
}

class _PageMoviesState extends State<PageMovies> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }


  _buildBody() {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Container(
        color: Colors.black,
        child: FutureBuilder<MovieDb>(
          future: getMovieData(cacheName: 'cacheMovie'),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text('Something went wrong!'),
              );
            else {
              if (snapshot.connectionState == ConnectionState.done) {
                return _buildListView(snapshot.data.results);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          },
        ),
      ),
    );
  }

  _buildListView(List<Result> results) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(results.length, (index) {
        return kBuildListItem(results[index], context);
      },
      ),
    );
  }

  kBuildListItem(Result results, BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: (){
        //print("Cliked");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailPage()));
      },
      child: Container(
        width: 130,
        height: 200,
        //color: Colors.greenAccent,
        decoration: BoxDecoration(
          //color: Colors.pink,
          image: DecorationImage(
              image: FadeInImage.assetNetwork(
                  placeholder: 'asset/images/no_image.jpg',
                  image: "https://image.tmdb.org/t/p/w500/" +results.posterPath).image,
              fit: BoxFit.fill
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Icon(Icons.favorite,size: 20, color: Colors.white)
            ),
            SizedBox(
              width: 70,
            ),
            Expanded(
                flex: 3,
                child: Text("2020", style: TextStyle(fontSize: 16, color: Colors.white),)
            ),
          ],
        ),
      ),
    );

//      child: Image(
//        image: AdvancedNetworkImage(
//          'https://image.tmdb.org/t/p/w500/${results.posterPath}' ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1200px-No_image_available.svg.png',
//          fallbackAssetImage: 'asset/images/no_image.jpg',
//         // useDiskCache: true,
//          cacheRule: CacheRule(
//            maxAge: Duration(days: 2),
//          ),
//          skipRetryStatusCode: [403, 400],
//        ),
//        fit: BoxFit.cover,
//      ),
  }

}
