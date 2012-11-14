/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if S is a direct supertype of T.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that this statement is true for a parameterized type extending other parameterized
 * type with the same type parameter.
 * @author iefremov
 * @reviewer rodionov
 */

class G<T> {}
class Generic<T> extends G<T> {}

// these produce the required static type for static checker 
// but won't fail at run time because they return null after all
G makeG() {}
G<int> makeGint() {}
G<Object> makeGObject() {}

main() {
  Expect.isTrue(new Generic() is G);
  G g = new Generic();
  Generic g_ = makeG();

  Expect.isTrue(new Generic<int>() is G<int>);
  G<int> g2 = new Generic<int>();
  Generic<int> g2_ = makeGint();

  Expect.isTrue(new Generic<Object>() is G<Object>);
  G<Object> g3 = new Generic<Object>();
  Generic<Object> g3_ = makeGObject();
}
