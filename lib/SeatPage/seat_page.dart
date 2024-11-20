import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/HomePage/center_choose_box.dart';
import 'package:flutter_train_app/StationListPage/station_list_page.dart';

class SeatPage extends StatefulWidget {
  SeatPage(this.depatureStation, this.arrivalStaiton);
  String? depatureStation;
  String? arrivalStaiton;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? selectedRow;
  int? selectedCol;
  //선택한 행&열을 변환해주는 함수
  void onSelected(String row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('좌석 선택'),
      ),
      body: Container(
        child: Column(
          children: [
            //출발역→도착역
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${widget.depatureStation}',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
                Icon(Icons.arrow_circle_right_outlined),
                //method로 정리예정
                Text(
                  '${widget.arrivalStaiton}',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatSelectedOption(Colors.purple, '선택됨'),
                SizedBox(
                  width: 20,
                ),
                seatSelectedOption(Colors.grey, '선택안됨')
              ],
            ),

            ///좌석 listview
            Expanded(
              child: ListView(
                children: [
                  frontRow(),
                  seatRow(1),
                  seatRow(2),
                  seatRow(3),
                  seatRow(4),
                  seatRow(5),
                  seatRow(6),
                  seatRow(7),
                  seatRow(8),
                  seatRow(9),
                  seatRow(10),
                  seatRow(11),
                  seatRow(12),
                  seatRow(13),
                  seatRow(14),
                  seatRow(15),
                  seatRow(16),
                  seatRow(17),
                  seatRow(18),
                  seatRow(19),
                  seatRow(20),
                ],
              ),
            ),

            ///예매하기 버튼
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    if (selectedRow != null && selectedCol != null) {
                      showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                                title: Text('예매 하시겠습니까?'),
                                content: Text('$selectedRow -$selectedCol'),
                                actions: [
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '취소',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '확인',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  )
                                ],
                              ));
                    }
                  },
                  child: Text(
                    '예매 하기',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///좌석 열표시 ABCD
  Row frontRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seatContainer('A'),
        seatContainer('B'),
        seatContainer(' '),
        seatContainer('C'),
        seatContainer('D'),
      ],
    );
  }

  ///열표시 container
  Container seatContainer(String text) {
    return Container(
      child: Center(child: Text('$text')),
      height: 50,
      width: 50,
      margin: EdgeInsets.only(top: 2, bottom: 2, right: 2, left: 2),
    );
  }

  ///좌석 container
  Row seatRow(int colNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seat('A', colNum),
        seat('B', colNum),
        SizedBox(
          child: Center(child: Text('$colNum')),
          height: 50,
          width: 50,
        ),
        seat('C', colNum),
        seat('D', colNum),
      ],
    );
  }

  ///좌석 container
  Widget seat(String rowNum, int colNum) {
    return Container(
      child: GestureDetector(
        onTap: () {
          onSelected(rowNum, colNum);
        },
      ),
      margin: EdgeInsets.only(top: 4, bottom: 4, right: 2, left: 2),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: rowNum == selectedRow && colNum == selectedCol
            ? Colors.purple
            : Colors.grey, //색깔지정 ? :
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

// ListView.builder(
  Row seatSelectedOption(Color color, String text) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
        ),
        SizedBox(width: 4),
        Text('$text')
      ],
    );
  }
}
