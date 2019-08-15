/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
 * or ...?) on a non-nullable receiver.
 *
 * @description Check it is a warning to use a null aware operator (?., ?.., ??,
 * ??=, or ...?) on a non-nullable receiver. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
class A {
  test() {}
}

class C extends A {}

typedef CAlias = C?;

main() {
  A a = A();
  CAlias c = C();
  c?.test();
// ^^
// [analyzer] unspecified
// [cfe] unspecified
  c?..test();
// ^^^
// [analyzer] unspecified
// [cfe] unspecified
  c ?? a;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  a ??= c;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  List<C> clist = [C(), C()];
  List<A> alist = [A(), C(), ...? clist];
//                           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
