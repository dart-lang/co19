/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<InternetAddress> addresses
 * Get a list of InternetAddresses currently bound to this NetworkInterface.
 *
 * @description Checks that [addresses] gets a list of InternetAddresses
 * currently bound to this NetworkInterface.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Future<List<NetworkInterface>> fList =
      NetworkInterface.list(includeLoopback: true,includeLinkLocal: true);

  asyncStart();
  fList.then((fValue) {
    for (int i = 0; i < fValue.length; i++) {
      NetworkInterface nwInterface = fValue[i];
      Expect.isTrue(nwInterface.addresses is List);
      Expect.isTrue(nwInterface.addresses[0] is InternetAddress);
    }
    asyncEnd();
  });
}
