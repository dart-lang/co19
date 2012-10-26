/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of this is the interface of the immediately enclosing class.
 * @description Checks that the static type of this is not assignment compatible with another class.
 * @author kaigorodov
 * @static-warning
 * @reviewer rodionov
 */

class A {
}

class B {
  A func() {return this;}
}

main() {
  try {
    A a=new B().func();
  } on TypeError catch(e) {}
}
