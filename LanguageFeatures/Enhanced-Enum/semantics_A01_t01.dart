// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The Enum class behaves as if it was declared as:
///
/// class Enum {
///   // No default constructor.
///   external int get index;
///   external String toString();
/// }
/// We intend to (at least pretend to) let enum classes extend Enum, and let
/// mixins and members access the default index and toString() through super..
/// (In practice, we may use a different class implementing Enum as the
/// superclass, but for checking the validity of super.index/super.toString(),
/// we analyze against Enum itself, so it must have non-abstract
/// implementations.)
///
/// This all makes it look as if Enum would be a valid superclass for the mixin
/// applications and methods of the enhanced enum class.
///
/// @description Check that `Enum` and other interfaces are implemented
/// @author sgrekhov@unipro.ru

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
  Expect.isTrue(E.e1 is Enum);
  Expect.isTrue(E.e2 is Enum);
  Expect.isTrue(E.e3 is Enum);
  Expect.isTrue(E.e1 is I1);
  Expect.isTrue(E.e2 is I1);
  Expect.isTrue(E.e3 is I1);
  Expect.isTrue(E.e1 is I2);
  Expect.isTrue(E.e2 is I2);
  Expect.isTrue(E.e3 is I2);
  Expect.isTrue(E.e1 is M);
  Expect.isTrue(E.e2 is M);
  Expect.isTrue(E.e3 is M);

  Expect.runtimeIsType<Enum>(E.e1);
  Expect.runtimeIsType<Enum>(E.e2);
  Expect.runtimeIsType<Enum>(E.e3);
  Expect.runtimeIsType<I1>(E.e1);
  Expect.runtimeIsType<I1>(E.e2);
  Expect.runtimeIsType<I1>(E.e3);
  Expect.runtimeIsType<I2>(E.e1);
  Expect.runtimeIsType<I2>(E.e2);
  Expect.runtimeIsType<I2>(E.e3);
  Expect.runtimeIsType<M>(E.e1);
  Expect.runtimeIsType<M>(E.e2);
  Expect.runtimeIsType<M>(E.e3);
}
