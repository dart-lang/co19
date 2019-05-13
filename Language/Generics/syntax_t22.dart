/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration, type alias, or function [G] may be generic,
 * that is, [G] may have formal type parameters declared.
 * @description @description Checks various correct type alias declarations.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../Utils/expect.dart";

class B<T1, T2> {
  B(this.x, this.y) {}
  T1 x;
  T2 y;
}

typedef BAlias<T1, T2> = B<T1, T2>;

main() {
  BAlias b1 = new B(1, 2);
  Expect.isTrue(b1 is B);
  Expect.isTrue(b1 is BAlias);
  Expect.equals(1, b1.x);
  Expect.equals(2, b1.y);

  BAlias<int, String> b2 = new B<int, String>(0, "testme");
  Expect.isTrue(b2 is B<int, String>);
  Expect.isTrue(b2 is BAlias<int, String>);
  Expect.equals(0, b2.x);
  Expect.equals("testme", b2.y);
}
