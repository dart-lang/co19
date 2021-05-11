// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion double remainder(num other)
/// Throws [Error] if [other] is [:null:].
/// @description Checks that compile error appears if [other] is statically [:null:]
/// @author msyabro

import "../../../Utils/expect.dart";

double d = 100.0;

main()  {
  d.remainder(null);
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}
