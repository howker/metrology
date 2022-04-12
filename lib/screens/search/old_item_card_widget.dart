// import 'package:flutter/material.dart';

// class ItemCard extends StatelessWidget {
//   final bool applicability;
//   final String? vriId;
//   final String? orgTitle;
//   final String? mitNumber;
//   final String? mitTitle;
//   final String? mitNotation;
//   final String? miModification;
//   final String? miNumber;
//   final String? verificationDate;
//   final String? validDate;
//   final String? resultDocnum;

//   const ItemCard({
//     required this.applicability,
//     Key? key,
//     this.vriId,
//     this.orgTitle,
//     this.mitNumber,
//     this.mitTitle,
//     this.mitNotation,
//     this.miModification,
//     this.miNumber,
//     this.verificationDate,
//     this.validDate,
//     this.resultDocnum,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: [
//           ListTile(
//             visualDensity: const VisualDensity(vertical: -4),
//             title: const Text('Организация - поверитель'),
//             subtitle: Text(orgTitle ?? ''),
//             dense: true,
//           ),
//           ListTile(
//             visualDensity: const VisualDensity(vertical: -4),
//             title: const Text('Рег № типа СИ'),
//             subtitle: Text(mitNumber ?? ''),
//             dense: true,
//           ),
//           ListTile(
//             visualDensity: const VisualDensity(vertical: -4),
//             title: const Text('Наименование типа СИ'),
//             subtitle: Text(mitTitle ?? ''),
//             dense: true,
//           ),
//           ListTile(
//             visualDensity: const VisualDensity(vertical: -4),
//             title: const Text('Обозначение типа СИ'),
//             subtitle: Text(mitNotation ?? ''),
//             dense: true,
//           ),
//           ListTile(
//             visualDensity: const VisualDensity(vertical: -4),
//             title: const Text('Модификация СИ'),
//             subtitle: Text(miModification ?? ''),
//             dense: true,
//           ),
//           ListTile(
//             visualDensity: const VisualDensity(vertical: -4),
//             title: const Text('Заводской/серийный номер'),
//             subtitle: Text(miNumber ?? ''),
//             dense: true,
//           ),
//           ListTile(
//             visualDensity: const VisualDensity(vertical: -4),
//             title: const Text('Дата поверки'),
//             subtitle: Text(verificationDate ?? ''),
//             dense: true,
//           ),
//           ListTile(
//             visualDensity: const VisualDensity(vertical: -4),
//             title: const Text('Действительна до'),
//             subtitle: Text(validDate ?? ''),
//             dense: true,
//           ),
//           ListTile(
//             visualDensity: const VisualDensity(vertical: -4),
//             title: const Text('Номер свидетельства'),
//             subtitle: Text(resultDocnum ?? ''),
//             dense: true,
//           ),
//           ListTile(
//             visualDensity: const VisualDensity(vertical: -4),
//             title: const Text('Пригодность'),
//             subtitle: applicability
//                 ? const Text(
//                     'Пригодно',
//                     style: TextStyle(color: Colors.green),
//                   )
//                 : const Text(
//                     'Непригодно',
//                     style: TextStyle(color: Colors.red),
//                   ),
//             dense: true,
//           ),
//         ],
//       ),
//     );
//   }
// }
