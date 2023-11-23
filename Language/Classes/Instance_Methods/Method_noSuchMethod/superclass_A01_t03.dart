// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the name m is noSuchMethod
/// forwarded in a concrete class C, and a superclass of C has an accessible
/// concrete declaration of m which is not a noSuchMethod forwarder.
///
/// @description Checks that it is a compile-time error if the name `m` is
/// `noSuchMethod` forwarded in a concrete class `C`, and a superclass of `C`
/// has an accessible concrete declaration of `m` which is not a `noSuchMethod`
/// forwarder. Note that in this situation the inherited `m` must have a
/// signature which is not a correct override of the signature of `m` in this
/// class, otherwise `m` wouldn't be `noSuchMethod` forwarded.
/// @author sgrekhov22@gmail.com

abstract mixin class A {
  String m([String s = ""]);
}

mixin class B {
  String m() => "B";
}

class C1 extends B implements A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) => "C1";
}

class C2 with B implements A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) => "C2";
}

mixin M on B implements A {
  dynamic noSuchMethod(Invocation i) => "M";
}

class MA = B with M;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

enum E with B implements A {
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  e1, e2;
  dynamic noSuchMethod(Invocation i) => "E";
}

main() {
  print(C1);
  print(C2);
  print(MA);
  print(E);
}
