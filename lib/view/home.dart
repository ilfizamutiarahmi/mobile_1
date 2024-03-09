import 'package:flutter/material.dart';
import 'package:mobile_1/models/model_kosakata.dart';
import 'package:mobile_1/view/detailkosakata.dart';
import 'package:mobile_1/view/searchkosakata.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Datum> _kosakataList = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _fetchKosakata();
  }

  Future<void> _fetchKosakata() async {
    try {
      http.Response res = await http.get(
        Uri.parse('http://192.168.1.10/kamus/getKamus.php'),
      );
      if (res.statusCode == 200) {
        setState(() {
          _kosakataList = modelKosaKataFromJson(res.body).data;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void _filterKosakataList(String query) {
    // Filter list based on query
    List<Datum> filteredKosakataList = _kosakataList
        .where((kosakata) =>
            kosakata.pengucapan.toLowerCase().contains(query.toLowerCase()) ||
            kosakata.terjemahan.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _kosakataList = filteredKosakataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamus Mandarin - Indonesia'),
        backgroundColor: Color.fromARGB(255, 73, 148, 228),

        actions: [
          IconButton(
            onPressed: () {
              _searchController.clear();
              _fetchKosakata();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterKosakataList,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _kosakataList.length,
                itemBuilder: (context, index) {
                  Datum data = _kosakataList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailKosaKata(data),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(data.pengucapan),
                        subtitle: Text(data.terjemahan),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
