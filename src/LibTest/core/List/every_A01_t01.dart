/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every element of the list satisfy the predicate [f]. Returns false otherwise.
 * @description Check that true is returned only if every element of the list satisfies the predicate [f].
 * @author vasya
 * @reviewer iefremov
 * @reviewer varlax
 */

#import("../../../../Utils/dynamic_check.dart");

main() {
  List a = [0,1,2,3,4,5,6,7,8,9];
  Expect.isTrue(a.every( bool f(int e) { return (e >= 0 && e < 10); } ));
  Expect.isFalse(a.every( bool f(int e) { return (e < 0); } ));

  a = [[],[null], [1,2,3,4], ["string"]];
  Expect.isTrue(a.every( bool f(Collection e) { return (e is List); } ));
  Expect.isFalse(a.every( bool f(Collection e) { return (e is Set); } ));

  a = [1,2,3];
  bool f (int e) { return (e > 0); }
  Expect.isTrue(a.every(f));
  List b = new List.from(a);
  Expect.isTrue(a.length == b.length && b.every(f));

  try {
    checkTypeError(() {
      a.insertRange(0,3,[-1,-2,-3]);
      a.every(f);
    });
  } catch(NoSuchMethodException ok){}
}
