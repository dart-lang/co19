// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#library("2_Imports_A02_lib");
#import("2_Imports_A02_p1_lib.dart", prefix: "P");
#import("2_Imports_A02_p2_lib.dart");

final aFoo = "A_FOO";

typedef aTypeAlias(p1, p2);

aFunc() => 'aFunc';

class A extends P.B {
  A() { bar = "1_Imports_A02_lib.bar"; }
  static final FOO = "A.FOO";
}

class K extends P.F implements J {
  K() : super();
}

interface J extends P.I default K {
  J();
  static final FOO = "J.FOO";  
}

class SubList<T> {
  List<T> list;
  SubList():list=new List<T>(){}
  
  void add(T v) {
    list.add(v);
  }
}
