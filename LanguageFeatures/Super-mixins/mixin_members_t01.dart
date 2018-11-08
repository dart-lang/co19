/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixin introduced by a mixin declaration contains all the
 * non-static members declared by the mixin, just as the mixin derived from a
 * class declaration currently does.
 *
 * @description Checks that a mixin declaration contains all the non-static
 * members declared by the mixin.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class I {
  String iProperty = "I property";
  String iMethod() => "I method";
  String get iGetter => "I getter";
  void set iSetter(String val) {}
  String operator ~() => "I operator";
}

abstract class J {
  String jProperty;
  String jMethod();
  String get jGetter;
  void set jSetter(String val);
  String operator -() => "J operator";
}

class A {
  String aProperty = "A property";
  String aMethod() => "A method";
  String get aGetter => "A getter";
  void set aSetter(String val) {}
  String operator +(A v) => "A operator";
}

abstract class B {
  String bProperty;
  String bMethod();
  String get bGetter;
  void set bSetter(String);
  String operator -(B v) => "B operator";
}

class C implements A, B {
  String iProperty = "C I property";
  String iMethod() => "C I method";
  String get iGetter => "C I getter";
  void set iSetter(String val) {}
  String operator ~() => "C I operator";

  String jProperty = "C J property";
  String jMethod() => "C J method";
  String get jGetter => "C J getter";
  void set jSetter(String) {}
  String operator -() => "C J operator";

  String aProperty = "C A property";
  String aMethod() => "C A method";
  String get aGetter => "C A getter";
  void set aSetter(String) {}
  String operator +(A v) => "C A operator";

  String bProperty = "C B property";
  String bMethod() => "C B method";
  String get bGetter => "C B getter";
  void set bSetter(String) {}
  String operator -(B v) => "C B operator";
}

mixin M on A, B implements I, J {
  String mProperty = "M property";
  String mMethod() => "M method";
  String get mGetter => "M getter";
  void set mSetter(String val) {}
  String operator *(M v) => "M operator";
}

class MA extends C with M {
  test() {
    Expect.equals("C I property", this.iProperty);
    Expect.equals("C I method", this.iMethod());
    Expect.equals("C I getter", this.iGetter);
    this.iSetter = "x";
    Expect.equals("C I operator", ~this);

    Expect.equals("C J property", this.jProperty);
    Expect.equals("C J method", this.jMethod());
    Expect.equals("C J getter", this.jGetter);
    this.jSetter = "x";
    Expect.equals("C J operator", -this);

    Expect.equals("C A property", this.aProperty);
    Expect.equals("C A method", this.aMethod());
    Expect.equals("C A getter", this.aGetter);
    this.aSetter = "x";
    Expect.equals("C A operator", this + this);

    Expect.equals("C B property", this.bProperty);
    Expect.equals("C B method", this.bMethod());
    Expect.equals("C B getter", this.bGetter);
    this.bSetter = "x";
    Expect.equals("C B operator", this - this);

    Expect.equals("M property", this.mProperty);
    Expect.equals("M method", this.mMethod());
    Expect.equals("M getter", this.mGetter);
    this.mSetter = "x";
    Expect.equals("M operator", this * this);
  }
}

main() {
  MA ma = new MA();
  Expect.equals("C I property", ma.iProperty);
  Expect.equals("C I method", ma.iMethod());
  Expect.equals("C I getter", ma.iGetter);
  ma.iSetter = "x";
  Expect.equals("C I operator", ~ma);

  Expect.equals("C J property", ma.jProperty);
  Expect.equals("C J method", ma.jMethod());
  Expect.equals("C J getter", ma.jGetter);
  ma.jSetter = "x";
  Expect.equals("C J operator", -ma);

  Expect.equals("C A property", ma.aProperty);
  Expect.equals("C A method", ma.aMethod());
  Expect.equals("C A getter", ma.aGetter);
  ma.aSetter = "x";
  Expect.equals("C A operator", ma + ma);

  Expect.equals("C B property", ma.bProperty);
  Expect.equals("C B method", ma.bMethod());
  Expect.equals("C B getter", ma.bGetter);
  ma.bSetter = "x";
  Expect.equals("C B operator", ma - ma);

  Expect.equals("M property", ma.mProperty);
  Expect.equals("M method", ma.mMethod());
  Expect.equals("M getter", ma.mGetter);
  ma.mSetter = "x";
  Expect.equals("M operator", ma * ma);

  ma.test();
}
