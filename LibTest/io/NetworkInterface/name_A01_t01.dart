/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String name
 * Get the name of the NetworkInterface.
 *
 * @description Checks that [name] gets the String value that is the name of
 * the NetworkInterface.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Future<List<NetworkInterface>> fList =
      NetworkInterface.list(includeLoopback: true, includeLinkLocal: true);

  asyncStart();
  fList.then((fValue) {
    for (int i = 0; i < fValue.length; i++) {
      NetworkInterface nwInterface = fValue[i];
      Expect.isTrue(nwInterface.name is String);
    }
    asyncEnd();
  });
}
