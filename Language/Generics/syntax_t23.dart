// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class declaration, type alias, or function [G] may be generic,
/// that is, [G] may have formal type parameters declared.
/// @description Checks various correct type alias declarations.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class A<T> {}

class B<T1, T2> {
  B(T1 x, T2 y) {
    this.x = x;
    this.y = y;
  }
  T1? x;
  T2? y;
}

typedef BAlias<T> = B<T, T>;

main() {
  BAlias b1 = B(1, 2);
  Expect.isTrue(b1 is B);
  Expect.isTrue(b1 is BAlias);
  Expect.runtimeIsType<B>(b1);
  Expect.runtimeIsType<BAlias>(b1);
  Expect.equals(1, b1.x);
  Expect.equals(2, b1.y);

  BAlias<int> b2 = new B<int, int>(0, 100);
  Expect.isTrue(b2 is B<int, int>);
  Expect.isTrue(b2 is BAlias<int>);
  Expect.runtimeIsType<B<int, int>>(b2);
  Expect.runtimeIsType<BAlias<int>>(b2);
  Expect.equals(0, b2.x);
  Expect.equals(100, b2.y);

  var a = new A<int?>();
  BAlias<A<int?>?> b3 = new B<A<int?>?, A<int?>?>(a, null);
  Expect.isTrue(b3 is B<A<int?>?, A<int?>?>);
  Expect.isTrue(b3 is BAlias<A<int?>?>);
  Expect.runtimeIsType<B<A<int?>?, A<int?>?>>(b3);
  Expect.runtimeIsType<BAlias<A<int?>?>>(b3);
  Expect.equals(a, b3.x);
  Expect.isNull(b3.y);
}
