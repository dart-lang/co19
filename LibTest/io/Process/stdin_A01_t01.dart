// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion IOSink stdin
///
/// Returns the standard input stream of the process as an IOSink.
///
/// @description Checks that [stdin] returns the standard input stream of the
/// process as an IOSink.
/// @author ngl@unipro.ru

import 'dart:convert';
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

runMain() {
  String command = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  List<String> args = [...Platform.executableArguments,
    eScript,
    '1',
    '2',
    'true'
  ];

  bool found = false;
  asyncStart();
  Process.start(command, args).then((Process process) {
    process.stdout.transform(utf8.decoder).transform(const LineSplitter()).
      toList().then((List event) {
      for (int i = 0; i < event.length; i++) {
        if (event[i].contains("Hello, world!Hello, galaxy!Hello, universe!")) {
          found = true;
        }
      }
    }).then((_) {
      Expect.isTrue(found);
      asyncEnd();
    });
    process.stdin.write('Hello, world!');
    process.stdin.write('Hello, galaxy!');
    process.stdin.write('Hello, universe!');
    process.stdin.close();
  });
}

runProcess(List<String> arguments) {
  if (arguments.length > 0) {
    stdout.write(arguments[0]);
  }
  if (arguments.length > 1) {
    stderr.write(arguments[1]);
  }
  if (arguments.length > 2) {
    stdin.listen((List<int> event){
      Utf8Decoder decoder = new Utf8Decoder();
      String decoded = decoder.convert(event);
      stdout.write(decoded);
    });
  }
}

main(List<String> args) {
  if(args.length > 0)
    runProcess(args);
  else {
    runMain();
  }
}
