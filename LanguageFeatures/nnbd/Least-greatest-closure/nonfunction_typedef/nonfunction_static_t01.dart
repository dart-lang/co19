// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The definitions of least and greatest closure are changed in null
/// safe libraries to substitute [Never] in positions where previously [Null
/// would have been substituted, and [Object?] in positions where previously
/// [Object] or [dynamic] would have been substituted.
/// @description Check that [Object?] type is substituted for [typedef C<X> =
/// A<X>].
/// @note Read more about the least and greatest closure test template:
/// https://github.com/dart-lang/co19/issues/575#issuecomment-613542349
///
/// @Issue 42580
/// @author iarkh@unipro.ru

import "../../../../Utils/expect.dart";

abstract class A<X> {
  X get x;
  set x(X value);
}

typedef C<X> = A<X>;

void main() {
  void f<X>(C<X> Function() g) => g();

  // Verify that the captured type has an `x`.
  f(() => captureTypeArgument()..x);

  // Verify that `x` has a top type.
  f(() => captureTypeArgument()..x = 42);
  f(() => captureTypeArgument()..x = 'Hello');
  f(() => captureTypeArgument()..x = null);

  // Verify that `x` does not have type `dynamic` (but, expecting the type
  // to be `Object?` we need the null aware access `?.`).
  f(() => captureTypeArgument()..x?.unknownMember);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  // Verify that `x` has `Object` members (so it can have type `Object?`,
  // but it cannot have type `void`).
  f(() => captureTypeArgument()..x.toString);
}
