/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion zlib = const ZLibCodec._default()
 * @description Checks that [zlib] is an instance of [ZLibCodec].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main() {
  Expect.isTrue(zlib is ZLibCodec);
}

