import 'package:flutter/cupertino.dart';
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
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      (depatureStation != null && arrivalStation != null)
                          ? Colors.purple
                          : Colors.grey[400],
                  foregroundColor: Colors.white),
              onPressed: () async {
                if (depatureStation == null) {
                  await goListPage(context, true);
                  //UX적 부분 출발역이 null이면 도착역 선택하지 않고 처음으로 돌아감
                  if (depatureStation == null) {
                    return;
                  }
                }
                if (arrivalStation == null) {
                  await goListPage(context, false);
                }
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
            ),
          )
        ]),
      ),
    );
  }

  Future<dynamic> goListPage(BuildContext context, bool isDepature) {
    return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text('알림!'),
              content: Text(isDepature ? '출발역을 선택해주세요.' : '도착역을 선택해주세요.'),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('확인'),
                ),
                CupertinoDialogAction(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return StationListPage(
                              isDepature ? '출발역' : '도착역',
                              isDepature == true
                                  ? arrivalStation
                                  : depatureStation);
                        },
                      ),
                    );
                    if (result != null) {
                      if (isDepature) {
                        onSelected(result, arrivalStation);
                      } else {
                        onSelected(depatureStation, result);
                      }
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    isDepature ? '출발역 선택' : '도착역 선택',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ));
  }
}
