/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String authority
 * Returns the authority component.
 * The authority is formatted from the userInfo, host and port parts.
 * Returns the empty string if there is no authority component.
 * @description Checks expected authority settings
 * @author ilya
 */

import "../../../Utils/expect.dart";

main() {
  var x = new Uri(userInfo: 'user:pass', host: 'foo', port:123);
  Expect.equals('user:pass@foo:123', x.authority);
  
  x = new Uri(port:123);
  Expect.equals(':123', x.authority);
  
  x = new Uri(userInfo: 'root');
  Expect.equals('root@', x.authority);

  x = Uri.parse('foo:bar');
  Expect.equals('', x.authority);
}

