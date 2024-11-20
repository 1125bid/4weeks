import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  StationListPage(this.station, this.ignoreStation);
  String station;
  String? ignoreStation;
  List<String> stationlist = [
    "수서",
    "동탄",
    "평택지제",
    "천안아산",
    "오송",
    "대전",
    "김천구미",
    "동대구",
    "경주",
    "울산",
    "부산"
  ];

  @override
  Widget build(BuildContext context) {
    final stations =
        stationlist.where((station) => station != ignoreStation).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('$station'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, '${stations[index]}');
                },
                child: Text(
                  '${stations[index]}',
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
          );
        },
      ),
    );
  }
}
