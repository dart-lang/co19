/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion gzip = const GZipCodec._default()
 * @description Checks that [gzip] is an instance of [GZipCodec].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main() {
  Expect.isTrue(gzip is GZipCodec);
}

