// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that if the declared type of a variable `x` is `S`,
/// `T1 <: S` and `T2 <: S`, the current type of `x` is `T1` then assignment to
/// `x` value of the type `T2` demotes `x` to `S` and promotes to `T2`.
/// @author sgrekhov22@gmail.com
/// @issue 60646

main() {
  Object? s = "Some string";
  s as String;      // `s` promoted to `String`
  if (s is int) {}  // Make `int` a type of interest for `s`.
  s = 42;           // `s` demoted to `Object?` and promoted to `int`
  s.isEven;
  s.substring(0);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
