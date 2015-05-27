/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int port
 * Returns the port part of the authority component.
 * Returns 0 if there is no port in the authority component.
 * @description Checks expected port settings
 * @author ilya
 * @reviewer
 */

import "../../../Utils/expect.dart";

main() {
  Expect.equals(123, Uri.parse('scheme://host:123').port);
  Expect.equals(0, Uri.parse('scheme://host').port);
}

