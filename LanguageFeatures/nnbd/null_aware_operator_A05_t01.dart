/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e translates to F then e(args) translates to:
 *  PASSTHRU[F, fn[x] => x(ARGS(args))]
 *
 * @description If e translates to F then e(args) translates to:
 *  PASSTHRU[F, fn[x] => x(ARGS(args))]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

typedef String Func();
String foo() => "Lily was here";
class C {
}

main() {
  Func f1 = foo;
  Expect.equals("Lily was here", foo());
  Expect.equals("Lily was here", f1());
  Expect.isTrue(C() is C);

  Func? f2 = foo;
  if (f2 != null) {
    Expect.equals("Lily was here", f1());
  }
}
