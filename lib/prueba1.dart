import 'package:flutter/material.dart';
import 'package:flutter_prueba_1/animal_sounds.dart';

class Prueba1 extends StatelessWidget {
  const Prueba1({super.key});

  final List<Map<String, String>> animals = const [
    {
      "name": "Pájaro",
      "image": "assets/img/bird.jpg",
      "sound": "mp3/bird.mp3",
      "description":
          "Los pájaros son los únicos animales con plumas, ¡y algunas especies pueden volar a más de 100 km/h! Además, usan sus cantos para hablar entre ellos o para llamar la atención de otros pájaros",
    },
    {
      "name": "Perro",
      "image": "assets/img/dog.jpg",
      "sound": "mp3/dog.mp3",
      "description":
          "Los perros tienen un súper olfato, ¡pueden oler hasta 100.000 veces mejor que los humanos! Por eso, muchas veces ayudan a encontrar cosas o personas",
    },
    {
      "name": "Gato",
      "image": "assets/img/cat.jpg",
      "sound": "mp3/cat.mp3",
      "description":
          "Los gatos pasan la mitad de su día durmiendo y son muy ágiles porque tienen un esqueleto flexible. Pueden saltar hasta seis veces su altura",
    },
    {
      "name": "Gallo",
      "image": "assets/img/rooster.jpg",
      "sound": "mp3/rooster.mp3",
      "description":
          "Los gallos cantan para marcar su territorio y avisar a otros que están ahí. Su canto puede escucharse desde muy lejos, ¡incluso a 1 km de distancia!",
    },
    {
      "name": "Vaca",
      "image": "assets/img/cow.jpg",
      "sound": "amp3/cow.mp3",
      "description":
          "Las vacas tienen cuatro estómagos que les ayudan a digerir el pasto. También tienen muy buena memoria, recuerdan caras y lugares por mucho tiempo",
    },
    {
      "name": "Caballo",
      "image": "assets/img/horse.jpg",
      "sound": "mp3/horse.mp3",
      "description":
          "Los caballos pueden dormir de pie gracias a sus patas fuertes, y tienen una excelente memoria. Pueden reconocer amigos humanos después de muchos años",
    },
    {
      "name": "León",
      "image": "assets/img/lion.jpg",
      "sound": "mp3/lion.mp3",
      "description":
          "Los leones son conocidos como los reyes de la selva y su rugido puede escucharse hasta a 8 kilómetros. Las hembras son las que cazan para alimentar a toda la familia",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF285555),
        body: SafeArea(
          child: Stack(
            children: [
              Container(color: const Color(0xFF285555)),
              const GreenRectangle(),
              Column(
                children: [
                  AppBar(height: size.height * 0.18),
                  Expanded(
                    child: AnimalList(
                      heightAlbum: size.height * 0.75,
                      animals: animals,
                    ),
                  ),
                ],
              ),
              const NavbarMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  final double height;

  const AppBar({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu, color: Colors.white, size: 28),
              Icon(Icons.search, color: Colors.white, size: 28),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Discover',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Our majestic world together',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalList extends StatelessWidget {
  final double heightAlbum;
  final List<Map<String, String>> animals;

  const AnimalList(
      {super.key, required this.heightAlbum, required this.animals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      itemCount: animals.length,
      itemBuilder: (context, index) {
        final animal = animals[index];
        return Padding(
          padding:
              const EdgeInsets.only(left: 30.0, right: 150.0, bottom: 20.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            animal["name"]!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(animal["image"]!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 50,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AnimalSounds(animal: animal),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class GreenRectangle extends StatelessWidget {
  const GreenRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      left: 0,
      top: size.height * 0.37,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.only(right: 20.0),
        width: size.width * 0.76,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(0),
          ),
        ),
      ),
    );
  }
}

class NavbarMenu extends StatefulWidget {
  const NavbarMenu({super.key});

  @override
  _NavbarMenuState createState() => _NavbarMenuState();
}

class _NavbarMenuState extends State<NavbarMenu> {
  String selected = 'Animals';

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 25,
      top: 0,
      bottom: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildMenuItem('Reptiles'),
          const SizedBox(height: 20),
          buildMenuItem('Birds'),
          const SizedBox(height: 20),
          buildMenuItem('Animals'),
          const SizedBox(height: 20),
          buildMenuItem('Fishes'),
        ],
      ),
    );
  }

  Widget buildMenuItem(String text) {
    bool isSelected = selected == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = text;
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontSize: 20,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (isSelected)
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
