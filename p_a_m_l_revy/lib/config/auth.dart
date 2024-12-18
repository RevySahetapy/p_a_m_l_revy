import 'package:p_a_m_l_revy/app/models/users.dart';

Map<String, dynamic> authConfig = {
  'guards': {
    'default': {
      'provider': Users(),
    }
  }
};
