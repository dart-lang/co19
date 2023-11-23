// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion DateTime subtract(Duration other)
/// Throws [Error] if [other] is [:null:].
/// @description Checks that an Error is thrown.
/// @author msyabro

import "../../../Utils/expect.dart";

dynamic getNull() => null;

main() {
  DateTime dateTime = new DateTime(2000, 1, 1);
  Expect.throws(() { dateTime.subtract(getNull()); });
}
