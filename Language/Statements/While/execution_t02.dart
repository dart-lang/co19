// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Execution of a while statement of the form while (e) s; proceeds
/// as follows:
///   The expression e is evaluated to an object o. Then, o is subjected to
/// boolean conversion, producing an object r. If r is true, then the statement
/// {s} is executed and then the while statement is re-executed recursively.
/// If r is false, execution of the while statement is complete.
/// @description Checks that dynamic type error is produced if o is null.
/// @author vasya

import '../../../Utils/expect.dart';

dynamic getNull() => null;

main() {
  test(list) {
    Expect.throws(() {
      while (getNull()) {
        break;
      }
    }, (e) => e is AssertionError);
  }
}
