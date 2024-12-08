import 'package:flutter/material.dart';
import '../modelos/producto.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PantallaCarrito extends StatelessWidget {
  final List<Producto> carrito;

  PantallaCarrito({required this.carrito});

  void generarFactura(List<Producto> carrito) async {
    final pdf = pw.Document();
    double total = carrito.fold(0, (sum, item) => sum + item.precio);

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Factura', style: pw.TextStyle(fontSize: 24)),
            pw.Divider(),
            ...carrito.map((producto) => pw.Text('${producto.nombre}: \$${producto.precio.toStringAsFixed(2)}')),
            pw.Divider(),
            pw.Text('Total: \$${total.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    double total = carrito.fold(0, (sum, item) => sum + item.precio);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: ListView.builder(
        itemCount: carrito.length,
        itemBuilder: (context, index) {
          final producto = carrito[index];
          return ListTile(
            leading: Image.asset(producto.imagen, width: 50, height: 50),
            title: Text(producto.nombre),
            subtitle: Text('\$${producto.precio.toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$${total.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: () {
                generarFactura(carrito);
              },
              child: Text('Generar Factura'),
            ),
          ],
        ),
      ),
    );
  }
}