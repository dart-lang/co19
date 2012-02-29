/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the getter lookup has failed, then a new instance im of the predefined
 * interface InvocationMirror is created by calling its factory constructor with arguments `get m`,
 * this, [] and {}. Then the method noSuchMethod() is looked
 * up in o and invoked with argument im, and the result of this invocation is the
 * result of evaluating i.
 * @description Checks that the method noSuchMethod is invoked with the specified arguments
 * if getter lookup has failed.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview Check the contents of InvocationMirror argument when it's available
 */

class TestException {}

class C {
  noSuchMethod(String fname, List args) {
    Expect.isTrue(fname.contains("g3tt3r"));
    // TODO check InvocationMirror contents
    throw new TestException();
  }
}

main()  {
  var o = new C();
  try {
    o.g3tt3r;
    Expect.fail("TestException is expected");
  } catch(TestException e) {}
}
