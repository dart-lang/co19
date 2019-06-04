/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<InternetAddress>> lookup(String host,
 *   { InternetAddressType type: InternetAddressType.ANY })
 * Lookup a host, returning a [Future] of a list of [InternetAddresss].
 * @description Checks that result [internetAddress] list contains addresses for
 * the given host only.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

check(String name) {
  Future<List<InternetAddress>> list = InternetAddress.lookup(name);
  list.then((addresses) {
    addresses.forEach((InternetAddress addr) {
      Expect.equals(name, addr.host);
    });
  }, onError: (e) { Expect.fail("Unexpected error appeared: $e"); });
}

main() {
  check("localhost");
  check("google.com");
}