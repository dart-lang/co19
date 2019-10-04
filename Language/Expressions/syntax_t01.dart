/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression is a fragment of Dart code that can be evaluated
 * at run time to yield a value, which is always an object.
 * . . .
 *  expression:
 *    assignableExpression assignmentOperator expression |
 *    conditionalExpression cascadeSection* |
 *    throwExpression
 *  ;
 *
 *  expressionWithoutCascade:
 *    assignableExpression assignmentOperator expressionWithoutCascade |
 *    conditionalExpression |
 *    throwExpressionWithoutCascade
 *  ;
 *
 *  expressionList:
 *    expression (`, ' expression)*
 *  ;
 *
 *  primary:
 *    thisExpression |
 *    super assignableSelector |
 *    functionExpression |
 *    literal |
 *    identifier |
 *    newExpression |
 *    new type ‘#’ (‘.’ identifier)? |
 *    constObjectExpression |
 *    `(' expression `)'
 *  ;
 * An expression [e] may always be enclosed in parentheses, but this never has
 * any semantic effect on [e].
 * @description Checks that a valid expression enclosed in parentheses is also a
 * valid expression and evaluates the same way.
 * @author hlodvig
 * @needsreview TODO: extend to cover all expressions.
 */

import "../../Utils/expect.dart";

class S {
  var x = 25;
}

class A extends S {
  void checkThis() {
    Expect.equals(this, (this));
    Expect.equals(super.x, (super.x));
  }
}

main() {
  Expect.isTrue(1 == (1));
  Expect.isTrue(1 == ( 1 ));
  Expect.isTrue("a" == ("a"));
  Expect.isTrue("a${21}" == ("a${21}"));
  Expect.isTrue(true == (true));
  Expect.isTrue(false == (false));
  Expect.isTrue(null == (null));
  Expect.isTrue(-1.1 == (-1.1));
  Expect.isTrue(([]) is List);
  Expect.listEquals([], ([]));
  Expect.listEquals([1, 2, "three"], ([1, 2, "three"]));
  Expect.isTrue(({}) is Map);
  Expect.mapEquals({}, ({}));
  Expect.mapEquals({"foo": "f00", "bar": 214}, ({"foo": "f00", "bar": 214}));
  Expect.isTrue(() {return 3;}() == (() {return 3;}()));
  Expect.isTrue((new A()) is A);
  Expect.isTrue((new A()) != null);
  A a = new A();
  Expect.equals(a, (a));
  a.checkThis();
}
