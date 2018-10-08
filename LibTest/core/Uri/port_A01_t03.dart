/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int port
 * Returns the port part of the authority component.
 * Returns the default port if there is no port number in the authority
 * component. That's 80 for http, 443 for https, and 0 for everything else.
 * @description Checks default port numbers for different schemas
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(80, Uri.parse('http://host').port);
  Expect.equals(443, Uri.parse('https://host').port);
  Expect.equals(0, Uri.parse('scheme://host').port);

  Expect.equals(80, new Uri(scheme: "http").port);
  Expect.equals(443, new Uri(scheme: "https").port);
  Expect.equals(0, new Uri(scheme: "foo").port);
}
