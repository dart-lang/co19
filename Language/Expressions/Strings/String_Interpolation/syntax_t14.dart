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
/// @description Checks that it is a compile-time error when the identifier in
/// string interpolation construct of the form '$' IDENTIFIER_NO_DOLLAR starts
/// with the dollar character.
/// @author kaigorodov


main() {
  var $x = "dollar";
  var x = "dollar";
  '$$x';
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}
