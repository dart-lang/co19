/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names may be introduced into a scope by  declarations within the
 * scope or by other mechanisms such as imports or inheritance.
 * @description Checks that names may be introduced into a scope by 
 * declaration within the scope.
 * @author msyabro
 * @reviewer iefremov
 */

class C {
  var classScope;
  method() {
    classScope = 1;
  }
}

func() {
  var functionScope;
  functionScope = 1;
  libraryScope = 1;
}

var libraryScope;

main() {
  {
    var statementScope;
    statementScope = 1;
  }
  func();
  new C().method();
}
