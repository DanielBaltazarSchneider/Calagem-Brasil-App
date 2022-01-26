extension AppString on String {
  String toFirstUpperCase() => (this == "") ? "" : "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";

  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';

  String get allInCaps => this.toUpperCase();

  String get capitalizeFirstofEach => this.split(" ").map((str) => str.substring(0, 1).toUpperCase() + str.substring(1, str.length).toLowerCase()).join(" ");
}
