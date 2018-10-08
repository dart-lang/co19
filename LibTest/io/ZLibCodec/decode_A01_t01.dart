/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> decode(List<int> encoded)
 * Source
 *   decode(T encoded) => decoder.convert(encoded);
 * @description Checks that the [decode] method decodes ZLib compressed data.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibCodec codec = new ZLibCodec();
  ZLibEncoder encoder = codec.encoder;


  List<int> data = [1, 2, 3];
  List<int> encodedData = encoder.convert(data);
  Expect.listEquals(data, codec.decode(encodedData));
}
