/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const CompressionOptions({
 *  bool clientNoContextTakeover: false,
 *  bool serverNoContextTakeover: false,
 *  int clientMaxWindowBits,
 *  int serverMaxWindowBits,
 *  bool enabled: true
 *  })
 * @description Checks that this constructor creates CompressionOptions with
 * appropriate options
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  CompressionOptions co = new CompressionOptions();

  Expect.isFalse(co.clientNoContextTakeover);
  Expect.isFalse(co.serverNoContextTakeover);
  Expect.isNull(co.clientMaxWindowBits);
  Expect.isNull(co.serverMaxWindowBits);
  Expect.isTrue(co.enabled);
}
