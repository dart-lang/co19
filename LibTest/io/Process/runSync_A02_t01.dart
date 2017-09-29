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
 *     Encoding stdoutEncoding: SYSTEM_ENCODING,
 *     Encoding stderrEncoding: SYSTEM_ENCODING
 * })
 * ...
 * The encoding used for decoding stdout and stderr into text is controlled
 * through stdoutEncoding and stderrEncoding. The default encoding is
 * SYSTEM_ENCODING. If null is used no decoding will happen and the
 * ProcessResult will hold binary data.
 *
 * @description Checks that [stdoutEncoding] is null no decoding will happen and
 * the ProcessResult.stdout will hold binary data.
 * @author ngl@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

String command;
List<String> args;

void setCommand() {
  if (Platform.isLinux) {
    command = 'echo';
    args = ['abc'];
  }
  if (Platform.isWindows) {
    command = 'echo';
    args = ['abc'];
  }
}

main() {
  setCommand();
  ProcessResult processResult =
      Process.runSync(command, args, stdoutEncoding: null);
  int exitCode = processResult.exitCode;
  Expect.equals(0, exitCode);
  Expect.isTrue(processResult.stdout is List);
  Utf8Decoder decode = new Utf8Decoder();
  String decoded = decode.convert(processResult.stdout);
  Expect.isTrue(decoded.substring(0, 3) == "abc");
  Expect.isTrue(processResult.stderr is String);
  Expect.equals("", processResult.stderr);
}
