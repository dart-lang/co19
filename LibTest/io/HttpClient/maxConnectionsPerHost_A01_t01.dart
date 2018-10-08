/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int maxConnectionsPerHost
 * read / write
 * Get and set the maximum number of live connections, to a single host.
 *
 * Increasing this number may lower performance and take up unwanted system
 * resources.
 *
 * To disable, set to null.
 *
 * Default is null.
 * @description Checks that default value of this property is null
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpClient client = new HttpClient();
  Expect.isNull(client.maxConnectionsPerHost);
}
