/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T << U and U << S.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Checks that if type T is a subtype of S1 and S2 where S1 <: S<G1> and S2 <: S<G2> then
 * T is a subtype of S<G1> as well as S<G2> and every other supertype of S.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

class S<Type> {}
class S1 extends S<int> {}
class S2 extends S<double> {}
class T implements S1, S2 {}

main() {
  Expect.isTrue(new T() is S<int>);
  Expect.isTrue(new T() is S<double>);
  Expect.isTrue(new T() is S<num>);
  Expect.isTrue(new T() is S<Object>);
  Expect.isTrue(new T() is S);
}
