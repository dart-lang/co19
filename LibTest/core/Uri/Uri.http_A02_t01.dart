/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Uri.http(String authority, String unencodedPath,
 * [Map<String, String> queryParameters])
 * Creates a new http URI from authority, path and query.
 * The userInfo, host and port components are set from the authority argument.
 * @description Checks correct components settings
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = new Uri.http('user:pass@localhost:1234', '');
  Expect.equals('user:pass', x.userInfo);
  Expect.equals('localhost', x.host);
  Expect.equals(1234, x.port);

  var host = '2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d';
  x = new Uri.http('user@[$host]:1234', '');
  Expect.equals('user', x.userInfo);
  Expect.equals(host, x.host);
  Expect.equals(1234, x.port);
}
