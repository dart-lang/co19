// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// - An expression of the form `const .id(arguments)` or
///   `const .new(arguments)` is a constant expression. It's a compile-time
///   error if S does not declare a constant constructor, and if any expression
///   in `arguments`, which are all in a constant context, is not a constant
///   expression.
///
/// @description Checks that it's a compile-time error to use expressions of the
/// form `const '.' id(arguments)` or `const '.' new(arguments)` if any
/// expression in `arguments` is not a constant expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C {
  final String value;
  const C(this.value, [String s = ""]);
  const C.id(this.value, {String s = ""});
  const factory C.f(String value) = C;
}

extension type const ET(String value) {
  const ET.id(this.value, [String s = ""]);
  const ET.id2(this.value, {String s = ""});
  const factory ET.f(String value, {String s}) = ET.id2;
}

main() {
  String s = "Not a constant";
  const C c1 = const .new(s);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  const C c2 = const .new("one", s);
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

  const C c3 = const .id(s);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  const C c4 = const .id("two", s: s);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  const C c5 = const .f(s);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  const C c6 = const .f("three", s: s);
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et1 = const .new(s);
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et2 = const .new("new", s);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et3 = const .id(s);
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et4 = const .id("id", s);
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et5 = const .f(s);
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et6 = const .f("f", s: s);
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}
