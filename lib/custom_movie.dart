import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  //pembuatan data list
  List<Container> listMovie = List();

  var daftarMovie = [
    {"nama": "Movie 1", "gambar": "movie1.jpeg"},
    {"nama": "Movie 2", "gambar": "movie2.jpeg"},
    {"nama": "Movie 3", "gambar": "movie3.jpeg"},
    {"nama": "Movie 4", "gambar": "movie4.jpeg"},
    {"nama": "Movie 5", "gambar": "movie5.jpeg"},
    {"nama": "Movie 6", "gambar": "movie6.jpeg"},
    {"nama": "Movie 7", "gambar": "movie7.jpeg"},
    {"nama": "Movie 8", "gambar": "movie8.jpeg"},
    {"nama": "Movie 9", "gambar": "movie9.jpeg"},
    {"nama": "Movie 10", "gambar": "movie10.jpeg"},
    {"nama": "Movie 11", "gambar": "movie11.jpeg"},
  ];

  _buatDataList() async {
    for (var i = 0; i < daftarMovie.length; i++) {
      final warnanya = daftarMovie[i];
      final String gambar = warnanya["gambar"];

      listMovie.add(Container(
        padding: EdgeInsets.all(5),
        child: Card(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailGridView(
                        nama: warnanya['nama'],
                        gambar: gambar,
                      )));
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Hero(
                  tag: warnanya['nama'],
                  child: Image.asset(
                    "images/$gambar",
                    height: 100,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  warnanya['nama'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    // memanggil method buatDataList
    _buatDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
        backgroundColor: Colors.lightBlue,
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: GridView.count(
          childAspectRatio: (itemHeight / itemWidth),
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          children: listMovie,
        ),
      ),
    );
  }
}

class DetailGridView extends StatelessWidget {
  DetailGridView({this.nama, this.gambar});

  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: Hero(
                tag: nama,
                child: Material(
                  child: InkWell(
                    child: Image.asset("images/$gambar", fit: BoxFit.contain,),
                  ),
                ),
            ),
          ),
          BagianNama(
            nama: nama,
          ),
          BagianIcon(),
          BagianKeterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama ({this.nama});
  
  final String nama;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nama, style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                ),
                Text(
                  "$nama\@gmail.com", style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.star,size: 30,color: Colors.red,),
              Text("12", style: TextStyle(fontSize: 18),),
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          IconTeks(
            iconData: Icons.call,
            teks: "Call",
          ),
          IconTeks(
            iconData: Icons.message,
            teks: "Message",
          ),
          IconTeks(
            iconData: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class IconTeks extends StatelessWidget {
  
  IconTeks({this.iconData, this.teks});

  final String teks;
  var iconData;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(iconData, size: 20, color: Colors.blue,),
          Text(teks, style: TextStyle(fontSize: 12, color: Colors.blue),)
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Padding(padding: const EdgeInsets.all(10),
        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
               style: TextStyle(fontSize: 14),
          textAlign: TextAlign.justify,
        ),
        ),
      ),
    );
  }
}



