/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int strategy
 * Tunes the compression algorithm. Use the value ZLibOption.STRATEGY_DEFAULT
 * for normal data, ZLibOption.STRATEGY_FILTERED for data produced by a filter
 * (or predictor), ZLibOption.STRATEGY_HUFFMAN_ONLY to force Huffman encoding
 * only (no string match), or ZLibOption.STRATEGY_RLE to limit match distances
 * to one (run-length encoding).
 * @description Checks that [strategy] is set correctly when the value
 * ZLibOption.STRATEGY_HUFFMAN_ONLY is used.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibCodec codec = new ZLibCodec(strategy: ZLibOption.STRATEGY_HUFFMAN_ONLY);
  Expect.equals(2, codec.strategy);
}
