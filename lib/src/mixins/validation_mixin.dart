class ValidationMixin {
  String? validateEmail(value) {
        if(value?.contains('@') != true) {
          return 'Please enter a valid email';
        }
        return null;
      }

      String? validatePassword(value) {
        if(value != null && value.length < 4) {
          return 'Password must be at least 4 characters';
        }
        return null;
      }
}