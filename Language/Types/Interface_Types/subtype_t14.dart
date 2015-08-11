/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if S is a direct supertype of T.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that this statement is true for a class type extending parameterized class type.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class G<T> {}
class NonGeneric extends G<int> {}

// these produce the required static type for static checker 
// but won't fail at run time because they return null after all
G makeG() {}
G<int> makeGint() {}

main() {
  Expect.isTrue(new NonGeneric() is G);
  NonGeneric g4 = makeG();
  G g4_ = new NonGeneric();

  Expect.isTrue(new NonGeneric() is G<int>);
  NonGeneric g5 = makeGint();
  G<int> g5_ = new NonGeneric();
}
