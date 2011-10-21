/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> intersection(Collection<E> other)
 * Returns a new set which is the intersection between this set and
 * the given collection. 
 * @description Checks that the returned intersection is correct as long as the specified
 * collection is not null. Element types tested include int, null, String and Object.
 * @author rodionov
 */


main() {
  Expect.setEquals([2], new Set.from([1, 2]).intersection([2, 3]));
  Expect.setEquals([], new Set.from(["foo"]).intersection(["fOo", "bar"]));
//  var foo = new Object();
//  Expect.setEquals([foo], new Set.from([foo, new Object(), new Object()]).intersection([new Object(), foo]));
}
