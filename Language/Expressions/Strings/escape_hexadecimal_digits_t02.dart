// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error when a non-raw string literal contains
/// a character sequence of the form \x that is not followed by a sequence of
/// two hexadecimal digits.
/// @description Checks that it is a compile-time error if a string literal
/// contains a character sequence of the form \x that is followed by characters
/// that are not hexadecimal digits.
/// @author msyabro


main() {
  "\xx";
// ^
// [analyzer] unspecified
// [cfe] unspecified
}
