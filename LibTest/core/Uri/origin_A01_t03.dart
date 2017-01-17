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
 * @description Checks that exception is thrown if origin cannot be used
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var uriStr = "dartlang.org/index.dart";
  var uri = Uri.parse(uriStr);
  Expect.throws(() {uri.origin;});

  uriStr = "http://";
  uri = Uri.parse(uriStr);
  Expect.throws(() {uri.origin;});

  uri = new Uri(host: "www.dartlang.org");
  Expect.throws(() {uri.origin;});

  uri = new Uri(scheme: "", host: "www.dartlang.org");
  Expect.throws(() {uri.origin;});

  uri = new Uri(scheme: "foo", host: "www.dartlang.org");
  Expect.throws(() {uri.origin;});
}
