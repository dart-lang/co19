/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<InternetAddress>> lookup(String host,
 *   { InternetAddressType type: InternetAddressType.ANY })
 * Lookup a host, returning a [Future] of a list of [InternetAddresss].
 * @description Checks that exception is thrown if such a host does not exist.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

main() {
  Future<List<InternetAddress>> list = InternetAddress.lookup("does-not-exist");
  list.then((addresses) {
    addresses.forEach((InternetAddress addr) {
      Expect.fail("Host does not exist");
    });
  }, onError: (e) {
    print(e);
  });
}
