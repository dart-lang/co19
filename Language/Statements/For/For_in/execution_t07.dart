// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let D be derived from < finalConstVarOrType >?. A for statement
/// of the form for (D id in e) S is then treated as the following code, where
/// id1 and id2 are fresh identifiers:
/// T id1 = e;
/// var id2 = id1.iterator;
/// while (id2.moveNext()) {
/// D id = id2.current;
/// { S }
/// }
/// If the static type of e is a top type then T is Iterable<dynamic>, otherwise
/// T is the static type of e. It is a compile-time error if T is not assignable
/// to Iterable<dynamic>.
///
/// @description Checks that it is a compile-time error if D is empty and id is
/// a final variable
/// @author sgrekhov22@gmail.com
/// @issue 49495

main() {
  final i;
  for (i in [1, 2, 3]) {
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
