// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int modInverse(int modulus)
/// Returns the modular multiplicative inverse of this integer modulo modulus.
///
/// The modulus must be positive.
///
/// It is an error if no modular inverse exists.
/// @description Checks that the modulus must be positive
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {3.modInverse(-11);});
  Expect.throws(() {3.modInverse(0);});
}
