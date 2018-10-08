/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int strategy
 *  final
 * Tunes the compression algorithm. Use the value ZLibOption.strategyDefault
 * for normal data, ZLibOption.strategyFiltered for data produced by a filter
 * (or predictor), ZLibOption.strategyHuffmanOnly to force Huffman encoding
 * only (no string match), or ZLibOption.strategyRle to limit match distances
 * to one (run-length encoding).
 * @description Checks that this property returns constructor's strategy
 * argument and data, compressed with different strategy has different size
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  GZipCodec codec1 = new GZipCodec();
  Expect.equals(ZLibOption.strategyDefault, codec1.strategy);

  GZipCodec codec2 = new GZipCodec(strategy: ZLibOption.strategyHuffmanOnly);
  Expect.equals(ZLibOption.strategyHuffmanOnly, codec2.strategy);

  int max = 1000;
  List<int> data = new List<int>(max);
  for (int i = 0; i < max; i++) {
    data[i] = i % 256;
  }

  var encoded1 = codec1.encode(data);
  var encoded2 = codec2.encode(data);
  Expect.isTrue(encoded2.length != encoded1.length);

  codec2 = new GZipCodec(strategy: ZLibOption.strategyRle);
  encoded2 = codec2.encode(data);
  Expect.isTrue(encoded2.length != encoded1.length);

}
