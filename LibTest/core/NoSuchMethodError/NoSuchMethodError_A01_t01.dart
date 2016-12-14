/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that this constructor executes without error for various
 * sets of arguments (including null).
 * @author rodionov
 */

Symbol sym ([String s = '']) => new Symbol(s);

main() {
  new NoSuchMethodError(null, sym(), null, null);
  new NoSuchMethodError(null, sym(), [], {});
  new NoSuchMethodError(null, sym(), [null], {sym("a"): null});
  new NoSuchMethodError(null, sym("foo"), [1, 2], {sym("foo"): "bar"});
  new NoSuchMethodError("foo", sym(), [1, 2], {sym("foo"): "bar"});
  new NoSuchMethodError("foo", sym("foo"), [], {});
  String foo = "foo";
  new NoSuchMethodError(foo, sym(foo), [foo], {sym(): foo});
}
