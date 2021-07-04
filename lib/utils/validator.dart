import 'package:intl/intl.dart';

class Helper {
  String validateEmpty(String  value) {
    if (value == null || value.isEmpty) {
      return "Field tidak boleh kosong";
    } else {
      return null;
    }
  }

  RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  String validateEmail(String value) {
    String isEmpty = validateEmpty(value);
    if (isEmpty == null) {
      if (_emailRegExp.hasMatch(value)) {
        return null;
      } else {
        return "Formal email salah";
      }
    } else {
      return isEmpty;
    }
  }

  String validatePassword(String value) {
    String isEmpty = validateEmpty(value);

    if (isEmpty == null) {
      if (value.length >= 6) {
        return null;
      } else {
        return "Password minimal 6 karakter";
      }
    } else {
      return isEmpty;
    }
  }

  String validatePhone(String value) {
    String isEmpty = validateEmpty(value);

    if (isEmpty == null) {
      if (value.length > 10 && value.length < 13) {
        return null;
      } else {
        return "Format phone salah";
      }
    } else {
      return isEmpty;
    }
  }

  String formatIDR(dynamic value) => NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'IDR ',
        decimalDigits: 0,
      ).format(value);
}
