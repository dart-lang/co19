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

foo(/* param pababam */ param ) {
  if ( param == null ) {
    return/* param is null */ true;
  }
  return false;
}

class /* declare new class C */ C {
  C(/* default constructor */) { }
}

main() {
  var bar /* set value to -100*/=-100;
  Expect.equals(-100, bar);

  List l = new List(/* set length to 5*/5);
  Expect.equals(5, l.length);

  l[0/* init this value to 'String' */] = "String";

  for (var i = 1; i < l.length; i++
      /* set last elements to numbers from 1 to 4 */) {
    l[i] = i;
  }
  Expect.listEquals(["String", 1, 2, 3, 4], l);

  Expect.isTrue(foo(/* check 'null' */null));
  Expect.isFalse(foo(false/* check 'false' */));

  C c/*create instance of C*/ = new C();
  Expect.isTrue(c is C );
}
