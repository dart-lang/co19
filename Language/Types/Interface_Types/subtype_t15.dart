/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if one
 * of the following conditions is met:
 *  • T is S.
 *  • T is ⊥
 *  • S is dynamic.
 *  • S is a direct supertype of T.
 *  • T is a type parameter and S is the upper bound of T.
 *  • T is a type parameter and S is Object.
 *  • T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn>
 *    and Ti << Si 1 <= i <= n.
 *  • T and S are both function types, and T << S under the rules of section
 *    (Types/Function Types).
 *  • T is a function type and S is Function.
 *  • T << U and U << S.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff
 * [⊥/Dynamic]T << S.
 * . . .
 * An interface type T may be assigned to a type S, written T <=> S, if either
 * T <: S or S <: T.
 * @description Checks type check and assigment for generic class types with
 * a bunch of type parameters.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class G {}

class IManyArgs<A, B, C, D, E> {}
class CManyArgs<A, B, C> extends IManyArgs<int, A, B, C, double> {}

// these produce the required static type for static checker
// but won't fail at run time because they return null after all
IManyArgs<int, G, G, G, double> make1() {}
IManyArgs<int, List, Map, Queue, double> make2() {}

main() {
  Expect.isTrue(new CManyArgs<G, G, G>() is IManyArgs<int, G, G, G, double>);
  CManyArgs<G, G, G> g6 = make1();
  IManyArgs<int, G, G, G, double> g6_ = new CManyArgs<G, G, G>();

  Expect.isTrue(new CManyArgs<List, Map, Queue>()
      is IManyArgs<int, List, Map, Queue, double>);
  CManyArgs<List, Map, Queue> g7 = make2();
  IManyArgs<int, List, Map, Queue, double> g7_ =
      new CManyArgs<List, Map, Queue>();
}
