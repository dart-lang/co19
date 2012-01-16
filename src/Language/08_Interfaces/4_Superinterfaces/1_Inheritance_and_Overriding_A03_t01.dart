/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface may override instance members that would otherwise have been
 * inherited from its superinterfaces.
 * Let I be an interface declared in library L, with superinterface S and let I declare 
 * an instance member m, and assume S declares an instance member m' with the same name as m. 
 * Then m overrides m' iff m is accessible (3.2) to L and one of the following holds:
 * - m is an instance method.
 * - m is a getter and m' is a getter or a method.
 * - m is a setter and m' is a setter or a method.
 * Whether an override is legal or not is described elsewhere in this specification.
 * 8.2/7.2: a method cannot override a getter and vice versa
 * 8.2/7.3: a method cannot override a setter and vice versa
 * 8.1: it is a static warning if the type of the overriding interface method/getter/setter is not
 * a subtype of the superinterface method/getter/setter being overridden.
 * @description Checks that an interface method can override another method it would otherwise inherit
 * without any static type warnings if its type is a subtype of the superinterface's method's type.
 * @author rodionov
 * @reviewer kaigorodov
 * @note Only makes sense when static checker is used (and dartc's seems to be stricter than VM's)
 */

interface I {
  void m(int v, [String vv]);
}

interface J extends I {
  int m(num vee, [Pattern vv]);
}


main() {
  J j = null;
  
  try {j.m(0.5, new RegExp("pttrn"));} catch (NullPointerException npe) {}
}
