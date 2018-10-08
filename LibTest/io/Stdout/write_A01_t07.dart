/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [toString] is called when writing object to the
 * consumer
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

bool called = false;
String str = "I am here";
class ObjectToPass {
  ObjectToPass() {}
  String toString() {
    called = true;
    return str;
  }
}

run_process(IOSink sink) { sink.write(new ObjectToPass()); }

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  await Process.run(executable, [eScript, mode]).then((ProcessResult results) {
    Expect.equals(str, mode == "err" ? results.stderr : results.stdout);
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
