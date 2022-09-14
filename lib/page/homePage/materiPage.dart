import 'package:bebras_task/constant.dart';
import 'package:bebras_task/page/materiPage/pdfViewPage.dart';
import 'package:bebras_task/page/materiPage/youtubeVideo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            "Materi",
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        Container(margin: EdgeInsets.only(top: 100), child: Expansiontile()),
        Container(
            margin: EdgeInsets.only(top: 30), child: ExpansiontilePodcast()),
      ],
    );
  }
}

class Expansiontile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appWhite,
                border: Border.all(color: Colors.grey.shade400)),
            child: ExpansionTile(
              title: Text(
                "Materi Latihan",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('Latihan 1-1'),
                  onTap: () {
                    openPDF(context, 'BukuBebras2018 SD v.5 rev-1.pdf');
                  },
                ),
                ListTile(
                  title: Text('Latihan 1-2'),
                  onTap: () {
                    openPDF(context, 'BukuBebras2017_SD.pdf');
                  },
                ),
                ListTile(
                  title: Text('Latihan 1-3'),
                  onTap: () {
                    openPDF(context, 'Bebras-Challenge-2016_Siaga.pdf');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openPDF(BuildContext context, String url) => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => PDFViewerPage(
                  url: url,
                )),
      );
}

class ExpansiontilePodcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appWhite,
                border: Border.all(color: Colors.grey.shade400)),
            child: ExpansionTile(
              title: Text(
                "Materi Podcast",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('Ep. 1: "Apa itu Computational Thinking?"'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => youtubeVideoScreen(
                                url: 'Z_HnjgZT8HU',
                                title:
                                    'Ep. 1: "Apa itu Computational Thinking?"',
                              )),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
