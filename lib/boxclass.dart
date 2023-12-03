import 'package:hive/hive.dart';

part 'boxclass.g.dart';
@HiveType(typeId: 1)
class boxclass {
@HiveField(0)
String doing;
@HiveField(1)
bool state;
boxclass(this.doing,this.state);
}