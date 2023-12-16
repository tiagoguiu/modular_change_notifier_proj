import 'package:flutter_modular/flutter_modular.dart';

import '../exports.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<LocalStorageService>(() => LocalStorageSharedPrefs()..init());
    i.add<LoginDatasource>(() => LoginDatasourceImpl(Modular.get()));
    i.add<LoginRepository>(() => LoginRepositoryImpl(Modular.get()));
    i.add<LoginController>(() => LoginController(Modular.get()));
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
