import 'package:flutter/material.dart';
import '../modelos/producto.dart';
import 'pantalla_carrito.dart';

class PantallaCategorias extends StatefulWidget {
  @override
  _PantallaCategoriasState createState() => _PantallaCategoriasState();
}

class _PantallaCategoriasState extends State<PantallaCategorias> {
  final List<Producto> productos = [
    Producto(nombre: 'Zapato Deportivo', imagen: 'assets/categoria_0.png', precio: 50.0),
    Producto(nombre: 'Zapato Formal', imagen: 'assets/categoria_1.png', precio: 70.0),
    Producto(nombre: 'Sandalias', imagen: 'assets/categoria_2.jpg', precio: 30.0),
  ];

  final List<Producto> carrito = [];

  void agregarAlCarrito(Producto producto) {
    setState(() {
      carrito.add(producto);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${producto.nombre} agregado al carrito')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías de Zapatos'),
        backgroundColor: Colors.brown[500],
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PantallaCarrito(carrito: carrito),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown.shade100, Colors.brown.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productos.length,
          itemBuilder: (BuildContext context, int index) {
            final producto = productos[index];
            return Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      producto.imagen,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(producto.nombre),
                  Text('\$${producto.precio.toStringAsFixed(2)}'),
                  ElevatedButton(
                    onPressed: () => agregarAlCarrito(producto),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[99],
                    ),
                    child: Text('Agregar al carrito'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
