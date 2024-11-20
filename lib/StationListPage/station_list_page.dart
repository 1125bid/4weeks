import 'package:flutter/material.dart';

///도착역&출발역을 선택하는 페이지
//TODO listview에서 선택하면 이전페이지로 이동
//TODO listview에서 선택하면 출발역 또는 출발역 정보를 갖고 홈페이지로 이동
//TODO 도착페이지와 출발페이지의 appbar 이름 변경

class StationListPage extends StatelessWidget {
  StationListPage(this.station);
  String station;
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
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$station'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: stationlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, '${stationlist[index]}');
                  String station = stationlist[index];
                  stationlist.remove(station);
                },
                child: Text(
                  '${stationlist[index]}',
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
