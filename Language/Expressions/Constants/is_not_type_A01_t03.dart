// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e is! T is equivalent to !(e is T) in every
///   way, including whether it’s potentially constant or constant.
/// ...
/// A constant type expression is one of:
/// • An simple or qualified identifier denoting a type declaration (a type
///   alias, class or mixin declaration) that is not qualified by a deferred
///   prefix, optionally followed by type arguments of the form <T1, ..., Tn>
///   where T1, ..., Tn are constant type expressions.
/// • A type of the form FutureOr<T> where T is a constant type expression.
/// • A function type R Function<typeParameters>(argumentTypes) (where
///   R and <typeParameters> may be omitted) and where R, typeParameters
///   and argumentTypes (if present) contain only constant type expressions.
/// • The type void.
/// • The type dynamic
///
/// @description Checks that an expression of the form `e is! T` is a constant
/// expression if `T` is a constant type expression of type `FutureOr<void>` or
/// an extension type with a representation type `void`
/// @author sgrekhov22@gmail.com
/// @issue 54620

// SharedOptions=--enable-experiment=inline-class

import "dart:async";
import "../../../Utils/expect.dart";

extension type const VoidET(void _) {}

main() {
  const c1 = 1 is! VoidET;
  const c2 = 2 is! FutureOr<void>;
  const c3 = (3,) is! (VoidET,);
  const c4 = (4,) is! (FutureOr<void>,);
  const c5 = (i: 5) is! ({VoidET i});
  const c6 = (i: 6) is! ({FutureOr<void> i});

  Expect.isFalse(c1);
  Expect.isFalse(c2);
  Expect.isFalse(c3);
  Expect.isFalse(c4);
  Expect.isFalse(c5);
  Expect.isFalse(c6);
}
