import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie/main.dart';
import 'package:movie/model/movie.dart';
import 'package:movie/model/movie_ui/movie_ui.dart';

class MovieApp extends StatelessWidget {
  
  final List<Movie> movieList = Movie.getMovies();
  // final List movies = [
  //   'Titanic',
  //   'Blade Runner',
  //   'The Avengers',
  //   'Avatar',
  //   'I Am Legend',
  //   '300',
  //   'The Wolf of wall street',
  //   'Interstellar',
  //   'Game of Thrones',
  //   'Vikings'
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abdikani Movie App!"),
        backgroundColor: Color.fromARGB(255, 71, 70, 66),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
               movieCard(movieList[index], context),
              Positioned(
                top: 10.0,
                child: movieImage(movieList[index].images[0])),
            ]);
    //     return Card(
    //       elevation: 4.5,
    //       color: Colors.amber,
    //       child: ListTile(
    //         leading: CircleAvatar(
    //           child: Container(
    //             decoration: BoxDecoration(
    //               image: NetworkImage(movieList[index].images[0]),
    //               fit: BoxFit.cover
    //             ),
    //           ),
    //         ),
    //         trailing: Text("..."),
    //         title: Text(movies[index]),
    //         subtitle: Text('subtitle'),
    //         // onTap: () {
    //         //   Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(movieName: movies[index],),));
    //         // },
    //         // onTap: () => debugPrint('movie name: ${movies.elementAt(index)}'),
    //         onTap: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(movieName: movies[index]),));
    //         },
      //     ),
      //   );
      },)
    );
  }
  Widget movieCard(Movie movie, BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(movie.title, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.white
                        ),),
                      ),
                      Text('Rating: ${movie.imdbRating} / 10',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey
                      ),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Released: ${movie.released}', style: mainTextStyle()),
                      Text(movie.runtime, style: mainTextStyle()),
                      Text(movie.rated, style: mainTextStyle())
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => MovieListViewDetails(movieName: movie.title,
          movie: movie)))
      },
    );
  }

  TextStyle mainTextStyle(){
    return TextStyle(
      fontSize: 15.0,
      color: Colors.grey,
    );
  }
  Widget movieImage(String imageUrl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? "http://ia.media-imdb.com/images/M/MV5BMTcyMzc1MjI5MF5BMl5BanBnXkFtZTgwMzE4ODY2OTE@._V1_SX300.jpg"),
        fit: BoxFit.cover)
      ),
    );
  }
}//end main class

 //New route (screen or page)
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;
  
const MovieListViewDetails({super.key, required this.movieName, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libaxa App kiisa'),
        backgroundColor: Colors.blueGrey,
      ),
        body: ListView(
          children: [
             MovieDetailsThumbnail(thumbnail: movie.images[0],),
             MovieDetailsHeaderWithPoster(movie: movie,),
             HorizontalLine(),
             MovieDetailsCast(movie: movie),
             HorizontalLine(),
             MovieDetailsExtraPosters(
               posters: movie.images,
             )
          ],
        ),
    );
  }
}
