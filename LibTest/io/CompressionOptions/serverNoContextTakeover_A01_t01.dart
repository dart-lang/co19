/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool serverNoContextTakeover
 *  final
 *  Control whether the server will reuse it's compression instances.
 * @description Checks that this property returns correct value
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  CompressionOptions co = new CompressionOptions(serverNoContextTakeover: true);
  Expect.isTrue(co.serverNoContextTakeover);

  co = new CompressionOptions(serverNoContextTakeover: false);
  Expect.isFalse(co.serverNoContextTakeover);
}
