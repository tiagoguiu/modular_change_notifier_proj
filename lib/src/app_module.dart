import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exports.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(() => SharedPreferences.getInstance());
    i.add(()=>LoginController());
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => LoginView(controller: Modular.get<LoginController>()),
    );
    super.routes(r);
  }
}
