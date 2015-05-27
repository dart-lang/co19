/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ..., Tk, [Tk+1, ..., Tn+k]) -> T is a subtype of the function
 * type (S1, ..., Sk+j, [Sk+j+1, ..., Sn] -> S, if all of the following conditions are met:
 * 1. Either S is void or T is assignable to S.
 * 2. Ti <=> Si for i in 1 to n.
 * @description Checks that function type t1 is not a subtype of function type t2 if the declared type
 * of an positional optional parameter of t1 is not assignable to a corresponding parameter of t2 
 * (both t1 and t2 have a single positional optional parameter).
 * @author iefremov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

class A {}
class B {}

typedef t1([int p]);
typedef t3([A p]);
typedef t4([List<A> p]);
typedef t5([t1 p]);

main() {
  Expect.isFalse(([double p]) {} is t1);
  Expect.isFalse(([bool p]) {} is t1);
  Expect.isFalse(([A p]) {} is t1);
  Expect.isFalse(([List<int> p]) {} is t1);
  Expect.isFalse(([t3 p]) {} is t1);
                   
  Expect.isFalse(([double p]) {} is t3);
  Expect.isFalse(([bool p]) {} is t3);
  Expect.isFalse(([List<int> p]) {} is t3);
  Expect.isFalse(([t3 p]) {} is t3);
  Expect.isFalse(([B p]) {} is t3);
                   
  Expect.isFalse(([double p]) {} is t4);
  Expect.isFalse(([bool p]) {} is t4);
  Expect.isFalse(([A p]) {} is t4);
  Expect.isFalse(([List<int> p]) {} is t4);
  Expect.isFalse(([List<B> p]) {} is t4);
  Expect.isFalse(([t3 p]) {} is t4);
                   
  Expect.isFalse(([double p]) {} is t5);
  Expect.isFalse(([bool p]) {} is t5);
  Expect.isFalse(([A p]) {} is t5);
  Expect.isFalse(([List<int> p]) {} is t5);
  Expect.isFalse(([t3 p]) {} is t5);
  Expect.isFalse(([t4 p]) {} is t5);
  Expect.isFalse(([t5 p]) {} is t5);
}
