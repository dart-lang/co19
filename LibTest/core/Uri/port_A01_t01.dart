/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int port
 * Returns the port part of the authority component.
 * Returns the defualt port if there is no port number in the authority
 * component. That's 80 for http, 443 for https, and 0 for everything else.
 * @description Checks expected port settings
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(123, Uri.parse('scheme://host:123').port);
  Expect.equals(234, new Uri(port: 234).port);
}
