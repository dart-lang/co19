/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is a class or parameterized type accessible in the current
 * scope then:
 * • If e of the form new T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k)
 *   it is a static warning if T.id is not the name of a constructor declared
 *   by the type T.
 * @description Checks that it is a compile error if the type being
 * instantiated is a parameterized type and does not declare a named
 * constructor T.id.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

class C<T> {}

main() {
  new C<int>.namedConstructor();
}
