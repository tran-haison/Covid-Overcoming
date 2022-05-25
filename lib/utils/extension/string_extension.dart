extension StringExtension on String {
  bool get isValidEmail {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return isNotEmpty && RegExp(pattern).hasMatch(this);
  }

  bool get isValidPassword {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return isNotEmpty && RegExp(pattern).hasMatch(this);
  }
}
