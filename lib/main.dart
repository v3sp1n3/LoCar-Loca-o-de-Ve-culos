
import 'package:flutter/material.dart';

void main() => runApp(const LoCarApp());

class LoCarApp extends StatelessWidget {
  const LoCarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lo-Car Veículos',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cars = [
      "Toyota Corolla","Honda Civic","Jeep Compass","Fiat Pulse",
      "HB20","Onix","T-Cross","Kicks","Kwid","Peugeot 208","BYD Dolphin","Fiat Toro"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lo-Car Veículos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProfilePage()));
            },
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cars.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (_, i) => Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CarDetailsPage(car: cars[i]),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.directions_car, size: 50),
                Text(cars[i]),
                const Text("Ano: 2024"),
                const Text("R\$ 250/dia"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarDetailsPage extends StatelessWidget {
  final String car;
  const CarDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(car)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(car, style: const TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Ano: 2024"),
            const Text("KM: 12.000"),
            const Text("Seguro: R\$50/dia"),
            const Text("Avarias: Nenhuma"),
            const Spacer(),
            FilledButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => RentalPage(car: car)));
              },
              child: const Text("ALUGAR AGORA"),
            )
          ],
        ),
      ),
    );
  }
}

class RentalPage extends StatelessWidget {
  final String car;
  const RentalPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Locação")),
      body: Center(
        child: FilledButton(
          child: const Text("Prosseguir para Pagamento"),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (_) => PaymentPage(car: car)));
          },
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final String car;
  const PaymentPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pagamento")),
      body: ListView(
        children: [
          ListTile(title: Text("Nubank ****4587")),
          ListTile(title: Text("Inter ****2145")),
          ListTile(title: Text("Itaú ****7895")),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ReceiptPage(car: car)));
              },
              child: const Text("CONFIRMAR"),
            ),
          )
        ],
      ),
    );
  }
}

class ReceiptPage extends StatelessWidget {
  final String car;
  const ReceiptPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comprovante")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.check_circle,size: 80),
            Text("Locação confirmada - $car"),
            const Text("Valor total: R\$1.500"),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: ()=>Navigator.popUntil(context,(r)=>r.isFirst),
              child: const Text("Voltar ao Início"),
            )
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Minha Conta")),
      body: ListView(
        children: const [
          ListTile(title: Text("Alterar Nome")),
          ListTile(title: Text("Alterar Foto")),
          ListTile(title: Text("Agendamentos de Locação")),
          ListTile(title: Text("Histórico")),
          ListTile(title: Text("Cancelar Locação")),
          ListTile(title: Text("Forma de Pagamento")),
          ListTile(title: Text("Excluir Conta")),
        ],
      ),
    );
  }
}
