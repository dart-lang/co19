/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String host
 * The host used to lookup the address.
 * @description Checks that [host] string is correct for localhost.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

main() {
  Future<List<InternetAddress>>  list = InternetAddress.lookup("localhost");

  list.then((addresses) {
    addresses.forEach((InternetAddress addr) {
      Expect.equals("localhost", addr.host);
    });
  }, onError: (e) { Expect.fail("Unexpected error appeared: $e"); });
}
