import 'package:frontend_ecommerce_app/global_variable.dart';
import 'package:frontend_ecommerce_app/model/user.dart';
import 'package:frontend_ecommerce_app/services/manage_http_response.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<void> signUpUsers({
    required context,
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        fullName: fullName,
        email: email,
        state: '',
        city: '',
        locality: '',
        password: password,
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.tojson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showsnackbar(context, 'Account created successfully');
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
