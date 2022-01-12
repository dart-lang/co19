// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of such an enum declaration, E, is defined as
/// introducing a (semantic) class, C, just like a similar class declaration.
///
/// Name: The name of the class C and its implicit interface is the name of the
/// enum declaration.
///
/// @description Check the name of the enum instance
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

class I1 {
  int interfaceMethod1() => 0;
  int get interfaceGetter1 => 0;
  void set interfaceSetter1(int value) {}
}

abstract class I2 {
  int interfaceMethod2();
  int get interfaceGetter2;
  void set interfaceSetter2(int value);
}

mixin M on Object {
  int mixedInMethod() => 42;
}

enum E with M implements I1, I2 {
  e1,
  e2,
  e3;

  int interfaceMethod1() => 42;
  int get interfaceGetter1 => 42;
  void set interfaceSetter1(int value) {}
  int interfaceMethod2() => 42;
  int get interfaceGetter2 => 42;
  void set interfaceSetter2(int value) {}
}

main() {
  Expect.isTrue(E.e1 is E);
  Expect.isTrue(E.e2 is E);
  Expect.isTrue(E.e3 is E);
}
