import 'package:intl/intl.dart';

List<String> days = [];


List<String> dates = [
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24'
];

List<int> time = [9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8];
genDat(){
  days.clear();
  dates.clear();
 DateTime date= DateTime.now();
for(int i=0;i<14;i++){
 date= date.add(Duration(days: i));
  days.add(DateFormat("EE").format(date));
dates.add(date.day.toString());
}
}