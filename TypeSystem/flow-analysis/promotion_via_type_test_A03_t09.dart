// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a variable `x` is promotable via type test with type
/// `T` given variable model `VM` if
/// - `VM = VariableModel(declared, promoted, tested, assigned, unassigned,
///     captured)`
/// - and `captured` is `false`
/// - and `S` is the current type of `x` in `VM`
/// - and not `S <: T`
/// - and `T <: S` or (`S` is `X extends R` and `T <: R`) or (`S` is `X & R` and
///   `T <: R`)
///
/// @description Checks that a variable is promoted if `T` is a subtype of `S`.
/// Test type `dynamic` as `T`.
/// @author sgrekhov22@gmail.com

main() {
  Object? o = 1 > 2 ? null : "a";
  if (o is dynamic) { // ignore: unnecessary_type_check
    try {
      o.whatever;
    } catch (_) {}
  }
}
