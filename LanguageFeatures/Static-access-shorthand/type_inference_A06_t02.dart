// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Expressions of the forms `.new<typeArgs>(args)` or
/// `.new<typeArgs>` (as a prefix of a `<staticMemberShorthand> <selector>*`
/// production, or the entire chain) are compile-time errors, just like the
/// corresponding `T.new<typeArgs>(args)` and `T.new<typeArgs>` already are,
/// whether used as instantiated tear-off or invoked.
///
/// @description Checks that it is a compile-time error to use a shorthand
/// expression of the form `.new<typeArgs>`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C<T> {
  C();
}

extension type ET<T>(T v) {}

main() {
  Object? o = C();
  if (o is C) {
    o = .new<int>;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  o = ET(0);
  if (o is ET) {
    o = .new<int>;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
