// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<List<int>> stderr
///
/// Returns the standard error stream of the process as a Stream.
///
/// @description Checks that [stderr] returns Stream<List<int>> value that is the
/// standard error stream of the process as a Stream.
/// @author sgrekhov@unipro.ru

import 'dart:convert';
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

runMain() async {
  String command = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  List<String> args = [...Platform.executableArguments,
    eScript,
    'stdout',
    'stderr'
  ];
  asyncStart();
  Process.start(command, args).then((Process process) {
    Expect.isTrue(process.stderr is Stream<List<int>>);
    Expect.runtimeIsType<Stream<List<int>>>(process.stderr);
    process.stderr.transform(utf8.decoder)
      .transform(const LineSplitter()).toList().then((List errList) {
      Expect.isTrue(errList[0].contains("stderr"), "Actual value: errList[0]");
      asyncEnd();
    });
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
      String decoded = utf8.decoder.convert(event);
      stdout.write(decoded);
    });
  }
}

main(List<String> args) async {
  if(args.length > 0)
    runProcess(args);
  else {
    runMain();
  }
}
