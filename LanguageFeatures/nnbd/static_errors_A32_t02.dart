// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
/// or ...?) on an expression of type T if T is strictly non-nullable.
///
/// @description Check it is no warning if null aware operators (?., ?.., ??,
/// ??=, or ...?) are used on a nullable receiver.
/// @author sgrekhov@unipro.ru

class A {
  test() {}
}

class C extends A {}

main() {
  var a = A() as A?;
  C c = C();
  a?.test();
  a?..test();
  a ?? c;
  a ??= c;
  var clist = [C(), C()] as List<C>?;
  List<A> alist = [A(), C(), ...? clist];

  a = null;
  a?.test();
  a?..test();
  a ?? c;
  a ??= c;
  clist = null;
  alist = [A(), C(), ...? clist];
}
