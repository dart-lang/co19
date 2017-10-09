/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int windowBits
 * final
 * Base two logarithm of the window size (the size of the history buffer). It
 * should be in the range 8..15. Larger values result in better compression at
 * the expense of memory usage. The default value is 15
 * @description Checks that this property returns constructor's windowBits
 * argument and data, compressed with different windowBits has different size
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  GZipCodec codec1 = new GZipCodec();
  Expect.equals(15, codec1.windowBits);

  GZipCodec codec2 = new GZipCodec(windowBits: 8);
  Expect.equals(8, codec2.windowBits);

  int max = 1000;
  List<int> data = new List<int>(max);
  for (int i = 0; i < max; i++) {
    data[i] = i % 256;
  }

  var encoded1 = codec1.encode(data);
  var encoded2 = codec2.encode(data);
  Expect.isTrue(encoded2.length > encoded1.length);
}
