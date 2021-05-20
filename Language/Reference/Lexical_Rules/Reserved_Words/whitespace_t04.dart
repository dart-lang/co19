// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion WHITESPACE:
/// ('\t' | ' ' | NEWLINE)+
/// ;.
/// @description Checks that other Unicode whitespaces are not allowed:
///  check NO-BREAK SPACE (U+00A0)
/// @author hlodvig


main() {
   var x = 1 ;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}
