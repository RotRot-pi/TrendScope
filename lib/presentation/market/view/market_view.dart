// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class MarketView extends ConsumerWidget {
//   const MarketView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final marketData = ref.watch(marketDataProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Market'),
//       ),
//       body: marketData.when(
//         data: (data) {
//           return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               final item = data[index];
//               return ListTile(
//                 title: Text(item.symbol),
//                 subtitle: Text(item.name),
//               );
//             },
//           );
//         },
//         error: (error, stackTrace) => Text('Error: $error'),
//         loading: () => const Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }

// // final marketDataProvider = FutureProvider<List<MetaData>>((ref) async {
// //   final dio = await ref.watch(dioProvider.future);
// //   final response =
// //       await dio.get<List<dynamic>>('query?function=LISTING_STATUS&apikey=demo');
// //   return response.data.map((e) => MetaData.fromJson(e)).toList();
// // });
// // 