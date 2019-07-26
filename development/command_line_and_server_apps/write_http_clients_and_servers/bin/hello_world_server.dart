import 'dart:io';

main(List<String> args) async {
  HttpServer server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040
  );

  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response.write('Hello World');
    await request.response.close();
  }
}