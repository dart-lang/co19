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

typedef BAlias<T1, T2 extends T1> = B<T1, T2>;

main() {
  BAlias b1 = new B(1, 2);
  Expect.isTrue(b1 is B<dynamic, dynamic>);
  Expect.isTrue(b1 is BAlias);
  Expect.isTrue(b1 is BAlias<dynamic, dynamic>);

  BAlias<num, int> b2 = new B<num, int>(0, 149);
  Expect.isTrue(b2 is B<num, int>);
  Expect.isTrue(b2 is BAlias<num, int>);
  Expect.equals(0, b2.x);
  Expect.equals(149, b2.y);

  BAlias<num, int> b3 = new B<int, int>(0, 149);
  Expect.isTrue(b3 is B<int, int>);
  Expect.isTrue(b3 is BAlias<int, int>);
  Expect.equals(0, b3.x);
  Expect.equals(149, b3.y);
}
