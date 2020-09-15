import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersonWidget(),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 227;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            onPressed: _toggleFavorite,
            color: Colors.red,
          ),
        ),
        SizedBox(
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}

class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Irkutsk, Russia'),
      ),
      body: Container(child: _buildMainColumn()),
    );
  }

  Widget _buildMainColumn() => ListView(
        children: [
          _buildTopImage(),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildRating(),
                  ),
                  Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(5),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: _buildAction(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildDesc(),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildTopImage() => Container(
        child: Card(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          elevation: 5,
          child: Image.asset(
            'assets/image/korgi.jpg',
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _buildRating() => ListTile(
      title: Text(
        'Медовый Коржик',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
      subtitle: Text('Маленькие ножки'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FavoriteWidget(),
        ],
      ));

  Widget _buildAction() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildButton('Корж', Icons.star, Colors.blue),
          _buildButton('Ножки', Icons.radio_button_checked, Colors.blue),
          _buildButton('Бакалавр', Icons.school, Colors.blue),
        ],
      );

  Widget _buildButton(String label, IconData icon, Color color) => Column(
        children: <Widget>[
          Icon(icon, color: Colors.blue),
          Container(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          )
        ],
      );

  Widget _buildDesc() => Container(
        padding: const EdgeInsets.all(5),
        child: Text(
          'Грустный коржик ищет друзей и не только! В срочном порядке пишите сюда.',
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      );
}
