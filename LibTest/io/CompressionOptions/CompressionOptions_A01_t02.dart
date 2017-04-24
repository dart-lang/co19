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
 * appropriate options. Test non-default values
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  CompressionOptions co = new CompressionOptions(clientNoContextTakeover: true,
      serverNoContextTakeover: true, clientMaxWindowBits: 10,
      serverMaxWindowBits: 20, enabled: false);

  Expect.isTrue(co.clientNoContextTakeover);
  Expect.isTrue(co.serverNoContextTakeover);
  Expect.equals(10, co.clientMaxWindowBits);
  Expect.equals(20, co.serverMaxWindowBits);
  Expect.isFalse(co.enabled);
}
