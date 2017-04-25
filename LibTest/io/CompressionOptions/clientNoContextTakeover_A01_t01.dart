/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool clientNoContextTakeover
 *  final
 *  Control whether the client will reuse it's compression instances.
 * @description Checks that this property returns correct value
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  CompressionOptions co = new CompressionOptions(clientNoContextTakeover: true);
  Expect.isTrue(co.clientNoContextTakeover);

  co = new CompressionOptions(clientNoContextTakeover: false);
  Expect.isFalse(co.clientNoContextTakeover);
}
