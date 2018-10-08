/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * ZLibDecoder({
 *   int windowBits: ZLibOption.DEFAULT_WINDOW_BITS,
 *   List<int> dictionary: null,
 *   bool raw: false
 * })
 * @description Checks that this constructor creates a new ZLibDecoder object
 * with specified [windowBits] parameter.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibDecoder v = new ZLibDecoder(windowBits: 8);
  Expect.isTrue(v is ZLibDecoder);
  Expect.equals(8, v.windowBits);
  Expect.equals(null, v.dictionary);
  Expect.equals(false, v.raw);
}
