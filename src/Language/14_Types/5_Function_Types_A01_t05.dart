/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ... Tn, [Tx1 x1, ..., Txk xk]) -> T is a subtype of the function
 * type (S1, ..., Sn, [Sy1 y1, ..., Sym ym ]) -> S, if all of the following conditions are met:
 * 1. Either S is void, or T <=> S.
 * 2. For all i 1 <= i <= n, Ti <=> Si.
 * 3. k >= m and xi = yi , for each i in 1..m.
 * 4. For all y, {y1 , . . . , ym} Sy <=> Ty
 * @description Checks that this statement is true for function types with no arguments: 
 * S is some type, T is some other type assignable to S.
 * @author iefremov
 * @reviewer rodionov
 */

typedef returnsDynamic();
typedef Object returnsObject();
typedef num returnsNum();

main() {
  //() -> T is () -> dynamic
  Expect.isTrue(void f() {} is returnsDynamic);
  Expect.isTrue(int f() {} is returnsDynamic);
  Expect.isTrue(String f() {} is returnsDynamic);
  Expect.isTrue(double f() {} is returnsDynamic);
  Expect.isTrue(Object f() {} is returnsDynamic);
  Expect.isTrue(returnsDynamic f() {} is returnsDynamic);
  Expect.isTrue(List f() {} is returnsDynamic);
  Expect.isTrue(List<int> f() {} is returnsDynamic);
  Expect.isTrue(Map<int, List<List<List>>> f() {} is returnsDynamic);

  //() -> T is () -> Object
  Expect.isTrue(int f() {} is returnsObject);
  Expect.isTrue(String f() {} is returnsObject);
  Expect.isTrue(double f() {} is returnsObject);
  Expect.isTrue(Object f() {} is returnsObject);
  Expect.isTrue(List f() {} is returnsObject);
  Expect.isTrue(List<int> f() {} is returnsObject);
  Expect.isTrue(Map<int, List<List<List>>> f() {} is returnsObject);

  //() -> T is () -> num
  Expect.isTrue(int f() {} is returnsNum);
  Expect.isTrue(double f() {} is returnsNum);
  Expect.isTrue(num f() {} is returnsNum);
}
