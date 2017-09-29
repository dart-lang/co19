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
 *     Encoding stdoutEncoding: SYSTEM_ENCODING,
 *     Encoding stderrEncoding: SYSTEM_ENCODING
 * })
 * ...
 * The encoding used for decoding stdout and stderr into text is controlled
 * through stdoutEncoding and stderrEncoding. The default encoding is
 * SYSTEM_ENCODING. If null is used no decoding will happen and the
 * ProcessResult will hold binary data.
 *
 * @description Checks that [stderrEncoding] is null no decoding will happen and
 * the ProcessResult.stderr will hold binary data.
 * @author ngl@unipro.ru
 */
import "dart:async";
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
  Future<ProcessResult> fProcessResult =
      Process.run(command, args, stderrEncoding: null);
  fProcessResult.then((ProcessResult results) {
    int exitCode = results.exitCode;
    Expect.equals(0, exitCode);
    Expect.isTrue(results.stdout is String);
    Expect.isTrue(results.stdout.substring(0, 3) == "abc");
    Expect.isTrue(results.stderr is List);
    Expect.isTrue((results.stderr).length == 0);
    Utf8Decoder decode = new Utf8Decoder();
    String decoded = decode.convert(results.stderr);
    Expect.equals("", decoded);
  });
}
