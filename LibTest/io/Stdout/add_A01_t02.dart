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
import "dart:typed_data";

Int32List list1 = new Int32List.fromList([84, 69, 83, 84]);
Int32List list2 = new Int32List.fromList([83, 84, 65, 82, 84]);
Int32List list3 = new Int32List.fromList([72, 69, 89]);

bool called = false;
run_process(IOSink sink) {
  sink.add(list1);
  sink.add(list2);
  sink.add(list3);
}

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  await Process.run(executable, [eScript, mode]).then((ProcessResult results) {
    Expect.equals("TESTSTARTHEY", mode == "err" ? results.stderr : results.stdout);
    called = true;
  });
  Expect.isTrue(called);
}

main(List<String> args) {
  if(args.length > 0)
    run_process(args[0] == "err" ? stderr : stdout);
  else {
    run_main("out");
    run_main("err");
  }
}
