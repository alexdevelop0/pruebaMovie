import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pruebaTest/constant/constant.dart';
import 'package:pruebaTest/locale/translations.dart';
import 'package:pruebaTest/model/models.dart';
import 'package:pruebaTest/network/api.dart';
import 'package:pruebaTest/pages/movies_list_page.dart';
import 'package:pruebaTest/state/states.dart';

import 'package:pruebaTest/widgets/movie_list.dart';
import 'package:pruebaTest/widgets/side_menu.dart';
import 'package:provider/provider.dart';
import 'movie_search_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Future<List<Movie>> playNowMoviesFuture;
  Future<List<Movie>> popularMoviesFuture;

  @override
  void initState() {
    super.initState();

    playNowMoviesFuture = MovieDBApi.getPlayNow();
    popularMoviesFuture = MovieDBApi.getTopRate();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
     
      appBar: AppBar(
        elevation: 0,
        title: Text('Inicio'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              return showSearch(context: context, delegate: MovieSearchPage());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
           
            FutureBuilder(
              future: popularMoviesFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MovieCoverFlow(snapshot.data.reversed.toList());
                } else {
                  return Container(
                      height: 460,
                      child: Center(child: CircularProgressIndicator()));
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(Translations.of(context).trans(transKeyNowPlaying),
                      ),
                 
                ],
              ),
            ),
            FutureBuilder(
                future: playNowMoviesFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new HorizontalMovieList(
                        movies: snapshot.data, name: 'play_now');
                  } else {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
           
            Consumer<FavoriteState>(builder: (context, state, child) {
              print('my favotite consumer : ' + state.isLoaded.toString());
              if (false == state.isLoaded) {
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (state.isEmpty()) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Center(
                    child: Text(
                        Translations.of(context)
                            .trans(transKeyFavoriteEmptyMessage),
                        ),
                  ),
                );
              }
              return new HorizontalMovieList(
                  movies: state.getMovies(), name: 'favorite');
            }),
          ],
        ),
      ),
    );
  }

  Future<T> typeCastToFuture<T>(T t) async {
    return t;
  }
}
