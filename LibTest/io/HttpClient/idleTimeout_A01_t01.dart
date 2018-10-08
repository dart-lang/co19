/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration idleTimeout
 *  read / write
 * Get and set the idle timeout of non-active persistent (keep-alive)
 * connections. The default value is 15 seconds.
 * @description Checks that the default value is 15 seconds
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpClient client = new HttpClient();
  Expect.equals(15, client.idleTimeout.inSeconds);
}
