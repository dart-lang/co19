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
 * ...
 * If type is either InternetAddressType.IPv4 or InternetAddressType.IPv6 it
 * will only lookup addresses of the specified type. Default is
 * InternetAddressType.ANY.
 *
 * @description Checks that if parameter 'type' of static method [list] is
 * InternetAddressType.IPv6, only addresses of InternetAddressType.IPv6 type
 * are lookup.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Future<List<NetworkInterface>> fList = NetworkInterface.list(
      includeLoopback: true,
      includeLinkLocal: true,
      type: InternetAddressType.IPv6);

  asyncStart();
  fList.then((fValue) {
    var addressCount = 0;
    var ipv4Count = 0;
    var ipv6Count = 0;
    for (int i = 0; i < fValue.length; i++) {
      NetworkInterface nwInterface = fValue[i];
      for (int j = 0; j < nwInterface.addresses.length; j++) {
        addressCount++;
        if (nwInterface.addresses[j].type.name == "IPv4") {
          ipv4Count++;
        }
        if (nwInterface.addresses[j].type.name == "IPv6") {
          ipv6Count++;
        }
      }
    }
    Expect.isTrue((ipv4Count == 0) && (addressCount == ipv6Count));
    asyncEnd();
  });
}
