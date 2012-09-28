/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, q is a factory constructor. Then:
 * If R != C then let Wi be the type parameters of R (if any) and let Di be the
 * bound of Wi, i from 1 to m. In checked mode, it is a dynamic type error if Vi is
 * not a subtype of [V1, ... , Vm/W1, ... , Wm]Di, i from 1 to m.
 * @description Checks that it is a dynamic-type error if a type argument is not
 * a subtype of type parameter bound of interface R.
 * @author msyabro
 * @reviewer rodionov
 * @note http://code.google.com/p/dart/issues/detail?id=1380
 */

#import("../../../Utils/dynamic_check.dart");

interface R<T extends num> default C {
  R();
}

class C<T> {
  factory R() {}
}

main() {
  checkTypeError( () {
    new R<String>();
  });
}
