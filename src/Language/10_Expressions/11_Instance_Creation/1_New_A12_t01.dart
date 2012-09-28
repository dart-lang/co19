/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Regardless of whether R = C, let Ti be the type parameters of C (if any)
 * and let Bi be the bound of Ti, i from 1 to m. In checked mode, it is a dynamic
 * type error if Vi is not a subtype of [V1, ... , Vm/T1, ... , Tm]Bi, i from 1 to m.
 * @description Checks that it is a dynamic-type error if a type argument is not
 * a subtype of type parameter bound of class C.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 * @note http://code.google.com/p/dart/issues/detail?id=1380
 */

#import("../../../Utils/dynamic_check.dart");

interface R<T> default C<T extends num> {
  R();
}

class C<T extends num> {
  factory R() {}
}

class A<T extends num> {
  factory A() {}
}

main() {
  checkTypeError( () {
    new R<String>();
  });

  checkTypeError( () {
    new A<bool>();
  });
}
