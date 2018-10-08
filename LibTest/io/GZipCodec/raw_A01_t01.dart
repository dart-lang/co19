/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool raw
 *  final
 * When true, deflate generates raw data with no zlib header or trailer, and
 * will not compute an adler32 check value
 * @description Checks that this property returns constructor's raw argument and
 * data, compressed with raw: true has smaller size
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  GZipCodec codec1 = new GZipCodec();
  Expect.isFalse(codec1.raw);

  GZipCodec codec2 = new GZipCodec(raw: true);
  Expect.isTrue(codec2.raw);

  int max = 1000;
  List<int> data = new List<int>(max);
  for (int i = 0; i < max; i++) {
    data[i] = i % 256;
  }

  var encoded1 = codec1.encode(data);
  var encoded2 = codec2.encode(data);
  Expect.isTrue(encoded2.length < encoded1.length);

}
