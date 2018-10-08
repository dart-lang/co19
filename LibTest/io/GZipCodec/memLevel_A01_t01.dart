/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int memLevel
 *  final
 * Specifies how much memory should be allocated for the internal compression
 * state. 1 uses minimum memory but is slow and reduces compression ratio; 9
 * uses maximum memory for optimal speed. The default value is 8.
 *
 * The memory requirements for deflate are (in bytes):
 *
 * (1 << (windowBits + 2)) +  (1 << (memLevel + 9))
 * that is: 128K for windowBits = 15 + 128K for memLevel = 8 (default values)
 * @description Checks that this property returns constructor's memLevel
 * argument
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  GZipCodec codec = new GZipCodec();
  Expect.equals(8, codec.memLevel);

  codec = new GZipCodec(memLevel: 4);
  Expect.equals(4, codec.memLevel);
}
