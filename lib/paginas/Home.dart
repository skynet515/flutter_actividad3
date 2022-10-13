import 'package:flutter/material.dart';
import 'package:flutter_actividad3/colores/colores.dart';
import 'package:flutter_actividad3/paginas/detalle.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_actividad3/json/json.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int menuactivo = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blanco,
      body: Body(),
    );
  }

  Widget Body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Row(
                  children: List.generate(Categorias.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        menuactivo = index;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Categorias[index],
                          style: TextStyle(
                              fontSize: 20,
                              color: menuactivo == index ? color4 : color1,
                              fontWeight: FontWeight
                                  .bold /*menuactivo == index
                                  ? FontWeight.bold
                                  : FontWeight.normal*/
                              ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                        height: 300,
                        width: 475,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset('images/paisaje01.jpg'))),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Trending this week",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: color1, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: List.generate(Animales.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: Detalle(
                                elementos: Animales[index],
                              ),
                              type: PageTransitionType.scale
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Animales[index]['img']),
                                    fit: BoxFit.cover),
                                color: blanco,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            Animales[index]['title'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                "New Album",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: color1, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: List.generate(Paisaje.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: Detalle(
                                elementos: Paisaje[index],
                              ),
                              type: PageTransitionType.scale
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 210,
                            height: 230,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Paisaje[index]['img']),
                                    fit: BoxFit.cover),
                                color: blanco,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            Paisaje[index]['title'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
