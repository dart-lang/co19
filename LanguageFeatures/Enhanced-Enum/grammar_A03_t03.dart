// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We propose the following to also be allowed:
///
/// enum Name<T> with Mixin1, Mixin2 implements Interface1, Interface2 {
///   id1<int>(args1), id2<String>(args2), id3<bool>(args3);
///   memberDeclaration*
///   const Name(params) : initList;
/// }
/// where memberDeclaration* is any sequence of static and instance member
/// declarations and/or an unnamed generative const constructor declaration.
/// ...
/// The superclass of the mixin applications is the Enum class (which has an
/// abstract index getter, so the only valid super invocations are those valid
/// on Object).
///
/// @description Check that enum can implement interfaces
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class I1 {
  int interfaceMethod1() => 0;
  int get interfaceGetter1 => 0;
  void set interfaceSetter1(int value) {}
}

abstract class I2<T> {
  T interfaceMethod2();
  T get interfaceGetter2;
  void set interfaceSetter2(T value);
}

enum E<T> implements I1, I2<T> {
  e1<int>(1, "1", 11),
  e2<String>("2", "22", 22),
  e3<bool>(false, "3", 33);

  const E(T t, String s, int v): _t = t, _s = s, _v = v;

  final _t;
  final _s;
  final _v;

  int interfaceMethod1() => _v;
  int get interfaceGetter1 => _v;
  void set interfaceSetter1(int value) {}
  T interfaceMethod2() => _t;
  T get interfaceGetter2 => _t;
  void set interfaceSetter2(T value) {}
}

main() {
  Expect.equals(11, E.e1.interfaceMethod1());
  Expect.equals(22, E.e2.interfaceGetter1);
  E.e3.interfaceSetter1 = 42;
  Expect.equals(false, E.e3.interfaceMethod2());
  Expect.equals("2", E.e2.interfaceGetter2);
  E.e1.interfaceSetter2 = 42;
}
