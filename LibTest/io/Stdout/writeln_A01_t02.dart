/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeln([Object obj = ""])
 * Converts [obj] to a [String] by invoking [Object.toString] and writes the
 * result to [this], followed by a newline.
 * @description Checks that if [obj] is not specified, just [\n] is written to
 * the result stream.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process(Stdout sink) { sink.writeln(); }

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, mode]).then((
      ProcessResult results) {
    print(results.stderr );
    Expect.equals("\n", mode == "err" ? results.stderr : results.stdout);
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
