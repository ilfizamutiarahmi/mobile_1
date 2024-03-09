import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_1/models/model_kosakata.dart';
import 'package:mobile_1/view/detailkosakata.dart';

class ListKosakata extends StatefulWidget {
  @override
  _ListKosakataState createState() => _ListKosakataState();
}

class _ListKosakataState extends State<ListKosakata> {
  late List<Datum> _kosakataList;
  late List<Datum> _filteredKosakataList;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _kosakataList = [];
    _filteredKosakataList = [];
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
          _filteredKosakataList = _kosakataList;
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
    List<Datum> filteredKosakataList = _kosakataList
        .where((kosakata) =>
            kosakata.pengucapan.toLowerCase().contains(query.toLowerCase()) ||
            kosakata.terjemahan.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _filteredKosakataList = filteredKosakataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _filterKosakataList,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 73, 148, 228),
      ),
      body: _kosakataList.isEmpty
          ? Center(
              child: CircularProgressIndicator(color: Colors.green),
            )
          : ListView.builder(
              itemCount: _filteredKosakataList.length,
              itemBuilder: (context, index) {
                Datum data = _filteredKosakataList[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute( builder: (context) => DetailKosaKata(data),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              data.pengucapan,
                              style: const TextStyle(fontSize: 12),
                            ),
                            subtitle: Text(
                              data.terjemahan,
                              maxLines: 2,
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
