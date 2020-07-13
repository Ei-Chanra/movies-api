import 'package:flutter/material.dart';
import 'package:moviesapi/main.dart';
import 'package:moviesapi/pages/page_favorite.dart';
import 'package:moviesapi/pages/page_movies.dart';
import 'package:moviesapi/pages/page_tv_shows.dart';
import 'package:moviesapi/screen/about_us.dart';
import 'package:moviesapi/utilities/constant.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageMovies _pageMovies = PageMovies();
  PageTvShows _pageTvShows = PageTvShows();
 // PageFavorites _pageFavorites = PageFavorites();
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'MOVIES'),
    Tab(text: 'TV SHOWS'),
    //Tab(text: 'FAVORITES'),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: _buildAppBar(context),
        drawer: _buildDrawer(),
        body: _buildBody(),
      ),
    );
  }

  _buildAppBar(context) {
    return AppBar(
      bottom: TabBar(
        isScrollable: true,
        tabs: myTabs,
      ),
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          icon: Image.asset('asset/images/menu.png', color: Colors.white,),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Stardust',
            style: TextStyle(color: Colors.white),

          ),
          SizedBox(width: 2),
          Text(
            'Movie',
            style: kAppBarTitle2Style,
          )
        ],
      ),
      titleSpacing: 3,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.share, color: Colors.blue,),
          padding: EdgeInsets.only(right: 2),
          onPressed: () {
            modal.shareCouponModal(context);
          },
        ),
      ],
    );
  }

  _buildDrawer() {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red[600],
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i7.pngguru.com/preview/159/439/738/avatar-twitch-youtube-character-avatar.jpg'),
                    radius: 29,
                  ),
                  title: Text(
                    'Stardust Movies',
                    style: kNewsCategoryNameTextStyle,
                  ),
                  subtitle: Text(
                    'stardust@movies.com',
                    style: kNewsEmailTextStyle,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.category,
                  size: 25,
                ),
                title: Text('Categories'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.bookmark,
                  size: 25,
                ),
                title: Text('Bookmark'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.new_releases,
                  size: 25,
                ),
                title: Text('About'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return TabBarView(
      children: <Widget>[
        _pageMovies,
        _pageTvShows,
       // _pageFavorites,

      ],
    );
  }
}
