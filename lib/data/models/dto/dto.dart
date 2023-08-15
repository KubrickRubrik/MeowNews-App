/// Extension class for passing data from the `Presentation` -> `Data`
abstract base class Dto {
  String? actionApi;

  Map<String, dynamic> toMapRequest();
}
