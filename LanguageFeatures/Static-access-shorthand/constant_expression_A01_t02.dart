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
/// form `const '.' id(arguments)` or `const '.' new(arguments)` if constructors
/// in an appropriate declaration are not constant constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C {
  final String value;
  C(this.value);
  C.id(this.value);
  factory C.f(String value) = C;
}

extension type ET(String value) {
  ET.id(this.value);
  factory ET.f(String value) = ET;
}

main() {
  const C c1 = const .new("one");
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const C c2 = const .id("two");
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const C c3 = const .f("three");
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et1 = const .new("new");
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et2 = const .id("id");
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et3 = const .f("f");
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}
