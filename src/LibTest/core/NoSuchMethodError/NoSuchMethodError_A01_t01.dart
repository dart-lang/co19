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
  new NoSuchMethodError(null, null, null);
  new NoSuchMethodError(null, null, []);
  new NoSuchMethodError(null, null, [null]);
  new NoSuchMethodError(null, "foo", [1, 2]);
  new NoSuchMethodError("foo", null, [1, 2]);
  new NoSuchMethodError("foo", "foo", []);
  String foo = "foo";
  new NoSuchMethodError(foo, foo, [foo]);
}
