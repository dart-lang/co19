/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new Uri({scheme, String userInfo: "", String host: "", port: 0,
 * String path, Iterable<String> pathSegments, String query, Map<String,
 * String> queryParameters, fragment: ""})
 * Creates a new URI from its components.
 * The host part of the authority component is set through host.
 * The host can either be a hostname, a IPv4 address or an IPv6 address,
 * contained in '[' and ']'. If the host contains a ':' character, the
 * '[' and ']'  are added if not already provided.
 * @description Checks listed assertions
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = new Uri(host: 'a-b.c.d.e');
  Expect.equals('a-b.c.d.e', x.host);
  
  x = new Uri(host: '127.0.0.1');
  Expect.equals('127.0.0.1', x.host);

  var host = '2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d';
  x = new Uri(host: host);

  // host getter will strip off [ ], so need to check otherwise
  Expect.isTrue(x.toString().contains('[$host]'));

  x = new Uri(host: '[$host]');
  Expect.isTrue(x.toString().contains('[$host]'));
}
