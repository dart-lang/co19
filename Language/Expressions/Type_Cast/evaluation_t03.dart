/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of the cast expression e as T proceeds as follows:
 * The expression e is evaluated to a value v.
 * Then, if T is malformed or deferred type, a dynamic error occurs.
 * Otherwise, if the interface of the class of v is a subtype of T, the cast
 * expression evaluates to v.
 * Otherwise, if v is null, the cast expression evaluates to v.
 * In all other cases, a CastError is thrown.
 * @description Checks that the type cast operator throws a CastError when v
 * is not null and the type of v is not a subtype of T.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

abstract class I {}
class C implements I {
  C(this.x);
  int x;
}
abstract class G<S, T> {}
typedef bool func(int i);

main() {
  try {
    1 as func;
    Expect.fail("CastError expected");
  } on CastError catch (ok) {}
  on TypeError catch (ok) {}

  try {
    1 as G<int, int>;
    Expect.fail("CastError expected");
  } on CastError catch (ok) {}
  on TypeError catch (ok) {}

  try {
    true as I;
    Expect.fail("CastError expected");
  } on CastError catch (ok) {}
  on TypeError catch (ok) {}

  try {
    new C(1) as G<int, bool>;
    Expect.fail("CastError expected");
  } on CastError catch (ok) {}
  on TypeError catch (ok) {}

  try {
    (() => true) as func;
    Expect.fail("CastError expected");
  } on CastError catch (ok) {}
  on TypeError catch (ok) {}

  try {
    (() => true) as int;
    Expect.fail("CastError expected");
  } on CastError catch (ok) {}
  on TypeError catch (ok) {}
}
