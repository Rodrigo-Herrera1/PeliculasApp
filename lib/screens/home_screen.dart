import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_off_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          //esto permita deslizar hacia abajo dentro de la columna
          child: Column(
            children: [
              CardSwiper(), // AQUI ESTA EL CARDSWIPER Tarjetas principales,

              MovieSlider(), // Slider de peliculas
            ],
          ),
        ));
  }
}
