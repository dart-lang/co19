/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isLoopback
 * Returns [true] if the InternetAddress is a loopback address.
 * @description Checks that [isLoopback] returns [true] for all the addresses
 * which corresponds to localhost.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

main() {
  Future<List<InternetAddress>>  list = InternetAddress.lookup("localhost");

  list.then((addresses) {
    addresses.forEach((InternetAddress addr) {
      Expect.isTrue(addr.isLoopback);
    });
  }, onError: (e) { Expect.fail("Unexpected error appeared: $e"); });
}