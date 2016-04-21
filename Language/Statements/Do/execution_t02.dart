/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a do statement of the form do s while (e); proceeds
 * as follows:
 *   The statement {s} is executed. Then, the expression e is evaluated to an
 * object o. Then, o is then subjected to boolean conversion, producing an
 * object r. If r is false, execution of the do statement is complete. If r is
 * true, then the do statement is re-executed recursively.
 * @description Checks that the loop expression is evaluated after its body.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  var log = "";
  do
    log = "ping";
  while (() {log = "${log} pong"; return false;}());
  Expect.equals("ping pong", log);
}
