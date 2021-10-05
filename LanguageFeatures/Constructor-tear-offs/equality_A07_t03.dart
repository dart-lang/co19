// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of generic mixin methods tearoffs
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class A {
  T mixedInSuperMethod<T extends num>(T t) => t;
}

mixin M on A {
  void mixedInMethod<T>() {}
  T mixedInSuperMethod<T extends num>(T t) => super.mixedInSuperMethod<T>(t) + 1 as T;
}

main() {
  A a = new A();
  var s1 = a.mixedInSuperMethod<int>;
  int Function(int) s2 = a.mixedInSuperMethod;

  Expect.equals(s1, s2);
  Expect.equals(s1, a.mixedInSuperMethod<int>);
  Expect.notEquals(s1, a.mixedInSuperMethod<num>);
}
