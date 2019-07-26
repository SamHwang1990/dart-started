import 'dart:io';
import 'dart:convert';

String _host =InternetAddress.loopbackIPv4.host;

main(List<String> args) async {
  HttpServer server = await HttpServer.bind(_host, 4049);

  await for (HttpRequest request in server) {
    ContentType contentType = request.headers.contentType;
    HttpResponse response = request.response;

    if (request.method == 'POST' && contentType?.mimeType == 'application/json') {
      try {
        String content = await request.transform(utf8.decoder).join();
        Map data = jsonDecode(content) as Map;
        String fileName = request.uri.pathSegments.last;

        await File(fileName).writeAsString(content, mode: FileMode.write);
        response..statusCode =HttpStatus.ok..write('Wrote data for ${data['name']}.');
      } catch(e) {
        response
        ..statusCode =HttpStatus.internalServerError
        ..write('Exception during file I/O: $e.');
      }
    } else {
      response..statusCode = HttpStatus.methodNotAllowed
      ..write('Unsupported request: ${request.method}');
    }

    await response.close();
  }

}