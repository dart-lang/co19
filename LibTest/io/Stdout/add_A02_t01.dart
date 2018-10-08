/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * Adds byte data to the target consumer, ignoring [encoding].
 * The [encoding] does not apply to this method, and the [data] list is passed
 * directly to the target consumer as a stream event.
 * @description Checks that [data] passed directly and all is OK for any
 * [encoding] if the [data] contains some ascii codes.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:convert";
import "dart:io";

List<int> aList = [0, 126, 84, 69, 83, 14, 84, 127];

run_process(IOSink sink) { sink.add(aList); }

run_main(String mode, Encoding enc) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.run(executable, [eScript, mode],
      stdoutEncoding: enc, stderrEncoding: enc).
        then((ProcessResult results) {
    Expect.equals(enc.decode(aList),
        mode == "err" ? results.stderr : results.stdout);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  if(args.length > 0)
    run_process(args[0] == "err" ? stderr : stdout);
  else {
    run_main("out", ascii);
    run_main("out", utf8);
    run_main("out", latin1);
    run_main("out", systemEncoding);

    run_main("err", ascii);
    run_main("err", utf8);
    run_main("err", latin1);
    run_main("err", systemEncoding);
  }
}
