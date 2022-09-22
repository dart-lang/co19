// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a field name starts with an underscore, it is private and is
/// only accessible in the library where it appears. The records `(_foo: 1)` and
/// `(_foo: 1)` appearing in different libraries do not have the same shape
/// because each `_foo` is considered a distinct name. Likewise, the record
/// types `({int _foo})` and `({int _foo})` are not the same type if those
/// annotations appear in different libraries.
///
/// @description Checks that if a field name starts with an underscore then it
/// is not accessible in a different library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "static_semantics_A05_lib.dart";
import "static_semantics_A05_lib.dart" as l;

main() {
  r1.$0;
  r1._name;
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  r2.$0;
  r2._name;
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  r3._;
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  r3._x;
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  foo().$0;
  foo()._s;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  bar((42, _s: "Answer"));
//    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  l.r1.$0;
  l.r1._name;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  l.r2.$0;
  l.r2._name;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  l.r3._;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  l.r3._x;
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  l.foo().$0;
  l.foo()._s;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}
