// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Documentation comments are comments that begin with the tokens ///
/// or '/''*''*'.
/// @description Checks that it is a compile-time error when there is an unpaired
/// documentation comment start token inside another documentation comment.
/// @author rodionov
/// @reviewer iefremov


/**
//^
// [cfe] unspecified
/* Comment */
/*/* Nested comment **/ */
/*/* */ /** Unpaired token **/
*/

main() {
}
// [error line 26, column 0]
// [analyzer] unspecified