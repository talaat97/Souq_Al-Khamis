import '../../../core/class/curd.dart';
import '../../../link_api.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(Applink.test, {});
   // print('============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
}
