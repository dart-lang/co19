/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory List([int length])
 * Creates a list of the given length.
 * The list is a fixed-length list if length is provided, and an empty growable
 * list if length is omitted.
 * @description Checks that created list is resizable if length is not provided.
 * @author varlax
 */

check(List l) {
  l.clear();
  l.length = 123;
  l.add(null);
  l.removeLast();
  l.removeRange(0,1);
}

main() {
  check(new List<String>());
  check(new List());
}
