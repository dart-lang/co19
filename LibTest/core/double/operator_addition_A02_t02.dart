// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion double operator +(num other)
/// Throws [Error] if [other] is [:null:].
/// @description Checks that compile error occurs if [other] is statically [:null:].
/// @author iarkh


main() {
   double d = 3.142128;
   d + null;
//     ^
// [analyzer] unspecified
// [cfe] unspecified

}
