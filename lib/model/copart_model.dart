class InfoCarModel {
  final String carModel;
  final String vinCode;
  final String venType;
  final String engine;
  final String fuelType;
  final String document;
  final String venLocation;
  final String selliingBranch;

  InfoCarModel({
    required this.carModel,
    required this.vinCode,
    required this.venType,
    required this.engine,
    required this.fuelType,
    required this.document,
    required this.venLocation,
    required this.selliingBranch,
  });

  InfoCarModel.fromJson(Map<String, dynamic> json)
      : carModel = json['title'],
        vinCode = json['vin_number'],
        venType = json['vehicle'],
        engine = json['engine'],
        fuelType = json['fuel_type'],
        document = json['document_info'],
        venLocation = json['vehicle_location'],
        selliingBranch = json['selling_branch'];
}
