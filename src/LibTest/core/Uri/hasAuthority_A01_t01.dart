/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool hasAuthority
 * Returns whether the URI has an authority component.
 * @description Checks expected hasAuthority settings
 * @author ilya
 * @reviewer
 */

import "../../../Utils/expect.dart";

main() {
  var x = new Uri(userInfo: 'user:pass', host: 'foo', port:123);
  Expect.isTrue(x.hasAuthority);
  
  x = new Uri(port:123);
  Expect.isFalse(x.hasAuthority);
  
  x = new Uri(userInfo: 'root');
  Expect.isFalse(x.hasAuthority);
}

