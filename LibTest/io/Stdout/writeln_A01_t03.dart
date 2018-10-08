/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeln([Object obj = ""])
 * Converts [obj] to a [String] by invoking [Object.toString] and writes the
 * result to [this], followed by a newline.
 * @description Checks that string followed by the newline is written if [obj]
 * is a [String] Object.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

class ObjectToPass { String toString() { return "I am here"; } }

run_process(IOSink sink) { sink.writeln(new ObjectToPass()); }

run_main(String mode) async {
  int called = 0;
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  await Process.run(executable, [eScript, mode]).then((
      ProcessResult results) {
    Expect.equals("I am here\n",
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
