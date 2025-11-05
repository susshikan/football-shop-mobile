import 'package:flutter/material.dart';
import 'package:vintage_sports/widgets/left_drawer.dart';

class NewsFormPage extends StatefulWidget {
  const NewsFormPage({super.key});

  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Product fields
  String _name = "";
  int? _price;
  String _description = "";
  String _thumbnail = "";
  String _category = 'match_worn_vintage';
  bool _isFeatured = false;
  String _season = ""; // max 9 chars
  bool _exlusive = false; // keep model's spelling
  String _historyValue = 'classic';

  final List<Map<String, String>> _categoryChoices = const [
    {'value': 'match_worn_vintage', 'label': 'Match Worn Vintage'},
    {'value': 'player_issue_vintage', 'label': 'Player Issue Vintage'},
    {'value': 'replica_vintage', 'label': 'Replica Vintage'},
    {'value': 'reissue_retro', 'label': 'Reissue Retro'},
    {'value': 'special_edition_vintage', 'label': 'Special Edition Vintage'},
    {'value': 'analysis', 'label': 'Analysis'},
  ];

  final List<Map<String, String>> _historyChoices = const [
    {'value': 'classic', 'label': 'Classic'},
    {'value': 'signed_vintage', 'label': 'Signed Vintage'},
    {'value': 'limited_edition', 'label': 'Limited Edition'},
    {'value': 'historical_matches', 'label': 'Historical Matches'},
  ];

  bool _isValidUrl(String value) {
    try {
      final uri = Uri.tryParse(value);
      if (uri == null) return false;
      return uri.isAbsolute && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Form Tambah Produk'),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nama Produk',
                    labelText: 'Nama Produk',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // Price
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Harga (angka)',
                    labelText: 'Harga',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _price = int.tryParse(value);
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harga tidak boleh kosong!';
                    }
                    final parsed = int.tryParse(value);
                    if (parsed == null) {
                      return 'Harga harus berupa angka';
                    }
                    if (parsed < 0) {
                      return 'Harga tidak boleh negatif';
                    }
                    return null;
                  },
                ),
              ),

              // Description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Deskripsi Produk',
                    labelText: 'Deskripsi Produk',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // Thumbnail URL
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'URL Thumbnail (wajib)',
                    labelText: 'URL Thumbnail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _thumbnail = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'URL thumbnail tidak boleh kosong!';
                    }
                    if (!_isValidUrl(value)) {
                      return 'URL tidak valid (gunakan http/https)';
                    }
                    return null;
                  },
                ),
              ),

              // Category
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Kategori',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categoryChoices
                      .map(
                        (c) => DropdownMenuItem<String>(
                          value: c['value'],
                          child: Text(c['label']!),
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _category = newValue ?? 'match_worn_vintage';
                    });
                  },
                ),
              ),

              // Is Featured
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text('Tandai sebagai Produk Unggulan'),
                  value: _isFeatured,
                  onChanged: (value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ),

              // Season
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Musim (contoh: 1998/99)',
                    labelText: 'Musim',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _season = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Musim tidak boleh kosong!';
                    }
                    if (value.length > 9) {
                      return 'Maksimal 9 karakter';
                    }
                    return null;
                  },
                ),
              ),

              // Exlusive (model spelling)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text('Eksklusif'),
                  value: _exlusive,
                  onChanged: (value) {
                    setState(() {
                      _exlusive = value;
                    });
                  },
                ),
              ),

              // History Value
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Nilai Historis',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _historyValue,
                  items: _historyChoices
                      .map(
                        (h) => DropdownMenuItem<String>(
                          value: h['value'],
                          child: Text(h['label']!),
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _historyValue = newValue ?? 'classic';
                    });
                  },
                ),
              ),

              // Save button
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Harga: ${_price ?? ''}') ,
                                    Text('Deskripsi: $_description'),
                                    Text('Thumbnail: $_thumbnail'),
                                    Text('Kategori: $_category'),
                                    Text('Unggulan: ${_isFeatured ? 'Ya' : 'Tidak'}'),
                                    Text('Musim: $_season'),
                                    Text('Eksklusif: ${_exlusive ? 'Ya' : 'Tidak'}'),
                                    Text('Nilai Historis: $_historyValue'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _name = '';
                                      _price = null;
                                      _description = '';
                                      _thumbnail = '';
                                      _category = 'match_worn_vintage';
                                      _isFeatured = false;
                                      _season = '';
                                      _exlusive = false;
                                      _historyValue = 'classic';
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
