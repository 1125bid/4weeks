import 'package:flutter/material.dart';
import 'package:flutter_train_app/HomePage/center_choose_box.dart';
import 'package:flutter_train_app/SeatPage/seat_page.dart';
import 'package:flutter_train_app/StationListPage/station_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? depatureStation;
  String? arrivalStation;
  void onSelected(String? depature, String? arrival) {
    setState(() {
      depatureStation = depature;
      arrivalStation = arrival;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('기차예매'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CenterChooseBox(depatureStation, arrivalStation, onSelected),
          SizedBox(height: 20),

          ///좌선 선택버튼
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, foregroundColor: Colors.white),
            onPressed: () async {
              if (depatureStation != null && arrivalStation != null)
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return SeatPage(
                    '$depatureStation',
                    '$arrivalStation',
                  );
                }));
            },
            child: Text(
              '좌석선택',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
