// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A Dart program will typically be executed by executing a script.
/// @description Checks that dart returns correct (non-zero) exit code if [main]
/// function is absent in the executed dart script.
/// @author iarkh
/// @issue 42487

import "../../../Utils/expect.dart";
import "dart:io";

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString().replaceAll(".dart", "_lib.dart");
  int called = 0;
  await Process.run(executable, [eScript]).then((ProcessResult results) {
    Expect.notEquals(0, results);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
    run_main();
}
