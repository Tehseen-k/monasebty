class BaseResponse {
  late bool success;
  String? error;

  BaseResponse(this.success, {this.error});

  BaseResponse.fromJson(json) {
    this.success = true;
    this.error = json["error"] != null ? json["error"] : null;
  }

  toJson() {
    return {
      'success': this.success,
      'message': this.error,
    };
  }
}
