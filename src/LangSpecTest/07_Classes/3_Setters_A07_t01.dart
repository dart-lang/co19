/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class has a setter with argument type T 
 * and a getter of the same name with return type S, and T may not be assigned to S. 
 * @description Checks that it is a static warning if a class defines a setter and
 * a getter of the same name with argument/return types that are not mutually
 * assignable. Types in getter/setter signatures provided as type parameters with type
 * bounds that are not mutually assignable (int and String).
 * @static-type-error
 * @author vasya
 * @reviewer rodionov
 */

class C<T extends int, S extends String> {
  set foo(T t) { foo_ = t; }

  S get foo() { return foo_; }
  
  var _foo;
}

main() {
  (new C<int, String>()).foo = null;
}
