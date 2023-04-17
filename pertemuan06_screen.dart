import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pertemuan06/pertemuan06_provider.dart';
import 'package:provider/provider.dart';

class Pertemuan06Screen extends StatefulWidget {
  const Pertemuan06Screen({super.key});

  @override
  State<Pertemuan06Screen> createState() => _Pertemuan06ScreenState();
}

class _Pertemuan06ScreenState extends State<Pertemuan06Screen> {
  //list item
  String itemSelected = 'Pilih Pekerjaan';
  List items = <String>[
    'Pilih Pekerjaan',
    'Mahasiswa',
    'Dosen',
    'Programmer',
    'UI UX Desainer',
    'IT Consultan',
    'Project Manager',
    'PNS',
    'Wiraswasta'
  ];

  //list cita cita
  String itemCitaCita = 'Pilih Cita Cita';
  List itemFavorit = <String>[
    'Pilih Cita Cita',
    'Menjadi desainer',
    'Menjadi Programmer',
    'Menjadi Penulis Blog',
    'Membangun Perusahaan',
    'Menjadi Customer'
  ];

  //List rincian cita cita
  final Map<String, String> _rincianCitaCita = {
    'Pilih Cita Cita': 'Silahkan memilih cita cita',
    'Menjadi desainer':
        'Saya ingin menjadi sponsor Brand app yang terletak di jakarta',
    'Menjadi Programmer':
        'Saya ingin menjadi programmer karena bisa melakukan banyak eksperiment',
    'Menjadi Penulis Blog':
        'Saya ingin menjadi penulis blogger professional kemudian dapat dimengerti oleh Ai',
    'Membangun Perusahaan':
        'Saya ingin membangun perusahaan bisnis layanan internet publik wifi autopilot',
    'Menjadi Customer':
        'Saya ingin menjadi customer service untuk membantu pengguna mengatasi masalah penggunaan teknologi aplikasi'
  };

  //Gambar sesuai cita cita

  final Map<String, String> _rincianGambarCitaCita = {
    'Pilih Cita Cita':
        'https://thumbs.dreamstime.com/z/expectations-human-mind-pictured-as-word-inside-head-to-symbolize-relation-psyche-d-illustration-172337080.jpg',
    'Menjadi desainer':
        'https://stickearn.com/storage/app/uploads/public/642/fa6/6b6/642fa66b6d62c286811334.jpg',
    'Menjadi Programmer':
        'https://2.bp.blogspot.com/-Z1yZ88JNGMY/WXmpsT99yjI/AAAAAAAAHQs/cqxT-PZRcXgpOVtE8PmABsUZjT0NaLK8ACLcBGAs/s1600/php%2Band%2Bcoffe.jpg',
    'Menjadi Penulis Blog':
        'https://only-print.com/wp-content/uploads/2020/09/pexels-photo-1448709-1024x681.jpeg',
    'Membangun Perusahaan':
        'https://qubisastorage.blob.core.windows.net/files/articles/galleries/2930/images/img/2930-20221004181453437.jpg',
    'Menjadi Customer':
        'https://idcloudhost.com/wp-content/uploads/2022/03/idch-covers-582-1280x720.jpg'
  };

  String _pilihGambarUrl = '';

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan06Provider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Switches | DropdownB.')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Darkmode mode theme'),
                Switch(
                    value: prov.enableDarkMode,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      prov.setBrightness = val;
                    })
              ],
            ),
            Consumer<Pertemuan06Provider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tampilkan Dropdown'),
                        Switch(
                            value: prov.isDropdownShow,
                            activeColor: Colors.blue,
                            onChanged: (val) {
                              prov.isDropdownShow = val;
                            })
                      ],
                    ),
                    Visibility(
                      visible: prov.isDropdownShow,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Pekerjaan'),
                              DropdownButton(
                                  items: items.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item),
                                      value: item,
                                    );
                                  }).toList(),
                                  value: itemSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      itemSelected = val as String;
                                    });
                                  })
                            ],
                          ),
                          Row(
                            children: [
                              Text('Pekerjaan: $itemSelected'),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Cita Cita'),
                              DropdownButton(
                                  items: itemFavorit.map((itemcheck) {
                                    return DropdownMenuItem(
                                      child: Text(itemcheck),
                                      value: itemcheck,
                                    );
                                  }).toList(),
                                  value: itemCitaCita,
                                  onChanged: (val) {
                                    setState(() {
                                      itemCitaCita = val as String;
                                      _pilihGambarUrl =
                                          _rincianGambarCitaCita[val] as String;
                                    });
                                  })
                            ],
                          ),
                          Row(
                            children: [Text('Cita Cita: $itemCitaCita')],
                          ),
                          Row(
                            children: [
                              Text('Rincian Cita Cita: '),
                              Flexible(
                                child: Text(
                                    _rincianCitaCita[itemCitaCita] ?? "Any"),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _pilihGambarUrl.isNotEmpty
                                  ? Flexible(
                                      child: Image.network(
                                        _pilihGambarUrl,
                                        height: 250,
                                        width: 500,
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
