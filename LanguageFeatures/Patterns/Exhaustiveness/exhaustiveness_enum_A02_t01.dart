// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with enum as a matched type are
/// always exhaustive
///
/// @description Check that it is a compile-time error if a matched type of a
/// switch expression is an enum and the set of cases is not exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

enum E<T> {
  a<int>(),
  b<String>(),
  c<double>(),
}

String test1<T extends num>(E<T> e) {
  switch (e) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case E.a:
      return "a";
    case E.b:
      return "b";
  }
}

String test2<T extends num>(E<T> e) =>
  switch (e) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      E.a => "a",
      E.b => "b"
    };

String test3(E<num> e) {
  switch (e) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case E.a:
      return "ok";
  }
}

String test4(E<num> e) =>
  switch (e) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    E.a => "a"
  };

main() {
  test1(E.a);
  test2(E.c);
  test3(E.a);
  test4(E.a);
}
