class ValidationMixin {
  String validatePassword(String value) {
    if (value.length < 4) {
      return "Password must be at least 4 characters";
    }
    return null;
  }

  String validateEmail(String value) {
    if (!value.contains("@") ||
        !value.contains(".") ||
        value.indexOf("@") > value.lastIndexOf(".")) {
      return "Please enter valid email";
    }
    return null;
  }
}
