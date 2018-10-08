/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isBase64
 * Whether the data is Base64 encoded or not.
 * @description Checks that this property returns true if the data is Base64
 * encoded
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isFalse(UriData.parse("data:text/plain,some data").isBase64);
  Expect.isFalse(UriData.parse("data:,some data").isBase64);
  Expect.isTrue(UriData.parse("data:;charset=utf-8;base64,some data").isBase64);
}
