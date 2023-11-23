// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Duration difference(DateTime other) 
/// Throws [Error] if [other] is [:null:].
/// @description Checks that exception is thrown if [other] is [null].
/// @author msyabro

import "../../../Utils/expect.dart";

dynamic getNull() => null;

main() {
  Expect.throws(() => DateTime.now().difference(getNull()));
}
