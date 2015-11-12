/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The predeﬁned Dart function identical() is deﬁned such that
 * identical(c1, c2) iff:
 * . . .
 *  • c1 and c2 are constant strings and c1 == c2.
 * @description Checks that two constant strings are identical() iff they are
 * equal
 * @author ilya
 */
import "../../../Utils/expect.dart";

const hello = 'hello, ';
const world = 'world';
const helloWorld = 'hello, world';

main() {
  Expect.isTrue(identical("", ''));
  Expect.isTrue(identical('hello, world', helloWorld));
  Expect.isTrue(identical(helloWorld, '$hello$world' ));
  Expect.isTrue(identical(helloWorld, 'hello, ' 'world'));

  Expect.isFalse(identical(helloWorld, '$world$hello' ));
}
