/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adjacent strings are implicitly concatenated to form a single
 * string literal.
 * @description Checks that the result of concatenation is indeed a literal,
 * by using it in a context where a constant expression is expected.
 * @author ilya
 */

const s = 'foo' 'bar';

class C {
  const C() : x = '''hello, ''' '''world''', y = s;
  final x,y;
}

main() {
  const C();
}
