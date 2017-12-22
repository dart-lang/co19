/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void exit(int code)
 * This does not wait for any asynchronous operations to terminate. Using [exit]
 * is therefore very likely to lose data.
 * @description Checks that data will be lost if [exit] was called during some
 * asynchronous operation.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

run_process() {
  new Future.delayed(new Duration(seconds: 2)).then((_) {
    print("Hello, World!");
  });
  exit(123);
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, "run"]).then((ProcessResult results) {
    Expect.equals(123, results.exitCode);
    Expect.isFalse(results.stdout.contains("Hello, World!"));
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  if(args.length > 0)
    run_process();
  else {
    run_main();
  }
}
