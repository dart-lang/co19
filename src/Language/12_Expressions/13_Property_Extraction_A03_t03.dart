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
 * @description Checks that static type of property extraction is the type of
 * method it extracts.
 * @static-clean
 * @author ilya
 */
import "../../Utils/expect.dart";

typedef int PositionalType(int x, [int y]);
typedef String NamedType(String foo, {String bar});

class C {
  int positional(int x, [int y=0]) => x+y;
  String named(String foo, {String bar:''}) => foo+bar;
}

class D extends C {
  get super_positional => super.positional;
  get super_named => super.named;
}

main() {
  PositionalType x = new D().super_positional;
  NamedType y = new D().super_named;
}

