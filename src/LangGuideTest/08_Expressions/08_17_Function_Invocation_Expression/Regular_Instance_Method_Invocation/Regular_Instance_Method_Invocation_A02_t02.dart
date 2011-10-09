/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The regular instance-method invocation is evaluated by first creating N+1 fresh local variables $0, ..., $N 
 * and then evaluating the following statements in order: 
 * final $0 = expr; final $1 = arg1; ...; final $N = argN;.
 * Otherwise, the class of the object stored in $0 is fetched and the identifier id is looked up as an N-ary instance method in this class.
 * If no method is found, the result of the invocation expression is equivalent to: $0.noSuchMethod(@"id", $1, ..., $N).
 * Otherwise the method is invoked with the given arguments.
 * @description Check result of expression when no method is found
 * @author msyabro
 * @reviewer akuznecov
 */

class A {
  A() {}
}


void main() {
  A a = new A();
  try {
    a.func(1, 1);

  } catch(NoSuchMethodException e) {}
}
