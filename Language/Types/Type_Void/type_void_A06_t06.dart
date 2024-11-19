// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that it is a syntax error to declare an extension named
/// `void`.
/// @author sgrekhov22@gmail.com

class A {}

extension void on A {}
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
