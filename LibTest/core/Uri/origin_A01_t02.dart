/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String origin
 * Returns the origin of the URI in the form scheme://host:port for
 * the schemes http and https.
 * It is an error if the scheme is not "http" or "https".
 * @description Checks that this property returns scheme://host:port
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var uriStr = "http://www.dartlang.org/index.dart";
  Expect.equals("http://www.dartlang.org", Uri.parse(uriStr).origin);

  uriStr = "HTTP://WWW.DARTLANG.ORG/INDEX.DART";
  Expect.equals("http://www.dartlang.org", Uri.parse(uriStr).origin);

  var uri = new Uri(scheme: "http", host: "www", port: 1234);
  Expect.equals("http://www:1234", uri.origin);
}
