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
 * The port part of the authority component is set through port.
 * The port is normalized for scheme http and https where port 80 and port
 * 443 respectively is set.
 * @description Checks ports normalization
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = new Uri(scheme: 'HTTP', host: 'foo.bar');
  Expect.equals(80, x.port);

  x = new Uri(scheme: 'HTTPS', host: 'foo.bar');
  Expect.equals(443, x.port);
}
