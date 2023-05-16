// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion But switch statements must only be exhaustive when the matched
/// value is an always-exhaustive type, defined as:
/// - bool
/// - Null
/// - A enum type
/// - A type whose declaration is marked sealed
/// - T? where T is always-exhaustive
/// - FutureOr<T> for some type T that is always-exhaustive
/// - A record type whose fields all have always-exhaustive types
/// - A type variable X with bound T where T is always-exhaustive
/// - A promoted type variable X & T where T is always-exhaustive
///
/// All other types are not always-exhaustive. Then:
/// - It is a compile-time error if the cases in a switch statement or switch
///   collection element are not exhaustive and the static type of the matched
///   value is an always-exhaustive type. There is no error if a switch
///   statement is not exhaustive when the type is not an always-exhaustive type
///
/// @description Check that it is no error if a switch statement is  exhaustive.
/// Test a type `T?` where `T` is always-exhaustive
/// @author sgrekhov22@gmail.com

main() {
  bool? b = 1 > 2;
  if (b) {
    b = null;
  }
  switch (b) {
    case true:
    case false:
    case null:
  }
  switch (b) {
    case bool _:
    case null:
  }
}
