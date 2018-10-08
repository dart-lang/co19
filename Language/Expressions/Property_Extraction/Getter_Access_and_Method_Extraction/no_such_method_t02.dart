/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the getter lookup has failed, then a new instance im of the
 * predefined class Invocation is created, such that :
 * • im.isGetter evaluates to true.
 * • im.memberName evaluates to the symbol m.
 * • im.positionalArguments evaluates to an immutable/unmodifiable empty list.
 * • im.namedArguments evaluates to the an immutable/unmodifiable empty map.
 * Then the method noSuchMethod() is looked up in o and invoked with argument
 * im, and the result of this invocation is the result of evaluating i.
 * @description Checks that the result of invocation in case of failed getter
 * lookup is the result of invoking the appropriate noSuchMethod method.
 * @author msyabro, sgrekhov@unipro.ru
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class A {
  noSuchMethod(Invocation im) {
    return "v";
  }
}

class B {
  noSuchMethod(Invocation im) {
    return true;
  }
}

class C {
  noSuchMethod(Invocation im) {
    return 1;
  }
}

class D {
  noSuchMethod(Invocation im) {
    return null;
  }
}

main()  {
  dynamic classWithGetter1 = new A();
  Expect.equals("v", classWithGetter1.v);

  dynamic classWithGetter2 = new B();
  Expect.equals(true, classWithGetter2.v);

  dynamic classWithGetter3 = new C();
  Expect.equals(1, classWithGetter3.v);

  dynamic classWithGetter4 = new D();
  Expect.equals(null, classWithGetter4.v);
}
