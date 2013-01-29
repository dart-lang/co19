/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is a class or parameterized type accessible in the current scope then:
 * If e of the form new T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) it is a
 * static warning if T.id is not the name of a constructor declared by the type T.
 * @description Checks that it is a static warning if the type being instantiated 
 * does not declare a named constructor T.id.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

class C {}

main() {
  Expect.throws(
    () {new C.namedConstructor();}, /// static warning - unavailable named constructor, see "Instance creation|New"
    (e)=> e is NoSuchMethodError
  );
}
