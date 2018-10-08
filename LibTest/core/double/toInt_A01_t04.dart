/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toInt()
 * @description Checks that [:toInt():] throws an error or exception when called
 * on infinity.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {double.infinity.toInt();});
  Expect.throws(() {double.negativeInfinity.toInt();});
}
