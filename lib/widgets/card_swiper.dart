import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // con MediaQuery hacemos que el height se pueda colocar
    // de la siguiente manera es decir size.height como veremos abajo dentro del container
    //multiplicado * 0,5 mitad de pantalla 0,6 un poco más de la mitad y asi
    return Container(
        width: double
            .infinity, //toma toda el ancho posible de su padre, en este caso la colum del home_scrteen
        height: size.height * 0.5, // size.height posible por el mediaquery
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              // detetca on tap y navega a otra ruta
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage(
                      'assets/no-image.jpg'), // imagen que muestra antes normalmente en memoria
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover,
                ),
              ),
            ); // imagen oficial normalmente networkimage con path
          }, //funcion q se dispara para construir
        ));
  }
}
