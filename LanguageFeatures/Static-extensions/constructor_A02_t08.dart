// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an extension declares a constructor
/// which is generative.
///
/// @description Checks that it is still not an error if an extension declares
/// a function with the same name as on-type name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C1 {}

extension ExtC1 on C1 {
  C1() {}
}

class C2 {}

extension ExtC2 on C2 {
  C2() {
    return 42;
  }
}

class C3 {}

extension ExtC3 on C3 {
  C3() => 42;
}

class C4 {}

extension ExtC4 on C4 {
  int C4() => 42;
}

mixin class MC1 {}

extension ExtMC1 on MC1 {
  MC1() {}
}

mixin class MC2 {}

extension ExtMC2 on MC2 {
  MC2() {
    return 42;
  }
}

mixin class MC3 {}

extension ExtMC3 on MC3 {
  MC3() => 42;
}

mixin class MC4 {}

extension ExtMC4 on MC4 {
  int MC4() => 42;
}

enum E1 {
  e0;
}

extension ExtE1 on E1 {
  E1() {}
}

enum E2 {
  e0;
}

extension ExtE2 on E2 {
  E2() {
    return 42;
  }
}

enum E3 {
  e0;
}

extension ExtE3 on E3 {
  E3() => 42;
}

enum E4 {
  e0;
}

extension ExtE4 on E4 {
  int E4() => 42;
}

extension type ET1(int _) {}

extension ExtET1 on ET1 {
  ET1() {}
}

extension type ET2(int _) {}

extension ExtET2 on ET2 {
  ET2() {
    return 42;
  }
}

extension type ET3(int _) {}

extension ExtET3 on ET3 {
  ET3() => 42;
}

extension type ET4(int _) {}

extension ExtET4 on ET4 {
  int ET4() => 42;
}

main() {
  C1().C1();
  Expect.equals(42, C2().C2());
  Expect.equals(42, C3().C3());
  Expect.equals(42, C4().C4());
  MC1().MC1();
  Expect.equals(42, MC2().MC2());
  Expect.equals(42, MC3().MC3());
  Expect.equals(42, MC4().MC4());
  E1.e0.E1();
  Expect.equals(42, E2.e0.E2());
  Expect.equals(42, E3.e0.E3());
  Expect.equals(42, E4.e0.E4());
  ET1(1).ET1();
  Expect.equals(42, ET2(2).ET2());
  Expect.equals(42, ET3(3).ET3());
  Expect.equals(42, ET4(4).ET4());
}
