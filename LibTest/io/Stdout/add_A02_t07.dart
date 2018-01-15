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
 * @description Checks that expected data passed for Latin1 stdout encoding with
 * [allowInvalid] parameter set to [false]
 * @author iarkh@unipro.ru
 * @issue 31894
 */
import "../../../Utils/expect.dart";
import "dart:convert";
import "dart:io";

List<int> aList = [1000, 74, 99, -7, 0, 100000];


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
    run_main("out", new Latin1Codec(allowInvalid: false));
    run_main("err", new Latin1Codec(allowInvalid: false));
  }
}
