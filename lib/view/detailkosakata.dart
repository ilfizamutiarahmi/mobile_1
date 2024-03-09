import 'package:flutter/material.dart';
import 'package:mobile_1/models/model_kosakata.dart';

class DetailKosaKata extends StatelessWidget {
  final Datum data;

  DetailKosaKata(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kosakata'),
        backgroundColor: Color.fromARGB(255, 73, 148, 228),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      data.pengucapan,
                      style: const TextStyle(fontSize: 12),
                    ),
                    subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.hanzi,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 5), // Menambahkan jarak antara subtitle dan hanzi
                      Text(
                        data.terjemahan,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  ),
                ],
            ),
        ),
        // child: Card(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           '${data.hanzi}',
        //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //         ),
        //         SizedBox(height: 10),
        //         Text(
        //           '${data.pengucapan}',
        //           style: TextStyle(fontSize: 16),
        //         ),
        //         SizedBox(height: 10),
        //         Text(
        //           '${data.terjemahan}',
        //           style: TextStyle(fontSize: 16),
        //         ),
        //       ],
        //     ),
        //   ),
      ),
    );
  }
}
