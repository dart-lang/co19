/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A multi-line comment begins with the token '/*' and ends with the
 * token '*/'. Everything between '/*' and '*/' must be ignored by the Dart
 * compiler unless the comment is a documentation comment. Comments may nest.
 * MULTI LINE COMMENT  :
 *   '/''*' (MULTI LINE COMMENT | ~ '*''/')* '*''/'
 * ;
 * @description Checks that everything between '/*' and '*/' is ignored by
 * the Dart compiler.
 * @author vasya
 * @reviewer rodionov
 */
import "../../../../Utils/expect.dart";

main() {
  dynamic bar = true;
  /*
    bar = false;
  */
  Expect.equals(true, bar);

  dynamic foo;
  /*
    var foo = 1;
    throw foo;
    Expect.fail("epic!");
  */
  Expect.equals(null, foo);
  foo = bar = 0;
  Expect.equals(0, bar);
  Expect.equals(0, foo);

  /* return; */

  Expect.equals(true/*
                      false
                   */, true);
}
