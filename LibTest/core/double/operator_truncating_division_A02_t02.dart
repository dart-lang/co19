// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int operator ~/(num other)
/// Throws [Error] if [other] is [:null:].
/// @description Checks that dividing by null results in an error or exception.
/// @author msyabro

import "../../../Utils/expect.dart";

double d = .7;

main() {
  d ~/ null;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}
