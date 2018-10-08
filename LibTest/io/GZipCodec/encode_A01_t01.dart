/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T encode(S input)
 * @description Checks that this method encodes data to gzip
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  GZipCodec codec = new GZipCodec();
  int max = 1000;
  List<int> data = new List<int>(max);
  for (int i = 0; i < max; i++) {
    data[i] = i % 256;
  }
  Expect.listEquals(codec.encoder.convert(data), codec.encode(data));
}
