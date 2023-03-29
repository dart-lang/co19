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
/// @description Check that it is a compile-time error if a switch statement is
/// not exhaustive. Test a type variable `X` with bound `T` where `T` is
/// always-exhaustive
/// @author sgrekhov22@gmail.com
/// @issue 51887

// SharedOptions=--enable-experiment=patterns,class-modifiers

sealed class Sealed {}
class C1 extends Sealed {}
class C2 extends Sealed {}

test1<T extends Sealed>() {
  switch (T) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case C1:
  }
}

test2<T extends bool?>() {
  switch (T) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case bool:
  }
}

main() {
  test1<C1>();
  test2<bool>();
}
