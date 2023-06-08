import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO CAMBIAR LUEGO POR UNA INSTANCIA DE MOVIE
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
      body: CustomScrollView(
        //scroll view con slivers que tienen comportamiento preprogramado
        //cuando se hace scroll en el padre
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
                [_PosterAndTitle(), _Overview(), _Overview(), CastingCards()]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black45,
          child: Text(
            'movie.titlee',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20), //
      padding: EdgeInsets.symmetric(
          horizontal:
              20), // no quiero q todo lo q cree se quede pegado a los bordes x eso padding
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 250,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.originaltitle',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_border_purple500_rounded,
                    size: 20,
                    color: Colors.red,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'movie.voteAverage',
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Sint pariatur dolore ea do ipsum. Esse amet commodo est anim. Adipisicing elit laboris et mollit ullamco pariatur irure. Velit mollit voluptate fugiat nisi qui adipisicing aliquip magna anim tempor. Duis exercitation esse nostrud mollit adipisicing culpa magna do nisi. Consequat pariatur aliqua fugiat culpa anim esse officia dolor sunt pariatur.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
