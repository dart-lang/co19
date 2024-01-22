// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e as T is potentially constant if e is a
///   potentially constant expression and T is a constant type expression, and
///   it is further constant if e is constant.
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
/// @description Checks that an expression of the form `e as T` is a constant
/// expression if `T` is a constant type expression of type `FutureOr<void>` or
/// an extension type with a representation type `void`
/// @author sgrekhov22@gmail.com
/// @issue 54620

// SharedOptions=--enable-experiment=inline-class

import "dart:async";
import "../../../Utils/expect.dart";

extension type const VoidET(void _) {}

main() {
  const c1 = 1 as VoidET;
  const c2 = 2 as FutureOr<void>;
  const c3 = (3,) as (VoidET,);
  const c4 = (4,) as (FutureOr<void>,);
  const c5 = (i: 5) as ({VoidET i});
  const c6 = (i: 6) as ({FutureOr<void> i});

  Expect.identical(1, c1);
  Expect.identical(2, c2);
  Expect.identical((3,), c3);
  Expect.identical((4,), c4);
  Expect.identical((i: 5), c5);
  Expect.identical((i: 6), c6);
}
