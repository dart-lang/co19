// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let R0 be the extension type erasure of V0. At run time, the type
/// V0 has the same representation and semantics as R0. In particular, they
/// behave identically with respect to is, is!, as, and ==, both when V0 and R0
/// are used as types, and when they occur as subterms of another type.
///
/// @description Check that an extension type erasure is not performed
/// statically outside of switch expressions and statements
/// @author sgrekhov22@gmail.com

extension type BoolET1(bool _) {}
extension type BoolET2(bool _) implements bool {}
extension type const ConstBoolET1(bool _) {}
extension type const ConstBoolET2(bool _) implements bool {}

var _false = BoolET1(false);
var _true = BoolET2(true);

const cTrue = ConstBoolET1(true);
const cFalse = ConstBoolET2(false);

main() {
  if (_true) {}
  if (_false) {}
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (cFalse) {}
  if (cTrue) {}
//    ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  for (;_true;) {
    break;
  }
  for (;_false;) {}
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (42) {
    case _ when cFalse:
  }
  switch (42) {
    case _ when _false:
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  var _ = switch(42) {
    >0 when cTrue => 0,
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ when _true => 1,
    _ => 2
  };
}
