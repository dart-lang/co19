// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// ...
/// - An expression of `.id(arguments)` or `.new(arguments)` is a constant
///   expression if (and only if) it occurs in a constant context, S declares a
///   corresponding constant constructor, every expression in arguments (which
///   then occurs in a constant context too) is a constant expression, and
///   inferred type arguments to the target class, if any, are all constant
///   types.
///
/// @description Checks that an expression of the form `'.' id(arguments)` or
/// `'.' new(arguments)` is not a constant expression if inferred type arguments
/// are not constant types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C<X, Y> {
  const C();
  const C.id();
}

extension type const ET<X, T>(int _) {
  const ET.id(this._);
}

void foo<T>() {
  C<int, void Function<Y extends T>()> c1 = const .new();
//                                                ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C<void Function<Y extends T>(), int> c2 = const .id();
//                                                ^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET<int, void Function<Y extends T>()> et1 = const .new(0);
//                                                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET<void Function<Y extends T>(), int> et2 = const .id(0);
//                                                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  foo<int>();
}
