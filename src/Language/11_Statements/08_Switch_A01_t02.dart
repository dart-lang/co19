/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The switch statement supports dispatching control among a large number of cases.
 * switchStatement:
 * switch '(' expression ')' '{' switchCase* defaultCase? '}'
 * ;
 * switchCase:
 * label? (case expression ':')+ statements
 * ;
 * defaultCase:
 * label? (case expression ':')* default ':' statements
 * ;.
 * @description Checks case fall-through.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 * @needsreview FallThroughError is not documented in the spec, but it appears whenever there is a case fall-through.
 * @needsreview Issue 1644
 */

foo(value) {
  var result;
  
  switch(value) {
    case "f00":
      break;
      
    case "foo": 
      result = "FOO";
      
    case "bar": 
      result = "BAR"; 
      break;
      
    default: 
      result = "NULL";
  }

  return result;
}

main() {
  Expect.equals(null, foo("f00"));
  Expect.equals("NULL", foo(""));
  Expect.equals("BAR", foo("bar"));
  
  try {
    foo("foo");
    Expect.fail("FallThroughError expected");
  } catch (FallThroughError ok) {}
}
