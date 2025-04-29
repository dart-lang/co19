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
/// @description Checks that if a type of variable is not specified and there is
/// an initializer then its type is defined by the initializer.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int foo() => 42;
}

main() {
  var x = S();
  if (x is T) {} // Make `T` a type of interest
  x = T();
  x.foo();
  x.bar();  // Check that `x` is not dynamic
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
