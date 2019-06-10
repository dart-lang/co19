/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion CompressionOptions.compressionDefault = const CompressionOptions()
 * Default WebSocket Compression options. Compression will be enabled with the
 * following options: clientNoContextTakeover: false, serverNoContextTakeover:
 * false, clientMaxWindowBits: null (default maximal window size of 15 bits),
 * serverMaxWindowBits: null (default maximal window size of 15 bits)
 * @description Checks that this constant returns CompressionOptions with the
 * default values
 * @issue 29436
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Expect.isNotNull(CompressionOptions.compressionDefault);

  Expect.isFalse(CompressionOptions.compressionDefault.clientNoContextTakeover);
  Expect.isFalse(CompressionOptions.compressionDefault.serverNoContextTakeover);
  Expect.isNull(CompressionOptions.compressionDefault.clientMaxWindowBits);
  Expect.isNull(CompressionOptions.compressionDefault.serverMaxWindowBits);
}
