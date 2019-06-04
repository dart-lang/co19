/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<InternetAddress> reverse()
 * Perform a reverse dns lookup on the address, creating a new [InternetAddress]
 * where the host field set to the result.
 * @description Checks that host name is set correctly.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import 'dart:io' show Platform, InternetAddress;

check(InternetAddress address) {
  Future<InternetAddress> hosts =
      new InternetAddress(address.address).reverse();
  hosts.then((host) {
    Expect.equals(address.address, host.address);
    Expect.equals(address.type, host.type);
    if(host.host != "localhost") {
      Expect.equals(Platform.localHostname, host.host);
    }
  }, onError: (e) { Expect.fail("Unexpected error appeared: $e"); });
}

main() {
  Future<List<InternetAddress>> list = InternetAddress.lookup("localhost");
  list.then((addresses) {
    addresses.forEach((InternetAddress addr) {
      check(addr);
    });
  }, onError: (e) { Expect.fail("Unexpected error appeared: $e"); });
}
