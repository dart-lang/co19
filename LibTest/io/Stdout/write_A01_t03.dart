// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void write(Object obj)
/// Converts [obj] to a [String] by invoking [Object.toString] and adds the
/// encoding of the result to the target consumer.
/// @description Checks that [String] from ascii characters is correctly added to
/// the consumer for any encoding.
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "dart:convert";
import "dart:io";

run_process(IOSink sink) { sink.write("I am here"); }

run_main(String mode) {
  List encodings = [utf8, ascii, latin1, systemEncoding];

  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();

  encodings.forEach((enc) async {
    int called = 0;
    await Process.run(executable,
        [...Platform.executableArguments, eScript, mode],
        stdoutEncoding: enc,
        stderrEncoding: enc).then((ProcessResult results) {
      Expect.equals(
          "I am here", mode == "err" ? results.stderr : results.stdout);
      called++;
    });
    Expect.equals(1, called);
  });
}

main(List<String> args) {
  if(args.length > 0)
    run_process(args[0] == "err" ? stderr : stdout);
  else {
    run_main("out");
    run_main("err");
  }
}
