/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 *    m typedef id<X1extendsB1, ..., Xs extendsBs> = T;
 * ...
 * where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
 * empty string. Let [S0] be [S?] if it is a type, otherwise let [S0] be
 * [dynamic]. The associated type of [D], call it [F], is, respectively:
 *   T
 * ...
 * @description Checks that non-function generic type alias declaration can
 * contain metadata.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

import "../../Utils/expect.dart";

const i = 1;
class A { const A(); }

class C<T> {}
class D<T1 extends num, T2 extends String> {}

@i  typedef CAlias<T extends num> = C<T>;
@A() typedef DAlias<T1 extends num, T2 extends String> = D<T1, T2>;

main() {
  CAlias ca1 = new CAlias();
  Expect.isTrue(ca1 is C);

  CAlias<int> ca2 = new CAlias<int>();
  Expect.isTrue(ca2 is C<int>);

  DAlias da1 = new DAlias();
  Expect.isTrue(da1 is D);

  DAlias da2 = new DAlias();
  Expect.isTrue(da2 is D);
}
