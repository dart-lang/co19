  // Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion "final" is a reserved word.
/// A reserved word may not be used as an identifier; it is a compile-time error
/// if a reserved word is used where an identifier is expected.
/// @description Checks that it is a compile-time error when a reserved word
/// "final" is used as a label name.
/// @author rodionov

main() {
  final:
//     ^
// [analyzer] unspecified
// [cfe] unspecified

// Seems like there has been an update in the analyzer, but it is only active in
// new code: It used to ask for initialization of a variable whose name is the
// empty string, and it doesn't do that any more. That variable was invented by
// the analyzer anyway, as part of error recovery. This makes it a secondary
// error (caused by another error). It's generally not specified how to treat
// secondary errors, so co19_2 test accepts the given behavior with respect to
// the secondary errors.
  do {
//^
// [analyzer] unspecified

  break final;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  } while (false);
}
