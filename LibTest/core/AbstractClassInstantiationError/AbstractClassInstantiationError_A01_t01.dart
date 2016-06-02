/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion AbstractClassInstantiationError(String _className)
 * Creates a new Object instance.
 * @description Checks that this constructor executes without error for various
 * strings and null.
 * @author kaigorodov
 */

main() {
  new AbstractClassInstantiationError(null);
  new AbstractClassInstantiationError("");
  new AbstractClassInstantiationError("foo");
  new AbstractClassInstantiationError("You are not paid to think!");
}
