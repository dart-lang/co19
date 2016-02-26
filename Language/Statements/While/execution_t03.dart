/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a while statement of the form while (e) s; proceeds
 * as follows:
 *   The expression e is evaluated to an object o. Then, o is subjected to
 * boolean conversion, producing an object r. If r is true, then the statement
 * {s} is executed and then the while statement is re-executed recursively.
 * If r is false, execution of the while statement is complete.
 * @description Checks that while body statement is enclosed in implicit extra
 * block.
 * @author ilya
 */
import '../../../Utils/expect.dart';

main() {
  var x, i = 0;

  while (i++ < 5) var x = i;

  Expect.isNull(x);
}
