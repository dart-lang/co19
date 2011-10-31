/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that this constructor executes without error for various index values.
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview undocumented
 */
 
main() {
  new IndexOutOfRangeException(0);
  new IndexOutOfRangeException(1);
  new IndexOutOfRangeException(-1);
  new IndexOutOfRangeException(0x80000000);
  new IndexOutOfRangeException(0x7fffffff);
}
