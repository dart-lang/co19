/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
library null_aware_assignment;

class C {
  static var v = null;

  var v1 = null;

  operator[](idx) {
  return idx == 0 ? null : idx;
  }

  void operator[]=(idx, val) {
    v1 = val;
  }
}

var v = null;

var c1 = new C();