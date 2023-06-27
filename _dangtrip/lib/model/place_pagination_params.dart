import 'package:json_annotation/json_annotation.dart';
part 'place_pagination_params.g.dart';

@JsonSerializable()
class PlacePaginationParams {
  final int? page;
  const PlacePaginationParams({
    this.page,
  });

  PlacePaginationParams copyWith({
    int? page,
  }) {
    return PlacePaginationParams(
      page: page ?? this.page,
    );
  }

  factory PlacePaginationParams.fromJson(Map<String, dynamic> json) =>
      _$PlacePaginationParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PlacePaginationParamsToJson(this);
}
