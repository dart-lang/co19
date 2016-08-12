/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * constantConstructorSignature:
 *   const qualified formalParameterList
 * ;
 * @description Checks various correct constant constructor signatures.
 * @author iefremov
 */

class A<T> {
  const A();
  const A.$();
  const A.abyrvalg();
  const A.abrakadabra(T t, var x, [String o, var p]);
}

main() {
  var a = const A();
  var b = const A.$();
  var c = const A.abyrvalg();
  var d = const A.abrakadabra(1, 2, "");
}
