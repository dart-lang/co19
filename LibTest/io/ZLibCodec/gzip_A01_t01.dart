/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool gzip
 * When true, GZip frames will be added to the compressed data.
 * @description Checks that [gzip] is set correctly with values true or false.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibCodec codec = new ZLibCodec(gzip: true);
  Expect.equals(true, codec.gzip);
  codec = new ZLibCodec(gzip: false);
  Expect.equals(false, codec.gzip);
}
