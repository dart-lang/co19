/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<List<NetworkInterface>> list({
 *     bool includeLoopback: false,
 *     bool includeLinkLocal: false,
 *     InternetAddressType type: InternetAddressType.ANY
 * })
 * Query the system for NetworkInterfaces.
 *
 * If includeLoopback is true, the returned list will include the loopback
 * device. Default is false.
 *
 * If includeLinkLocal is true, the list of addresses of the returned
 * NetworkInterfaces, may include link local addresses. Default is false.
 *
 * @description Checks that static method [list] with parameter
 * 'includeLoopback: true' returns Future that completes to
 * List<NetworkInterface>.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Future<List<NetworkInterface>> fList =
      NetworkInterface.list(includeLoopback: true);

  asyncStart();
  fList.then((fValue) {
    Expect.isTrue(fValue is List<NetworkInterface>);
    asyncEnd();
  });
}
