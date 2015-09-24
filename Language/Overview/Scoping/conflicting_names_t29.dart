/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if there is more than one entity 
 * with the same name declared in the same scope.
 * Dart is lexically scoped. Scopes may nest. A name or declaration d is 
 * available in scope S if d is in the namespace induced by S or if d is 
 * available in the lexically enclosing scope of S. We say that a name or 
 * declaration d is in scope if d is available in the current scope.
 * @description Checks that a name from the current lexical scope does not 
 * conflict with names in other, non-enclosing scopes.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

var x = 0;
f() {return x;}
g() {var x = 1; return f();}

main() {
  Expect.equals(0, g());
}
