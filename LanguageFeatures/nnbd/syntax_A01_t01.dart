/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The grammar of types is extended to allow any type to be suffixed
 * with a ? (e.g. int?) indicating the nullable version of that type.
 *
 * @description Check that any type can be suffixed with a ? indicating the
 * nullable version of that type.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {}

class C<X extends A?> {
  X x;
  C(this.x);
}

A? testA(A? a) => a;

C<X> ? testC<X extends A?>(C<X>? c) => c;

int ? testInt(int? i) => i;

String? testString(String? s) => s;

Object? testObject(Object? o) => o;

main() {
  A? a = null;
  a = testA(a);

  C<A?>? c = null;
  c = testC<A?>(c);

  int? i = null;
  i = testInt(i);

  Object? o = null;
  o = testObject(o);

  String? s = null;
  s = testString(s);
}
