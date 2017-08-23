/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZLibEncoder encoder
 * Get a ZLibEncoder for encoding ZLib compressed data.
 * @description Checks that the returned value is a ZLibEncoder for encoding
 * ZLib compressed data.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var v = new ZLibCodec();
  var e = v.encoder;
  var d = v.decoder;

  Expect.isTrue(e is ZLibEncoder);

  var l = [1, 2, 3];
  var l1 = e.convert(l);
  Expect.listEquals(l, d.convert(l1));
}
