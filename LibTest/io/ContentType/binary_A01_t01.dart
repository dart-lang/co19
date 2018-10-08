/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic BINARY
 *  final
 *  Content type for binary data.
 * @description Checks that this constant returns content type for binary data.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Expect.isNotNull(ContentType.binary);
  Expect.equals("application/octet-stream", ContentType.binary.toString());
}
