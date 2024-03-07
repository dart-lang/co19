// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with enum as a matched type are
/// always exhaustive
///
/// @description Check that it is a compile-time error if a matched type of a
/// switch expression is an extension type with an enum as a representation type
/// and the set of cases is not exhaustive
/// @author sgrekhov22@gmail.com

enum E<T> {
  a<int>(),
  b<String>(),
  c<double>(),
}

extension type ET1<T>(E<T> _) {}
extension type ET2<T>(E<T> _) implements E<T> {}

String testStatement1<T extends num>(ET1<T> e) {
  switch (e) {
//^^^^^^
// [cfe] unspecified
// [analyzer] unspecified
    case E.a:
      return "a";
    case E.b:
      return "b";
  }
}

String testStatement2<T extends num>(ET2<T> e) {
  switch (e) {
//^^^^^^
// [cfe] unspecified
// [analyzer] unspecified
    case E.a:
      return "a";
    case E.b:
      return "b";
  }
}

String testExpression1<T extends num>(ET1<T> e) =>
  switch (e) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      E.a => "a",
      E.b => "b"
    };

String testExpression2<T extends num>(ET2<T> e) =>
  switch (e) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    E.a => "a",
    E.b => "b"
  };

String testStatement3(ET1<num> e) {
  switch (e) {
//^^^^^^
// [cfe] unspecified
// [analyzer] unspecified
    case E.a:
      return "ok";
  }
}

String testStatement4(ET2<num> e) {
  switch (e) {
//^^^^^^
// [cfe] unspecified
// [analyzer] unspecified
    case E.a:
      return "ok";
  }
}

String testExpression3(ET1<num> e) =>
  switch (e) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    E.a => "a"
  };

String testExpression4(ET2<num> e) =>
  switch (e) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    E.a => "a"
  };

main() {
  testStatement1(ET1(E.a));
  testStatement2(ET2(E.a));
  testExpression1(ET1(E.c));
  testExpression2(ET2(E.c));
  testStatement3(ET1(E.a));
  testStatement4(ET2(E.a));
  testExpression3(ET1(E.a));
  testExpression4(ET2(E.a));
}
