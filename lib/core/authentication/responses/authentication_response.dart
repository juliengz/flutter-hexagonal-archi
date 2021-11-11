// ignore: camel_case_types
typedef onSuccessCB<T> = void Function(T? data);
// ignore: camel_case_types
typedef onErrorCB<T> = void Function(T? error);

enum AuthenticationResponseType { none, loading, success, error }

class AuthenticationResponse<ResponseData> {
  AuthenticationResponse();

  AuthenticationResponse onSuccess(onSuccessCB<ResponseData> callback) {
    return this;
  }

  AuthenticationResponse onError(onErrorCB callback) {
    return this;
  }
}

// Success request
class AuthenticationResponseSuccess<ResponseData>
    extends AuthenticationResponse<ResponseData> {
  ResponseData? data;

  AuthenticationResponseSuccess({
    this.data,
  }) : super();

  @override
  AuthenticationResponseSuccess onSuccess(onSuccessCB<ResponseData> callback) {
    callback(data);
    return this;
  }
}

// Failed request
class AuthenticationResponseFailure<ResponseData>
    extends AuthenticationResponse<ResponseData> {
  ResponseData? error;

  AuthenticationResponseFailure({
    required this.error,
  }) : super();

  @override
  AuthenticationResponseFailure onError(onErrorCB callback) {
    callback(error);
    return this;
  }
}
