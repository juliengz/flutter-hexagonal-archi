// ignore: camel_case_types
typedef onSuccessCB<T> = void Function(T? data);
// ignore: camel_case_types
typedef onErrorCB<T> = void Function(T? data);

abstract class RequestStatusInterface<ResponseData> {
  RequestStatusInterface onSuccess(onSuccessCB<ResponseData> callback);
  RequestStatusInterface onError(onErrorCB<ResponseData> callback);
}

class PostsRequest<ResponseData>
    implements RequestStatusInterface<ResponseData> {
  ResponseData? data;
  ResponseData? errors;

  @override
  PostsRequest({
    this.data,
    this.errors,
  }) : super();

  @override
  PostsRequest onSuccess(onSuccessCB<ResponseData> callback) {
    if (data != null) callback(data);
    return this;
  }

  @override
  PostsRequest onError(onSuccessCB<ResponseData> callback) {
    if (errors != null) callback(errors);
    return this;
  }
}

class FailedRequest<ResponseData>
    implements RequestStatusInterface<ResponseData> {
  ResponseData? errors;

  @override
  FailedRequest({
    required this.errors,
  }) : super();

  @override
  FailedRequest onSuccess(onSuccessCB<ResponseData> callback) {
    return this;
  }

  @override
  FailedRequest onError(onErrorCB<ResponseData> callback) {
    callback(errors);
    return this;
  }
}
