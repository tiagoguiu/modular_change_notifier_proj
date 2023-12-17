import 'package:flutter_modular/flutter_modular.dart';

import '../exports.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<LocalStorageService>(() => LocalStorageSharedPrefs());
    i.add<LoginDatasource>(() => LoginDatasourceImpl(Modular.get()));
    i.add<LoginRepository>(() => LoginRepositoryImpl(Modular.get()));
    i.add<LoginController>(() => LoginController(Modular.get()));
    i.add<CollectInfoDatasource>(() => CollectInfoDatasourceImpl(Modular.get()));
    i.add<CollectInfoRepository>(() => CollectInfoRepositoryImpl(Modular.get()));
    i.add<CollectInfoController>(() => CollectInfoController(Modular.get()));
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => LoginView(controller: Modular.get<LoginController>()),
    );
    r.child(
      '/collect-info',
      child: (_) => CollectInfoView(
        controller: Modular.get<LoginController>(),
        infoController: Modular.get<CollectInfoController>(),
      ),
    );
    super.routes(r);
  }
}
