/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of the cast expression e as T proceeds as follows:
 * The expression e is evaluated to a value v. Then, if the interface of the class
 * of v is a subtype of T, the cast expression evaluates to v. Otherwise, if v is null,
 * a NullPointerException is thrown. In all other cases, a CastException is thrown.
 * @description Checks that the type cast operator throws a CastException when v is not null
 * and the type of v is not a subtype of T.
 * @author rodionov
 * @reviewer iefremov
 */

interface I {}
class C implements I {
  C(this.x);
  int x;
}
interface G<S, T> {}
typedef bool func(int i);

main() {
  try {
    1 as double;
    Expect.fail("CastException expected");
  } catch (CastException ok) {}

  try {
    1 as func;
    Expect.fail("CastException expected");
  } catch (CastException ok) {}

  try {
    1 as G<int, int>;
    Expect.fail("CastException expected");
  } catch (CastException ok) {}

  try {
    true as I;
    Expect.fail("CastException expected");
  } catch (CastException ok) {}

  try {
    new C(1) as G<int, bool>;
    Expect.fail("CastException expected");
  } catch (CastException ok) {}

  try {
    (() => true) as func;
    Expect.fail("CastException expected");
  } catch (CastException ok) {}

  try {
    (() => true) as int;
    Expect.fail("CastException expected");
  } catch (CastException ok) {}
}
