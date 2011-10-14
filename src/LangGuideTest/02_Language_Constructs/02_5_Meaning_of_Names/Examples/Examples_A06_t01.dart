/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Within a method body, certain statements and expressions introduce new scopes.
 * @description Check that names in different scopes don't conflict with each other.
 * @author msyabro
 */

class A {
  method() {
    {
      var i;
    }
    
    for (var i = 0; i < 10; i++) {}
    
    void f(i) {}
  }
}

main() {}
