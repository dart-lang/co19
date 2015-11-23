/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is possible to embed expressions within non-raw string
 * literals, such that these expressions are evaluated, and the resulting
 * values are converted into strings and concatenated with the enclosing
 * string. This process is known as string interpolation.
 * stringInterpolation:
 *   '$' IDENTIFIER_NO_DOLLAR |
 *   '$' '{' expression '}'
 * ;
 * @description Checks that it is not a compile-time error when an
 * interpolation construct in a multi-line string is an expression that is
 * broken up by newlines where whitespace characters are allowed and that such
 * expression is evaluated correctly.
 * @author rodionov
 * @reviewer kaigorodov
 */
import '../../../../Utils/expect.dart';

main() {
  String s1 = """${2
  		*

  		2
    }""";

  Expect.equals("4", s1);

  String s2 = '''${3
    *

    4
  }''';
  Expect.equals("12", s2);

  String s3 = """${
    "foo"
    'bar'
  }""";
  Expect.equals("foobar", s3);

  String s4 = '''${
    'bar'
    "foo"
  }''';
  Expect.equals("barfoo", s4);
}
