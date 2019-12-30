/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e translates to F then e.m(args) translates to:
 *  PASSTHRU[F, fn[x] => x.m(ARGS(args))]
 *
 * @description Check that if e translates to F then e.m(args) translates to:
 *  PASSTHRU[F, fn[x] => x.m(ARGS(args))]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  String test1() => "Lily was here";
  String test2(String arg) => arg;
}

main() {
  C c1 = new C();
  Expect.equals("Lily was here", c1.test1());
  Expect.equals("Show must go on", c1.test2("Show must go on"));

  C? c2 = new C();
  if (c2 != null) {
    Expect.equals("Lily was here", c2.test1());
    Expect.equals("Show must go on", c2.test2("Show must go on"));
  }
}
