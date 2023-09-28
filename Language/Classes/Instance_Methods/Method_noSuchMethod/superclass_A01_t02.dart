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
/// forwarder.
/// @author sgrekhov22@gmail.com

mixin class A {
  String m() => "A";
  dynamic noSuchMethod(Invocation i) => "A";
}

class C1 extends A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  String m([int i]);
}

class C2 with A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  String m([int i]);
}

mixin M on A {
  String m({int i});
}

class MA = A with M;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

enum E with A {
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  e1, e2;
  String m({int i});
}

main() {
  print(C1);
  print(C2);
  print(MA);
  print(E);
}
