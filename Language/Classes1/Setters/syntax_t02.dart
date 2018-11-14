/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * setterSignature:
 *   returnType? set identifier formalParameterList
 * ;
 * @description Checks that if the setter identifier is missing, declaration is 
 * recognized as a function declaration named 'set', and no compile-time error 
 * is issued. 
 * @author kaigorodov
 */

class C {
  void set (int i) {}
}

main() {
  new C().set(1);
}
