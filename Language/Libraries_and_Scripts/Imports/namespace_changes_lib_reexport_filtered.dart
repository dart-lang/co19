// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library Imports_A02_lib_reexport_filtered;

import "namespace_changes_p1_lib.dart" as P hide F;
import "namespace_changes_p2_lib.dart";
export "namespace_changes_p1_lib.dart" hide F;

final aFoo = "A_FOO";

typedef aTypeAlias(p1, p2);

aFunc() => 'aFunc';

class A extends P.B {
  A() { bar = "1_Imports_A02_lib.bar"; }
  static final FOO = "A.FOO";
}

//class K P.F implements J {
//  K() : super();
//}

abstract class J extends P.I {
//  factory J() = K;
  J():super.c();
  static final FOO = "J.FOO";  
}

class SubList<T> {
  List<T> list;
  SubList() : list = new List<T>() {}
  
  void add(T v) {
    list.add(v);
  }
}
