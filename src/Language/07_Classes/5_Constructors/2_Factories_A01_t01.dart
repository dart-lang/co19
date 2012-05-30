/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A factory is a constructor prefaced by the built-in identifier factory.
 * factoryConstructorSignature:
 *   factory qualified ('.' identifier)? formalParameterList
 * ;
 * @description Checks various valid factory declarations, including those referencing
 * an interface from another file.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview issue 2478
 */

#library("test");
#import("2_Factories_A01_t01.lib.dart", prefix:"lib");

interface Iface default C {
  Iface(var x, [var y]);
  Iface.named();
  Iface.named2(int i, C j, [String s]);
}

class C {
  factory C() {}
  factory C.id() {}

  factory Iface(var x, [var y]) {}
  factory Iface.named() {}
  factory Iface.named2(int i, C j, [String s]) {}
}

interface I default Z {
  I(var x, [var y]);
  I.named();
  I.named2(int i, C j, [String s]);
}

class Z implements I {
  Z(var x, [var y]);
  Z.named();
  Z.named2(int i, C j, [String s]);
}

// imported interface
class AImpl implements lib.A {
  int methodA() { return 1; }
  int methodB() { return 2; }
}

class ADef {
  // References an interface in another library
  factory lib.A () { return new AImpl(); }
  factory lib.A.named() {return new AImpl();}
}

 main() {
  new Iface(1);
  new Iface(1, 2);
  new Iface.named();
  new Iface.named2(1, new C());
  new Iface.named2(1, new C(), "");

  new C();
  new C.id();

  new I(1);
  new I(1, 2);
  new I.named();
  new I.named2(1, new C());
  new I.named2(1, new C(), "");

  new Z(1);
  new Z(1, 2);
  new Z.named();
  new Z.named2(1, new C());
  new Z.named2(1, new C(), "");

  var val = new lib.A();
  Expect.equals(true, (val is AImpl));
  Expect.equals(1, val.methodA());
  Expect.equals(2, val.methodB());

  val = new lib.A.named();
  Expect.equals(true, (val is AImpl));
  Expect.equals(1, val.methodA());
  Expect.equals(2, val.methodB());
}
