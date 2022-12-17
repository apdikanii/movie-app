import 'package:movie/model/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({super.key, required this.thumbnail});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover)
              ),
            ),
            Icon(Icons.play_circle_outline, size: 100,
            color: Colors.white,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
          ),
          height: 80,
        )
      ],
    );
  }
}
 

//New class
class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
            MoviePoster(poster: movie.images[0].toString()),
            SizedBox(width: 16,),
            Expanded(
              child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}


//new class
class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({super.key, required this.poster});


  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(poster),
            fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}


//new class
class MovieDetailsHeader extends StatelessWidget {
final Movie movie;

  const MovieDetailsHeader({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.year} . ${movie.genre}".toUpperCase(), 
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.cyan
        ),),
        Text(movie.title, style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 32
        ),),
        Text.rich(TextSpan(style: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w300,
        ),
        children: [
          TextSpan(
            text: movie.plot
          ),
          TextSpan(
            text: 'More...',
            style: TextStyle(
              color: Colors.indigoAccent
            )
          )
        ]))
      ],
    );
  }
}


//new class
class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: 'Cast', value: movie.actors),
          MovieField(field: 'Directors', value: movie.director),
          MovieField(field: 'Awards', value: movie.awards)
        ],
      ),
    );
  }
}

//New class
class MovieField extends StatelessWidget {
  final String field;
  final String value;


  const MovieField({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$field: ', style: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          fontWeight: FontWeight.w300
        ),),
        Expanded(
          child: Text(value, style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w300
          ),),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

//new class
class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;
  const MovieDetailsExtraPosters({super.key, required this.posters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('More Movie Posters'.toUpperCase(), style: TextStyle(
            fontSize: 14,
            color: Colors.black26
          ),),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder:  (context, index) => SizedBox(width: 8), 
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(posters[index]),
                  fit: BoxFit.cover)
                ),
              ),
            ) ),
        )
      ],
    );
  }
}