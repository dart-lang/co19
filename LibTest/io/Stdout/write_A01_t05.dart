/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [String] with non-ascii characters is correctly
 * added to the consumer with ASCI] encoding with [allowInvalid] set to [true].
 * See also [AsciiCodec] Spec:
 * If allowing invalid values, the values will be decoded into the Unicode
 * Replacement character ([U+FFFD]).
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:convert";
import "dart:io";

String str = "âã";

run_process(IOSink sink) { sink.write(str); }

run_main(String mode, Encoding enc) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();

  int called = 0;
  await Process.run(executable,
      [eScript, mode],
      stdoutEncoding: enc,
      stderrEncoding: enc).
  then((ProcessResult results) {
    Expect.equals("����", mode == "err" ? results.stderr : results.stdout);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {

  if(args.length > 0)
    run_process(args[0] == "err" ? stderr : stdout);
  else {
    run_main("out", new AsciiCodec(allowInvalid: true));
    run_main("err", new AsciiCodec(allowInvalid: true));
  }
}
