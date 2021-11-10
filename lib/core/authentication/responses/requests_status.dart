// ignore: camel_case_types
typedef onSuccessCB<T> = void Function(T? data);
// ignore: camel_case_types
typedef onErrorCB<T> = void Function(T? error);

enum RequestStatusType { none, loading, success, error }

class RequestStatus<ResponseData> {
  RequestStatus();

  RequestStatus onSuccess(onSuccessCB<ResponseData> callback) {
    return this;
  }

  RequestStatus onError(onErrorCB callback) {
    return this;
  }
}

// Success request
class SuccessRequest<ResponseData> extends RequestStatus<ResponseData> {
  ResponseData? data;

  SuccessRequest({
    this.data,
  }) : super();

  @override
  SuccessRequest onSuccess(onSuccessCB<ResponseData> callback) {
    callback(data);
    return this;
  }
}

// Failed request
class FailedRequest<ResponseData> extends RequestStatus<ResponseData> {
  ResponseData? error;

  FailedRequest({
    required this.error,
  }) : super();

  @override
  FailedRequest onError(onErrorCB callback) {
    callback(error);
    return this;
  }
}
