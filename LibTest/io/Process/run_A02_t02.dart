  /*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<ProcessResult> run(
 *     String executable,
 *     List<String> arguments, {
 *     String workingDirectory,
 *     Map<String, String> environment,
 *     bool includeParentEnvironment: true,
 *     bool runInShell: false,
 *     Encoding stdoutEncoding: systemEncoding,
 *     Encoding stderrEncoding: systemEncoding
 * })
 * ...
 * The encoding used for decoding stdout and stderr into text is controlled
 * through stdoutEncoding and stderrEncoding. The default encoding is
 * systemEncoding. If null is used no decoding will happen and the
 * ProcessResult will hold binary data.
 *
 * @description Checks that if [stderrEncoding] is null no decoding is happen
 * and ProcessResult.stderr holds binary data.
 * @author ngl@unipro.ru
 * @issue 30945
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

String command = "";
List<String> args = new List<String>();

void setCommand() {
  if (Platform.isWindows) {
    command = Platform.resolvedExecutable;
    args = ['--version'];
  } else {
    command = 'echo';
    args = ['abc'];
  }
}

main() {
  setCommand();
  asyncStart();
  Process.run(command, args, stderrEncoding: null).then((ProcessResult results) {
    Expect.equals(0, results.exitCode);
    Expect.isTrue(results.stdout is String);
    Expect.isTrue(results.stderr is List);
    Utf8Decoder decoder = new Utf8Decoder();
    if (Platform.isWindows) {
      Expect.equals(0, (results.stdout).length);
      String decoded = decoder.convert(results.stderr);
      Expect.isTrue(decoded.indexOf(Platform.version) > -1);
    } else {
      Expect.isTrue(results.stdout.substring(0, 3) == "abc");
      Expect.isTrue((results.stderr).length == 0);
      String decoded = decoder.convert(results.stderr);
      Expect.equals("", decoded);
    }
    asyncEnd();
  });
}
