/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

class S1 {
  Object a;
  Object b;
  
  S1(this.a, this.b);
}

List<Object> table = [
  new S1(1234, "1234"),
  new S1(null, []),
  new S1(1.234, {}),
  new S1("1.234", {}),
  new S1("key2", [null, 1.0])
];
