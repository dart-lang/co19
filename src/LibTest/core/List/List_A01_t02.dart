/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a list of the given length. The length of the returned list is not fixed.
 * @description Checks that created list is resizable.
 * @author varlax
 * @reviewer msyabro
 */

check(List l) {
  l.clear();
  l.length = 123;
  l.add(null);
  l.removeLast();
  l.insertRange(0,1);
  l.removeRange(0,1);
}

main() {
  check(new List<String>(0));
  check(new List(10));
}
