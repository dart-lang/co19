/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Returns true if one element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that the method always returns false on an empty list.
 * @author msyabro
 * @reviewer varlax
 */

main() {
  Expect.isFalse(new List().any((int e) { } ));
  Expect.isFalse(new List().any((var e) {return false;} ));
  Expect.isFalse(new List().any((var e) {return true;} ));
  Expect.isFalse(new List().any((var e) {Expect.fail("Should not be executed");}));

  Expect.isFalse(new List(0).any((int e) { } ));
  Expect.isFalse(new List(0).any((var e) {return false;} ));
  Expect.isFalse(new List(0).any((var e) {return true;} ));
  Expect.isFalse(new List(0).any((var e) {Expect.fail("Should not be executed");}));

  Expect.isFalse([].any((int e) { } ));
  Expect.isFalse([].any((var e) {return false;} ));
  Expect.isFalse([].any((var e) {return true;} ));
  Expect.isFalse([].any((var e) {Expect.fail("Should not be executed");}));

  Expect.isFalse(const [].any((int e) { } ));
  Expect.isFalse(const [].any((var e) {return false;} ));
  Expect.isFalse(const [].any((var e) {return true;} ));
  Expect.isFalse(const [].any((var e) {Expect.fail("Should not be executed");}));

  Expect.isFalse(new List.from([]).any((int e) { } ));
  Expect.isFalse(new List.from([]).any((var e) {return false;} ));
  Expect.isFalse(new List.from([]).any((var e) {return true;} ));
  Expect.isFalse(new List.from([]).any((var e) {Expect.fail("Should not be executed");}));
}
