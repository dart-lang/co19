/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If getter lookup has also failed, then a new instance im of the
 * predeﬁned class Invocation is created, such that:
 * • im.isMethod evaluates to true.
 * • im.memberName evaluates to ’m’.
 * • im.positionalArguments evaluates to an immutable list with the same values
 *   as [o1, ..., on].
 * • im.namedArguments evaluates to an immutable map with the same keys and
 *   values as {xn+1:on+1, ..., xn+k:on+k}.
 * Then the method noSuchMethod() is looked up in Sdynamic and invoked on this
 * with argument im, and the result of this invocation is the result of
 * evaluating i.
 * @description Checks the result of invocation if the method noSuchMethod()
 * invoked.
 * @issue 25540
 * @author msyabro
 */
import '../../../../Utils/expect.dart';

@proxy
class S1 {
  noSuchMethod(Invocation im) {
    return "v";
  }
}

class A extends S1 {
  test() {
    Expect.equals("v", super.m());
  }
}

@proxy
class S2 {
  noSuchMethod(Invocation im) {
    return true;
  }
}

class B extends S2 {
  test() {
    Expect.equals(true, super.m());
  }
}

@proxy
class S3 {
  noSuchMethod(Invocation im) {
    return 1;
  }
}

class C extends S3 {
  test() {
    Expect.equals(1, super.m());
  }
}

@proxy
class S4 {
  noSuchMethod(Invocation im) {
    return null;
  }
}

class D extends S4 {
  test() {
    Expect.equals(null, super.m());
  }
}

main()  {
  new A().test();
  new B().test();
  new C().test();
  new D().test();
}
