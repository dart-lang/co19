// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool operator /(num other)
/// Throws [Error] if [other] is statically [:null:].
/// @description Checks that the correct exception is thrown.
/// @author iarkh

import "../../../Utils/expect.dart";

main() {
  double d = 3.1428;
  d / null;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

}
