/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Endianness(bool _littleEndian)
 * @description Checks that constructor executes without errors
 * and an object of [Endiannes] is created.
 * @issue 12883
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  const endianness = const Endianness(false);
  Expect.isTrue(endianness is Endianness);
}
