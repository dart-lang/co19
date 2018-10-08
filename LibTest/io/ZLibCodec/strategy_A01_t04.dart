/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int strategy
 * Tunes the compression algorithm. Use the value ZLibOption.strategyDefault
 * for normal data, ZLibOption.strategyFiltered for data produced by a filter
 * (or predictor), ZLibOption.strategyHuffmanOnly to force Huffman encoding
 * only (no string match), or ZLibOption.strategyRle to limit match distances
 * to one (run-length encoding).
 * @description Checks that [strategy] is set correctly when the value
 * ZLibOption.STRATEGY_STRATEGY_RLE is used.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibCodec codec = new ZLibCodec(strategy: ZLibOption.strategyRle);
  Expect.equals(3, codec.strategy);
}
