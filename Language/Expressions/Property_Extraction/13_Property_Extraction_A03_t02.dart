/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let S be the superclass of the immediately enclosing class.
 * If m is the name of a concrete method member of S, then the expression
 * super.m is defined to be equivalent to:
 * - (r1,...,rn,{p1:d1,...,pk:dk}) {return super.m(r1,...,rn,p1:p1,...,pk:pk);}
 *   if m has required parameters r1,...,rn, and named parameters p1,...,pk
 *   with defaults d1,...,dk.
 * - (r1,...,rn,[p1=d1,...,pk=dk]) {return super.m(r1,...,rn,p1,...,pk);}
 *   if m has required parameters r1,...,rn, and optional positional
 *   parameters p1,...,pk with defaults d1,...,dk.
 * Except that:
 *  1. iff identical(o1, o2) then o1.m == o2.m.
 *  2. The static type of the property extraction is the static type of the
 * method S.m, if S.m is defined. Otherwise the static type of super.m is
 * dynamic.
 * @description Checks that property extraction returns equal results for
 * identical() objects and not equal results for not identical() objects
 * @author ilya
 */
import '../../../Utils/expect.dart';

class C {
  positional(x, [y=0]) => x+y;
  named(foo, {bar:''}) => foo+bar;
}

class D extends C {
  get super_positional => super.positional;
  get super_named => super.named;
}

main() {
  var d1 = new D();
  var d2 = new D();
  
  Expect.equals(d1.super_positional, d1.super_positional);
  Expect.notEquals(d1.super_positional, d2.super_positional);
}

