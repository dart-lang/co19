/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of o. It is a static type warning if T does not have
 * does not have an accessible instance member named m unless T or a
 * superinterface of T is annotated with an annotation denoting a constant
 * identical to the constant @proxy deﬁned in dart:core.
 * @description Checks that it is a static type warning if member m exists in T 
 * but is inaccessible.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

import '../lib.dart';

//library code

// library lib;
//
// class C {
//   _func() {}
// }

main() {
  C o=new C();
  Expect.throws((){
    o._func(); /// static type warning
  }
  , (e)=>e is NoSuchMethodError
  );
}
