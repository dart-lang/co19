// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<List<InternetAddress>> lookup(String host,
///   { InternetAddressType type: InternetAddressType.any })
/// If type is either [InternetAddressType.IPv4] or [InternetAddressType.IPv6]
/// it will only lookup addresses of the specified type.
/// @description Checks that if type is set to [InternetAddressType.IPv6] result
/// [Future] list contains IPv6 addresses only.
/// @author iarkh@unipro.ru


import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

main() {
  Future<List<InternetAddress>> list =
    InternetAddress.lookup("::1", type: InternetAddressType.IPv6);

  list.then((addresses) {
    addresses.forEach((InternetAddress addr) {
      Expect.equals(InternetAddressType.IPv6, addr.type);
    });
  }, onError: (e) { Expect.fail("Unexpected error appeared: $e"); });
}
