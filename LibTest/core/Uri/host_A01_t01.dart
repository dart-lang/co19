/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String host
 * Returns the host part of the authority component.
 * Returns the empty string if there is no authority component and hence no
 * host.
 * If the host is an IP version 6 address, the surrounding [ and ] is removed.
 * @description Checks expected host settings
 * @author ilya
 */

import "../../../Utils/expect.dart";

main() {
  Expect.equals('', new Uri(scheme: 'scheme', path: 'path').host);
  Expect.equals('host', new Uri(host: 'host').host);
  Expect.equals('host', new Uri.http('host', 'path').host);

  var ipv6 = '2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d';
  Expect.equals(ipv6, Uri.parse('asdf://[$ipv6]').host);
}

