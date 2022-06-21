// check if email is valid using regex.
bool isValidEmail(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  return (!regex.hasMatch(email)) ? false : true;
}

bool isPasswordValid(String value, String countryCode) {
  switch (countryCode) {
    case 'AE':
      return value.length >= 8;
    case 'BH':
      return value.length >= 8;
    default:
      return value.length >= 8;
  }
}

bool doPasswordsMatch(String password, String passwordConfirm) =>
    (password == passwordConfirm);
