/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function may have a return type.
 * The return type is either a valid type or void.
 * @description Checks that the return type has to exist.
 * @compile-error
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  B f() {}
}
