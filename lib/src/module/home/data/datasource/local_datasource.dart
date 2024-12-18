
import 'package:injectable/injectable.dart';

abstract class LocalDatasource {

}
@LazySingleton(as: LocalDatasource)
class ProductLocalDatasource implements LocalDatasource{

}