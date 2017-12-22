/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * Adds byte data to the target consumer.
 * @description Checks that several [List<int>] targets can be added to the
 * consumer
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

List<int> list1 = [84, 69, 83, 84];
List<int> list2 = [83, 84, 65, 82, 84];
List<int> list3 = [72, 69, 89];

run_process(IOSink sink) {
  sink.add(list1);
  sink.add(list2);
  sink.add(list3);
}

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, mode]).then((ProcessResult results) {
    Expect.equals("TESTSTARTHEY",
        mode == "err" ? results.stderr : results.stdout);
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
