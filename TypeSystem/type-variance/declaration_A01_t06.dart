// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a variance modifier is specified
/// for a type parameter declared in the type parameter list of a declaration
/// of an extension, a generic function or method, or a type alias; or in the
/// type parameter list of a generic function type.
///
/// @description Check that it is a compile-time error if a variance modifier is
/// specified for a type parameter declared in the type parameter list of a
/// generic function type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=variance

typedef F1 = void Function<in T>(T t);
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F2 = T Function<out T>();
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F3 = T Function<inout T>(T t);
//                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F4 = void Function<X, in Y>(X x, Y y);
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified

void Function<in T>()? v1;
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

List<void Function<out T>()> v2 = [];
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

void f1(void Function<inout T>() f) {}
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void Function<in T>()? f2() => null;
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

void f3(void g<out T>()) {}
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  void Function<inout T>()? v;
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m(void g<in T>()) {}
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(F1);
  print(F2);
  print(F3);
  print(F4);
  print(v1);
  print(v2);
  print(f1);
  print(f2);
  print(f3);
  print(C);
}
