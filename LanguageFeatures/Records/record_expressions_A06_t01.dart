// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion There is no syntax for a zero-field record expression. Instead,
/// there is a static constant empty on [Record] that returns the empty record.
///
/// @description Checks that there is no syntax for a zero-field record
/// expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

Record foo() => ();
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

void bar(Record r) {}

main() {
  var record1 = ();
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  bar(());
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}
