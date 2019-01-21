/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool broadcastEnabled
 * Set or get, whether IPv4 broadcast is enabled.
 *
 * IPv4 broadcast needs to be enabled by the sender for sending IPv4 broadcast
 * packages. By default IPv4 broadcast is disabled.
 *
 * For IPv6 there is no general broadcast mechanism. Use multicast instead.
 *
 * @description Checks that broadcastEnabled property may be get and set for the
 * RawDatagramSocket instance with an internet address used in a host parameter
 * of bind method.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(InternetAddress localhost) async {
  RawDatagramSocket socket = await RawDatagramSocket.bind(localhost, 0);
  Expect.equals(false, socket.broadcastEnabled);
  socket.broadcastEnabled = true;
  Expect.equals(true, socket.broadcastEnabled);
  socket.close();
}

main() {
  check(InternetAddress.anyIPv4);
  check(InternetAddress.anyIPv6);
  check(InternetAddress.loopbackIPv4);
  check(InternetAddress.loopbackIPv6);
}
