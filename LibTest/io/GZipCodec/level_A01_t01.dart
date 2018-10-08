/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int level
 *  final
 * The compression-level can be set in the range of -1..9, with 6 being the
 * default compression level. Levels above 6 will have higher compression rates
 * at the cost of more CPU and memory usage. Levels below 6 will use less CPU
 * and memory at the cost of lower compression rates.
 * @description Checks that this property returns constructor's level argument
 * @author sgrekhov@unipro.ru
 * @issue 31039
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  GZipCodec codec1 = new GZipCodec(level: -1);
  Expect.equals(-1, codec1.level);

  GZipCodec codec2 = new GZipCodec(level: 9);
  Expect.equals(9, codec2.level);

  int max = 1000;
  List<int> data = new List<int>(max);
  for (int i = 0; i < max; i++) {
    data[i] = i % 256;
  }

  var encoded1 = codec1.encode(data);
  var encoded2 = codec2.encode(data);
  Expect.isTrue(encoded2.length <= encoded1.length);
}
