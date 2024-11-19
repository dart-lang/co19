// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that it is a compile-time error to extend the type
/// `void` or its alias (this is a syntax error, but there are semantics reasons
/// as well).
/// @author iefremov

typedef Void = void;

class A extends void {}
//              ^
// [analyzer] unspecified
// [cfe] unspecified

class C extends Void {}
//              ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(A);
  print(C);
}
