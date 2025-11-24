import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/enums/view_state.dart';
import 'package:hustler_syn/core/model/app_user.dart';
import 'package:hustler_syn/core/services/data_base_services.dart';

class ProfileViewModel extends BaseViewModel {
  DataBaseServices _db = DataBaseServices();
  AppUserModel appUser = AppUserModel();

  ///
  ///. get user data
  ///
  Future<void> userData() async {
    try {
      setState(ViewState.busy);

      final fetchedUser = await _db.getCurrentUserData();

      if (fetchedUser != null) {
        appUser = fetchedUser;
      } else {
        print('No user data found');
      }

      setState(ViewState.idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewState.idle);
    }
  }

 
}
