// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Future<ProcessResult> run(
///     String executable,
///     List<String> arguments, {
///     String workingDirectory,
///     Map<String, String> environment,
///     bool includeParentEnvironment: true,
///     bool runInShell: false,
///     Encoding stdoutEncoding: systemEncoding,
///     Encoding stderrEncoding: systemEncoding
/// })
///
/// Starts a process and runs it non-interactively to completion. The process
/// run is executable with the specified arguments.
/// ...
/// Returns a Future<ProcessResult> that completes with the result of running
/// the process, i.e., exit code, standard out and standard in.
///
/// @description Checks that static method [run] starts a process, runs it
/// non-interactively to completion and returns a Future<ProcessResult> that
/// completes with the result of running the process, i.e., exit code, standard
/// out and standard in. Tests that there should be an error code which is not
/// zero (not success)and not 255 (not a runtime error) if invalid file path is
/// used - which is all we really know about the `dart` executable. Any other
/// error should be fine.
/// For dartkp configuration, exit code should be 255: VM initialization failed
/// because cannot load non-existing snapshot and runtime exception is thrown
/// here, so exit code should be 255 here.
///
/// @author sgrekhov@unipro.ru
/// @issue 31611

import "dart:io";
import "../../../Utils/expect.dart";

bool isDartkp() {
  var parts = Uri.file(Platform.resolvedExecutable).pathSegments;
  String basename =  parts[parts.length - 1];
  var pos = basename.lastIndexOf('.');
  String result = (pos != -1) ? basename.substring(0, pos) : basename;
  return result == "dart_precompiled_runtime";
}

main() {
  String executable = Platform.resolvedExecutable;
  File file = new File.fromUri(Platform.script.resolve("not_existing.dart"));
  asyncStart();
  Process.run(executable, [file.path]).then((ProcessResult results) {
    Expect.notEquals(0, results.exitCode);
    if(!isDartkp()) {
      Expect.notEquals(255, results.exitCode);
    } else {
      Expect.equals(255, results.exitCode);
    }
    Expect.notEquals("", results.stderr);
    asyncEnd();
  });
}
