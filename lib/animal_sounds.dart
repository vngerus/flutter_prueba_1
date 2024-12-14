import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AnimalSounds extends StatefulWidget {
  final Map<String, String> animal;

  const AnimalSounds({super.key, required this.animal});

  @override
  _AnimalSoundsState createState() => _AnimalSoundsState();
}

class _AnimalSoundsState extends State<AnimalSounds> {
  late AudioPlayer _player;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _playSound(String soundPath) async {
    try {
      await _player.play(AssetSource(soundPath));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al reproducir el sonido: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final animal = widget.animal;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF285555),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 28),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Función de búsqueda no implementada'),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(color: const Color(0xFF285555)),
          const GreenRectangle(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: '  ',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: animal['name'] ?? 'Sin Nombre',
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    height: size.height * 0.48,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(
                          animal['image'] ?? 'assets/img/placeholder.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 20.0,
                  ),
                  child: SizedBox(
                    width: size.width * 0.8,
                    child: Text(
                      animal['description'] ?? 'Descripción no disponible.',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F4949),
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_outline,
                            color: isLiked ? Colors.orange : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (animal['sound'] != null) {
                          _playSound(animal['sound']!);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('El sonido no está disponible.'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 24.0,
                        ),
                      ),
                      child: const Text(
                        'Reproducir Sonido',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GreenRectangle extends StatelessWidget {
  const GreenRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      right: 0,
      top: size.height * 0.03,
      bottom: 278,
      child: Container(
        padding: const EdgeInsets.only(left: 20.0),
        width: size.width * 0.59,
        decoration: const BoxDecoration(
          color: Color(0xFF1F4949),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
