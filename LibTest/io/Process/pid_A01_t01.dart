/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int pid
 *
 * Returns the process id of the process.
 *
 * @description Checks that [pid] returns int value that is the process id of
 * the process.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Process.start('echo', ['start']).then((Process process) {
    Expect.isTrue(process.pid is int);
  });
}
