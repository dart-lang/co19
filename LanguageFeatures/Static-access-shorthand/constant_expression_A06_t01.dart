// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// ...
/// - (An expression of the form `.new` followed by a `<typeArguments>` is still
///   a compile-time error.)
///
/// @description Checks that an expression of the form `'.' new` followed by a
/// `<typeArguments>` is still a compile-time error.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C<T> {
  const C();
}

extension type const ET<T>(T _) {}

main() {
  const C<int> c = const .new<int>();
//                       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const ET<int> et = const .new<int>(0);
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
