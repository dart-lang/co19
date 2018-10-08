/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A factory is a constructor prefaced by the built-in identifier
 * factory.
 * factoryConstructorSignature:
 *   factory identifier ('.' identifier)? formalParameterList
 * ;
 * @description Checks various valid factory declarations, including those
 * referencing classes from another file.
 * @author iefremov
 */
library test;
import "../../../../Utils/expect.dart";
import "syntax_t01.lib.dart" as lib;

class Iface {
  var x;
  var y;
  Iface(this.x, [this.y=2]);
  factory Iface.named() {return new C();}
  factory Iface.named2(int i, C j, [String s]) {return new C.id2(i, j, s);}
}

class C extends Iface {
  C.id(var x, [var y]):super(x,y);
  C.id2(int i, C j, [String s]): this.id(i);
  C(): this.id(1);
}

// imported interface
class AImpl implements lib.A {
  int methodA() { return 1; }
  int methodB() { return 2; }
}

 main() {
  new Iface(1);
  new Iface(1, 2);
  new Iface.named();
  new Iface.named2(1, new C());
  new Iface.named2(1, new C(), "");

  new C();
  new C.id(3);

  AImpl val = new lib.A();
  Expect.equals(true, (val is AImpl));
  Expect.equals(1, val.methodA());
  Expect.equals(2, val.methodB());

  val = new lib.A.named();
  Expect.equals(true, (val is AImpl));
  Expect.equals(1, val.methodA());
  Expect.equals(2, val.methodB());
}
