/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
library opted_in_lib;

class A {
  void foo() {}
  void test({required String named}) {}
  static void bar({required String named}) {}
}

class C<X extends A> {
  X x;
  C(this.x);
}

Never testNever(Never x) => x;

void test({required String named}) {}

A? aVar1 = null;
C<A>? cVar1 = null;
String? sVar1 = null;
int? iVar1 = null;

A aVar2 = new A();
C<A> cVar2 = new C<A>(aVar2);
String sVar2 = "Show must go on";
int iVar2 = 42;
