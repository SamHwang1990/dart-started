import 'dart:io';
import 'dart:convert';

import 'package:args/args.dart';

const lineNumber = 'line-number';

ArgResults argResults;

main(List<String> args) {
  exitCode = 0;

  final argParser = new ArgParser()..addFlag(lineNumber, negatable: false, abbr: 'n');

  argResults = argParser.parse(args);

  dcat(argResults.rest, argResults[lineNumber]);
}

void dcat(List<String> paths, bool showLineNumber) async {
  stdout.writeln('');

  if (paths.isEmpty) {
    await stdin.pipe(stdout);
  } else {
    for (String path in paths) {
      int lineNumber = 1;
      Stream lines  = new File(path).openRead().transform(utf8.decoder).transform(const LineSplitter());

      try {
        await for (var line in lines) {
          if (showLineNumber) {
            stdout.write('${lineNumber++}: ');
          }

          stdout.writeln(line);
        }
      } catch(_) {
        _handleError(path);
      }
    }
  }
}

_handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('error: ${path} is directory');
  } else {
    exitCode = 2;
  }
}