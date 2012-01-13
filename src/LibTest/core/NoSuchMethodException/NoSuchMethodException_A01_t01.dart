/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that this constructor executes without error for various sets of arguments (including null).
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview undocumented
 */
 
main() {
  new NoSuchMethodException(null, null, null);
  new NoSuchMethodException(null, null, []);
  new NoSuchMethodException(null, null, [null]);
  new NoSuchMethodException(null, "foo", [1, 2]);
  new NoSuchMethodException("foo", null, [1, 2]);
  new NoSuchMethodException("foo", "foo", []);
  String foo = "foo";
  new NoSuchMethodException(foo, foo, [foo]);
}
