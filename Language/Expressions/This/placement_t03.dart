/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if this appears, implicitly or
 * explicitly, in a top-level function or variable initializer, in a factory
 * constructor, or in a static method or variable initializer, or in the
 * initializer of an instance variable.
 * @description Checks that it is a compile-error if 'this' appears in a
 * top-level variable initializer.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

var x = this;

main() {
  try {
    print(x);
  } catch (e) {}
}
