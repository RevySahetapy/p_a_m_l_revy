import 'package:vania/vania.dart';
import 'package:p_a_m_l_revy/route/api_route.dart';
import 'package:p_a_m_l_revy/route/web.dart';
import 'package:p_a_m_l_revy/route/web_socket.dart';

class RouteServiceProvider extends ServiceProvider {
  @override
  Future<void> boot() async {}

  @override
  Future<void> register() async {
    WebRoute().register();
    ApiRoute().register();
    WebSocketRoute().register();
  }
}
