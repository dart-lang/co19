/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * Adds byte data to the target consumer, ignoring [encoding].
 * The [encoding] does not apply to this method, and the [data] list is passed
 * directly to the target consumer as a stream event.
 * @description Checks that [data] passed directly and all is OK for any
 * [encoding] if the [data] is an ascii string.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:convert";
import "dart:io";
import "dart:typed_data";

bool called = false;
Int32List aList = new Int32List.fromList([84, 69, 83, 84]);

run_process(IOSink sink) { sink.add(aList); }

run_main(String mode, Encoding enc) async {
  Encoding outenc, errenc;

  if (mode == "err") {
    outenc = SYSTEM_ENCODING;
    errenc = enc;
  } else {
    errenc = SYSTEM_ENCODING;
    outenc = enc;
  }

  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();

  await Process.run(executable, [eScript, mode],
      stdoutEncoding: outenc, stderrEncoding: errenc).
        then((ProcessResult results) {
        Expect.equals("TEST", mode == "err" ? results.stderr : results.stdout);
    called = true;
  });
  Expect.isTrue(called);
}

main(List<String> args) {
  if(args.length > 0)
    run_process(args[0] == "err" ? stderr : stdout);
  else {
    run_main("out", new AsciiCodec());
    run_main("out", new Utf8Codec());
    run_main("out", new Latin1Codec());
    run_main("out", new SystemEncoding());

    run_main("err", new AsciiCodec());
    run_main("err", new Utf8Codec());
    run_main("err", new Latin1Codec());
    run_main("err", new SystemEncoding());
  }
}
