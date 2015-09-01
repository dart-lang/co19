/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adjacent strings are implicitly concatenated to form a single
 * string literal.
 * @description Checks expected values of adjacent single and multi line
 * literals.
 * @author ilya
 */
import '../../../Utils/expect.dart';

check(s) {
  Expect.equals('''ab
cd''', s);
}

main() {
  check('a' '''b
cd''');

  check('''ab
c''' 'd');
  
  check(r'a' r'''b
cd''');

  check(r'''ab
c''' r'd');

  check('a' r'''b
cd''');

  check(r'''ab
c''' 'd');
  
  check(r'a' '''b
cd''');

  check('''ab
c''' r'd');

//---

  check("a" """b
cd""");

  check("""ab
c""" "d");
  
  check(r"a" r"""b
cd""");

  check(r"""ab
c""" r"d");

  check("a" r"""b
cd""");

  check(r"""ab
c""" "d");
  
  check(r"a" """b
cd""");

  check("""ab
c""" r"d");
}
