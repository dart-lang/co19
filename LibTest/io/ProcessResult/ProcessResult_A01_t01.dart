/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ProcessResult(int pid, int exitCode, stdout, stderr)
 *
 * @description Checks that constructor [ProcessResult] creates a new object of
 * type ProcessResult and two objects created with this constructor with same
 * parameters are not equal.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  int pid = 22;
  int eCode = 0;
  var stdOut = null;
  var stdErr = null;
  ProcessResult pr1 = new ProcessResult(pid, eCode, stdOut, stdErr);
  ProcessResult pr2 = new ProcessResult(pid, eCode, stdOut, stdErr);
  Expect.isFalse(pr1 == pr2);
}
