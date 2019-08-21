/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A new primitive type Never. This type is denoted by the built-in
 * type declaration Never declared in dart:core.
 *
 * @description Check that any type can be suffixed with a ? indicating the
 * nullable version of that type. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

class A {}

class C<X extends A?> {
  X x;
  C(this.x);
}

A? testA(A? a) => a;

C<X extends A?>? testC(C<X extends A?>? c) => c;

int? testInt(int? i) => i;

String? testString(String? s) => s;

Object? testObject(Object? o) => o;

typedef AAlias = A?;
typedef CAlias = C<A?>?;
typedef IntAlias = int?;
typedef StringAlias = String?;
typedef ObjectAlias = Object?;

main() {
  AAlias a = null;
  a = testA(a);

  CAlias c = null;
  c = testC(c);

  IntAlias i = null;
  i = testInt(i);

  ObjectAlias o = null;
  o = testObject(o);

  StringAlias s = null;
  s = testString(s);
}
