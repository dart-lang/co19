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
/// Test type `void` as `T`.
/// @author sgrekhov22@gmail.com

typedef Void = void;

test1() {
  Object? o = 1 > 2 ? null : "a";
  if (o is Void) { // ignore: unnecessary_type_check
    print(o); // `void` <: `Object?`, `o` promoted to `void` and cannot be used
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test2() {
  dynamic d = 42;
  if (d is Void) { // ignore: unnecessary_type_check
    print(d);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(test1);
  print(test2);
}
