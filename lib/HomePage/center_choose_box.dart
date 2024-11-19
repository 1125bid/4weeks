import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_train_app/StationListPage/station_list_page.dart';

///TODO 출발역 list에서 역 선택시 출발역 이름 변경
///TODO 도착역 list에서 역 선택시 도착역 이름 변경
class CenterChooseBox extends StatelessWidget {
  CenterChooseBox(this.depatureStation, this.arrivalStation, this.onSelected);
  String? depatureStation;
  String? arrivalStation;
  void Function(String? depature, String? arrival) onSelected;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    final depature = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return StationListPage('출발역');
                        },
                      ),
                    );
                    if (depature != null) {
                      onSelected(depature, arrivalStation);
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '출발역',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        depatureStation ?? '선택',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
                centerContainer(),
                GestureDetector(
                  onTap: () async {
                    final arrival = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return StationListPage('도착역');
                        },
                      ),
                    );
                    if (arrival != null) {
                      onSelected(depatureStation, arrival);
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '도착역',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        arrivalStation ?? '선택',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Container centerContainer() {
  return Container(
    width: 2,
    height: 50,
    decoration: BoxDecoration(color: Colors.grey[400]),
  );
}

//●column
//  text