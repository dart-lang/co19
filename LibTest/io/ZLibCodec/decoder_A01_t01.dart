/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZLibDecoder decoder
 * Get a ZLibDecoder for decoding ZLib compressed data.
 * @description Checks that the returned value is a ZLibDecoder for decoding
 * ZLib compressed data.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var v = new ZLibCodec();
  var d = v.decoder;
  var e = new ZLibEncoder();
  Expect.isTrue(d is ZLibDecoder);

  var l = [1, 2, 3];
  var l1 = e.convert(l);
  Expect.listEquals(l, d.convert(l1));
}
