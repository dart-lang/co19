/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A unqualified function invocation is of the form id(arg1, ..., argN).
 * The unqualified identifier id is resolved in the lexical scope and the unqualified function expression is evaluated as:
 * - A regular instance-method invocation, this.id(arg1, ..., argN), if the identifier resolved to an instance method or
 *   if the identifier could not be resolved.
 * - A static-method invocation, C.id(arg1, ..., argN), if the identifier resolved to a static method declared in class C.
 * - A function-object invocation, (id)(arg1, ..., argN), if the identifier resolved to a local function, a local variable,
 *   parameter, or field.
 * If the identifier resolved to something other than a function, field, variable, or parameter, for example a type,
 * it is a resolution error.
 * @description Expression evaluated as instance-method invocation
 * @author msyabro
 * @reviewer akuznecov
 * @needsreview add test: check for priority 
 */

class A {
  A() {}
  
  int func1(var x, var y) {
    return x + y;
  }
  
  func() {
    Expect.isTrue(func1(1 , 1) == 2);
  }
}


void main() {
  A a = new A();
  a.func();
}
