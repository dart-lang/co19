/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The token following a question mark dictates whether it's part of
 * a null-aware operation or the beginning of a new expression.
 *
 * @description Checks usage of a null-aware expression when a set literal is
 * declared.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class C {
  int n1 = 1;
  static int n2 = 2;
  int x = null;
}

main() {
  C c = null;

  var v1 = {c?.x ?? 3, C?.n2, c?.n1};
  Expect.isTrue(v1 is Set);
  Expect.iterableEquals({3, 2, 1}, v1);

  c = new C();

  var v2 = {c?.x ?? 3, C?.n2, c?.n1};
  Expect.isTrue(v2 is Set);
  Expect.iterableEquals({3, 2, 1}, v2);

  var v3 = <int>{c?.x ?? 3, C?.n2, c?.n1};
  Expect.isTrue(v3 is Set);
  Expect.iterableEquals({3, 2, 1}, v3);

  var v4 = <int>{c.n1 ??= c.x, c.x ??= 4, C?.n2, c?.x ?? 3};
  Expect.isTrue(v4 is Set);
  Expect.iterableEquals({1, 4, 2, 3}, v4);
}
