/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StackTrace current
 * Returns a representation of the current stack trace.
 *
 * This is similar to what can be achieved by doing:
 *
 * try { throw 0; } catch (_, stack) { return stack; }
 * The getter achieves this without throwing, except on platforms that have no
 * other way to get a stack trace.
 * @description Checks that this property can be called and contains not null
 * value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isNotNull(StackTrace.current);
  Expect.isTrue(StackTrace.current.toString().contains("main"));
  try {
    throw new Error();
  } catch (e) {
    Expect.isNotNull(StackTrace.current);
    Expect.isTrue(StackTrace.current.toString().contains("main"));
  }
}
