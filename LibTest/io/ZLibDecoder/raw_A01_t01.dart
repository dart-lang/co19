/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool raw
 * When true, deflate generates raw data with no zlib header or trailer, and
 * will not compute an adler32 check value
 * @description Checks that [raw] is set correctly with value true or false.
 * The default value is false.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibDecoder decoder = new ZLibDecoder(raw: true);
  Expect.equals(true, decoder.raw);
  decoder = new ZLibDecoder(raw: false);
  Expect.equals(false, decoder.raw);
}
