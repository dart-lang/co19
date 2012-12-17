/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of this is the interface of the immediately enclosing class.
 * @description Checks that the static type of this is not assignment compatible with another class.
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../Utils/dynamic_check.dart";

class A {
}

class B {
  A func() {return this;}
}

main() {
  checkTypeError(() {
    A a=new B().func(); /// static type warning
  });
}
