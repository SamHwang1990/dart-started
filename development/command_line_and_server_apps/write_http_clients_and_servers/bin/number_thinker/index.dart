import 'dart:io';

const int myNumber = 3;

main(List<String> args) async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 4041);

  print('Listening to localhost:4041');

  await for (HttpRequest request in server) {
    if (request.method == 'GET') {
      await _handleGetRequest(request);
    } else {
      await request.response
      ..statusCode =HttpStatus.methodNotAllowed
      ..write('Error: Unsupported request: ${request.method}')
      ..close();
    }
  }
}

_handleGetRequest(HttpRequest request) async {
  if (request.uri.path == '/make_a_guess.html') {
    File html = new File('bin/number_thinker/make_a_guess.html');

    request.response
    ..statusCode =HttpStatus.ok
    ..headers.contentType = ContentType.html;

    await html.openRead().pipe(request.response);
    
    request.response..close();
  } else {
    String guess = request.uri.queryParameters['q'];

    request.response
    ..statusCode =HttpStatus.ok
    ..writeln(guess ==myNumber.toString() ? 'true' : "I'm thinking another number.")
    ..close();
  }
}