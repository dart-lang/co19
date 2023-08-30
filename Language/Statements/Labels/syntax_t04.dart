// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A label is an identifier followed by a colon. A labeled statement
/// is a statement prefixed by a label L. A labeled case clause is a case clause
/// within a switch statement prefixed by a label L.
/// The sole role of labels is to provide targets for the break and continue
/// statements.
/// label:
///   identifier ':'
/// ;
/// @description Checks that it is a compile-time error if the label identifier
/// is empty.
/// @author vasya

main() {
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  : while (true) { break L; }
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}
