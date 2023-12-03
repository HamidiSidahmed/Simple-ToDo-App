import 'package:hive/hive.dart';
part 'monthboxclass.g.dart';
@HiveType(typeId: 3)
class monthboxclass{
@HiveField(0)
String doing;

@HiveField(1)
bool state;
monthboxclass(this.doing,this.state);
}