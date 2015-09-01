/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of o. It is a static type warning if T
 * does not have an accessible instance member named m unless T or a
 * superinterface of T is annotated with an annotation denoting a constant
 * identical to the constant @proxy deﬁned in dart:core.
 * @description Checks that there is no static type warning if T does not
 * have an instance member named m but have  @proxy annotation.
 * @static-clean
 * @author kaigorodov
 * @note issue #16233
 */
import '../../../../Utils/expect.dart';

@proxy
class I {}

class C implements I {}

main() {
  C o=new C();
  Expect.throws((){
    o.nonExistingMethod();
  }
  , (e)=>e is NoSuchMethodError
  );
}
