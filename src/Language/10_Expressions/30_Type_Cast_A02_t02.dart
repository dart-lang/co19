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
 * @description Checks that the type cast operator throws a NullPointerException when
 * the first argument evaluates to null.
 * @author rodionov
 * @reviewer iefremov
 */

n() => null;

class C {}
interface G<S, T> {}
typedef bool func(int);

main() {
  try {
    n() as int;
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}

  try {
    null as C;
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}

  try {
    n() as G<int, bool>;
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}

  try {
    n() as func;
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}
}
