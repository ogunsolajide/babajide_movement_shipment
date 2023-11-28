// import 'package:flutter/material.dart';
//
// class Test extends StatefulWidget {
//   const Test({super.key});
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: Text('Home Screen Content'),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calculate),
//             label: 'Calculate',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.local_shipping),
//             label: 'Shipment',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: 0,
//         onTap: (index) {
//           // Handle navigation to different screens
//           if (index == 0) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => Test()),
//             );
//           } else if (index == 1) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => CalculateScreen()),
//             );
//           } else if (index == 2) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => ShipmentScreen()),
//             );
//           } else if (index == 3) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// class CalculateScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calculate'),
//       ),
//       body: Center(
//         child: Text('Calculate Screen Content'),
//       ),
//     );
//   }
// }
//
// class ShipmentScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shipment'),
//       ),
//       body: Center(
//         child: Text('Shipment Screen Content'),
//       ),
//     );
//   }
// }
//
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Center(
//         child: Text('Profile Screen Content'),
//       ),
//     );
//   }
// }