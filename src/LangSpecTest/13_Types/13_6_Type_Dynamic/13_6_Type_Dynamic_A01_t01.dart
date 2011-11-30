/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no static type annotation has been provided the type system assumes
 * the declaration has the unknown type (Dynamic).
 * @description Checks that a local variable without any type annotation has the unknown type. 
 * Note: all possible declarations are tested in the corresponding chapters.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  var x;
  Expect.isTrue(x is Dynamic);
}

