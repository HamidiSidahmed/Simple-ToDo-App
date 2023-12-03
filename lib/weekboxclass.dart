import 'package:hive/hive.dart';

part 'weekboxclass.g.dart';
@HiveType(typeId: 2)
class weekboxclass {
  @HiveField(0)
  String doing;
  @HiveField(1)
  bool state;
  
  weekboxclass(this.doing,this.state);
}