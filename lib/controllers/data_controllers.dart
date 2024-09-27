import 'package:get/get.dart';
import 'package:paymentapp/services/data_services.dart';

class DataControllers extends GetxController{
  var list = [].obs;
  // ignore: unnecessary_new
  final service = new DataServices();
  final _loading= false.obs;


  get loading => _loading.value;

  @override
  void onInit(){
    _loadData();
    super.onInit();
  }

  get newList =>  list.where((e) => e["status"]).map((e) =>e).toList();



  _loadData() async{
    _loading.value=false;
    try{
      var info = service.getUsers();
      list.addAll(await info);
    }catch(e){
      print("Ecountered error !");
      print(e);
    }finally{
      _loading.value=true;
    }

  }
}