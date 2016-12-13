/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * @description Checks that this method executes without errors.
 * @author rodionov
 */
 
main() {
  new Object().toString();
  const Object().toString();
  (new Object() as dynamic).toString();
  (const Object() as dynamic).toString();
}
