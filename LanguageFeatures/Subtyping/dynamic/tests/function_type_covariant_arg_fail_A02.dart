// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Function Type/Function: T0 is a function type and T1 is Function
///
/// @description Check that if type `T0` is a function type with a covariant
/// arguments and `T1` is a function type with arguments that are supertypes of
/// `T0` arguments, then `T0` is a subtype of `T1`. But runtime invocation of
/// `T0` with argument of `T1`'s type fails
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class A {
  void foo(num n) {
    print("A");
  }
}

class C implements A {
  void foo(covariant int n) {
    print("C");
  }
}

main() {
  A a = C();
  void Function(num n) f = a.foo;
  Expect.throws(() {
    f(3.14);
  });
}
