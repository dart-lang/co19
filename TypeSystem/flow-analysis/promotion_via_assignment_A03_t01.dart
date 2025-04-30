// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a variable `x` is promotable via assignment of an
/// expression of type `T` given variable model `VM` if
/// - `VM = VariableModel(declared, promoted, tested, assigned, unassigned,
///     captured)`
/// - and captured is false
/// - and `S` is the current type of `x` in `VM`
/// - and `T <: S` and not `S <: T`
/// - and `T` is a type of interest for `x` in `tested`
///
/// @description Checks that if `T <: S` and `S <: T` then promotion via
/// assignment is not performed.
/// @author sgrekhov@unipro.ru

import 'dart:async';
import '../../Utils/static_type_helper.dart';

test1(FutureOr<Object> v) {
  if (v is Object) {} // ignore: unnecessary_type_check
  v = Object();
  // `Object` <: `FutureOr<Object>` and `FutureOr<Object>` <: `Object`.
  // Therefore `v` is not promoted to `Object`.
  v.expectStaticType<Exactly<FutureOr<Object>>>();
}

test2(FutureOr<Object?> v) {
  if (v is Object?) {} // ignore: unnecessary_type_check
  v = 1 > 2 ? null: Object();
  // `Object?` <: `FutureOr<Object?>` and `FutureOr<Object?>` <: `Object?`.
  // Therefore `v` is not promoted to `Object?`.
  v.expectStaticType<Exactly<FutureOr<Object?>>>();
}

main() {
  test1(Object());
  test2(Object());
  test2(null);
}
