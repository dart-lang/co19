/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addError(error, [StackTrace stackTrace])
 * This function must not be called when a stream is currently being added using
 * [addStream].
 * @description Checks that adding [error] after another stream has already been
 * added does not cause [StateError].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

run_process(IOSink sink) async {
  Stream<List> aStream = new Stream<List<int>>.fromIterable([[1, 2, 3, 4, 5]]);
  await sink.addStream(aStream).then((x) {
    new Future.delayed(new Duration(seconds: 3));
  });
  sink.addError("error for synk");
}

run_main(String mode) async {
  int called = 0;
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  await Process.run(executable, [eScript, mode]).then((ProcessResult results) {
    Expect.isTrue(results.stderr.contains("error for synk"));
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  if(args.length > 0)
    run_process(args[0] == "err" ? stderr : stdout);
  else {
    run_main("out");
    run_main("err");
  }
}
