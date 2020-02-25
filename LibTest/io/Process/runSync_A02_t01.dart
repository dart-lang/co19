/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * ProcessResult runSync(
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
 * @description Checks that if [stdoutEncoding] is null no decoding is happen
 * and the ProcessResult.stdout holds binary data.
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
  ProcessResult processResult =
      Process.runSync(command, args, stdoutEncoding: null);
  Expect.equals(0, processResult.exitCode);
  Expect.isTrue(processResult.stdout is List);
  Expect.isTrue(processResult.stderr is String);
  if (Platform.isWindows) {
    Expect.equals(0, processResult.stdout.length);
    Expect.isTrue(processResult.stderr.indexOf(Platform.version) > -1);
  } else {
    Utf8Decoder decoder = new Utf8Decoder();
    String decoded = decoder.convert(processResult.stdout);
    Expect.isTrue(decoded.substring(0, 3) == "abc");
    Expect.equals("", processResult.stderr);
  }
}
