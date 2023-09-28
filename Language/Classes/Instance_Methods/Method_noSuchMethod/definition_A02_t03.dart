// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a class C has a non-trivial `noSuchMethod` if C has a
/// concrete member named noSuchMethod which is distinct from the one declared
/// in the built-in class [Object]
///
/// Note that it must be a method that accepts one positional argument, in order
/// to correctly override noSuchMethod in Object. For instance, it can have
/// signature noSuchMethod(Invocation i) or
/// noSuchMethod(Object i, [String s = ”]), but not
/// noSuchMethod(Invocation i, String s). This implies that the situation  where
/// noSuchMethod is invoked (explicitly or implicitly) with one actual argument
/// cannot fail for the reason that “there is no such method”, such that we
/// would enter an infinite loop trying to invoke noSuchMethod. It is possible,
/// however, to encounter a dynamic error during an invocation of noSuchMethod
/// because the actual argument fails to satisfy a type check, but that
/// situation will give rise to a dynamic type error rather than a repeated
/// attempt to invoke noSuchMethod
///
/// @description Checks that it is a compile-time error to define a
/// `noSuchMethod` which is not a correct override of `noSuchMethod` in `Object`
/// @author sgrekhov22@gmail.com

class C1 {
  void noSuchMethod<T>(Invocation i) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  void noSuchMethod<T extends Invocation>(Invocation i) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  void noSuchMethod<T extends Invocation>(T t) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M1 {
  void noSuchMethod<T>(Invocation i) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2 {
  void noSuchMethod<T extends Invocation>(Invocation i) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M3 {
  void noSuchMethod<T extends Invocation>(T t) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e1, e2;
  void noSuchMethod<T>(Invocation i) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e1, e2;
  void noSuchMethod<T extends Invocation>(Invocation i) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3 {
  e1, e2;
  void noSuchMethod<T extends Invocation>(T t) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
}
