// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A single line comment begins with the token //.
/// Everything between // and the end of line must be ignored by the Dart
/// compiler unless the comment is a documentation comment.
/// SINGLE LINE COMMENT:
///   '//' ~(NEWLINE)* (NEWLINE)?
/// ;
/// @description Checks that a single leading slash character does not make
/// a single-line comment.
/// @author vasya


/  Invalid code
//         ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
