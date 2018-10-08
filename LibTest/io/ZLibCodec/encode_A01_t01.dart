/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> encode(List<int> input)
 * Source
 *   T encode(S input) => encoder.convert(input);
 * @description Checks that the [encode] method encodes ZLib compressed data.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibCodec codec = new ZLibCodec();
  ZLibDecoder decoder = codec.decoder;


  List<int> data = [1, 2, 3];
  List<int> encodedData = codec.encode(data);
  Expect.listEquals(data, decoder.convert(encodedData));
}
