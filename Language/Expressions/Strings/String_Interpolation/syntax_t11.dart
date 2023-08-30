// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is possible to embed expressions within non-raw string
/// literals, such that these expressions are evaluated, and the resulting
/// values are converted into strings and concatenated with the enclosing
/// string. This process is known as string interpolation.
/// stringInterpolation:
///   '$' IDENTIFIER_NO_DOLLAR |
///   '$' '{' expression '}'
/// ;
/// @description Checks that it is a compile-time error if the identifier in a
/// string interpolation construct (without the curly braces) is invalid
/// (contains prohibited characters).
/// @author msyabro


main() {
  "$#x";
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}
