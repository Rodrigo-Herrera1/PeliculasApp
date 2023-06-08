import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) => _MoviePoster(),
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  // le pongo el _ por que quiero q sea privado
//es decir que solo funcione dentro de movie slider.

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-istance'), // navigator te lleva a details
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 190,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Star Wars: El retorno del Jedi xdddddddddddddd',
            maxLines: 2, // designa 2 lineas para el Text asi tiene espacio.
            textAlign: TextAlign.center,
            overflow: TextOverflow
                .ellipsis, // indica que hay mas texto con tres puntos..
            style: TextStyle(color: Color.fromARGB(210, 232, 22, 7)),
          )
        ],
      ),
    );
  }
}
