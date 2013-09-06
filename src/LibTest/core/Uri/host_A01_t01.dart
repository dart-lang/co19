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
 * @description Checks expected host settings
 * @author ilya
 * @reviewer
 */

import "../../../Utils/expect.dart";

main() {
  Expect.equals('', new Uri(scheme: 'scheme', path: 'path').host);
  Expect.equals('host', new Uri(host: 'host').host);
  Expect.equals('host', new Uri.http('host', 'path').host);
}

