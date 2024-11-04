enum StatusCode {
  notFound,
  badRequest,
  serverError,
  connectionError,
  success,
  unauthorized,
  forbidden,
  conflict,
  tooManyRequest,
  timeOut,
  unknown;
}

StatusCode getStatus(int statusCode) {
  switch (statusCode) {
    case 201:
    case 200:
    case 204:
    case 208:
      return StatusCode.success;
    case 400:
      return StatusCode.badRequest;
    case 401:
      return StatusCode.unauthorized;
    case 403:
      return StatusCode.forbidden;
    case 404:
      return StatusCode.notFound;
    case 409:
      return StatusCode.conflict;
    case 429:
      return StatusCode.tooManyRequest;
    case 500:
    case 502:
      return StatusCode.serverError;
    case 504:
      return StatusCode.timeOut;
    default:
      return StatusCode.unknown;
  }
}
