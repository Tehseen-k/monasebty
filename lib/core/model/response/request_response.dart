class RequestResponse {
  late bool success;
  String? message;
  String? error;
  late var data;

  RequestResponse(this.success, {this.error, this.data});

  RequestResponse.fromJson(json) {
    try {
      this.data = json;
      this.message = json.data["message"];
      this.success = json.data["success"];
      this.error = json.data['error'];
    } catch (e) {
      print("errorRequestResponse => $e");
    }
  }

  toJson() {
    return {
      'success': this.success,
      'message': this.message,
      'error': this.error,
      'body': this.data,
    };
  }
}
