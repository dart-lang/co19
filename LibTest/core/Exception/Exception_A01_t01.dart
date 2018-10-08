/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented: const Exception([var msg])
 * @description Checks that this constructor executes without error for various arguments (including null).
 * @author rodionov
 */
 
main() {
  new Exception(null);
  new Exception(true);
  new Exception(1);
  new Exception(0x8000000000000000);
  new Exception("");
  new Exception("asdgfsdjkg");
  new Exception([]);
  new Exception([null]);
  new Exception([1, true]);
}
