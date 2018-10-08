/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * Adds byte data to the target consumer.
 * @description Checks that the target is added to the consumer after the [add]
 * method call
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

List<int> aList = [84, 69, 83, 84];

run_process(IOSink sink) { sink.add(aList); }

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, mode]).then((ProcessResult results) {
    Expect.equals("TEST", mode == "err" ? results.stderr : results.stdout);
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
