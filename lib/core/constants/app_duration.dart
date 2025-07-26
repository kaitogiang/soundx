class AppDuration {
  static Duration to100Milis() {
    return _toMiliseconds(100);
  }

  static Duration to50Milis() {
    return _toMiliseconds(50);
  }

  static Duration to200Milis() {
    return _toMiliseconds(200);
  }

  static Duration _toMiliseconds(int milis) {
    return Duration(milliseconds: milis);
  }
}
