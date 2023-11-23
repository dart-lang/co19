// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A Dart program will typically be executed by executing a script.
/// @description Checks that dart returns correct exit code if main function
/// presents in the executed dart script.
/// @author iarkh
/// @issue 42487

// OtherResources=top_level_main_t01_lib.dart
import "../../../Utils/expect.dart";
import "../../../Utils/test_mode_check.dart";
import "dart:io";

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString().replaceAll(".dart", "_lib.dart");
  if (isAot) {
    // This is the case of AOT configuration
    executable = executable.replaceRange(
        executable.lastIndexOf(Platform.pathSeparator) + 1, null, "dart");
    eScript = eScript.replaceRange(
        eScript.lastIndexOf("/") + 1,
        null,
        "top_level_main_t01_lib.dart");
  }
  int called = 0;

  await Process.run(executable, [...Platform.executableArguments, eScript])
      .then((ProcessResult results) {
    Expect.equals(0, results.exitCode);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  run_main();
}
