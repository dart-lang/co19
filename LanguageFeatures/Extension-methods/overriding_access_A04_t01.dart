/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form [MyList(object)] or
 * [MyList<String>(object)] must only be used for extension member access. It is
 * a compile-time error to use it in any other way, similarly to how it is a
 * compile-time error to use a prefix for anything other than member access.
 * This also means that you cannot use an override expression as the receiver of
 * a cascade, because a cascade does evaluate its receiver to a value, or of an
 * assigning operator like += or ++. Unlike a prefix, it doesn't have to be
 * followed by a [.] because extensions can also declare operators, but it must
 * be followed by a [.], a declared operator, or an arguments part (in case the
 * extension implements call).
 * @description Check that overriding extensions can be used without member
 * access call.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "extension_conflict_resolution_lib.dart" as testlib;

extension Ext1 on String {
  bool get test => false;
}

main() {
  testlib.MySimpleExt("testme");        //# 01: compile-time error
  Ext1("testme");                       //# 02: compile-time error

  testlib.MySimpleExt("testme")++;      //# 03: compile-time error
  Ext1("testme") += 14;                 //# 04: compile-time error
  testlib.MySimpleExt("testme")--;      //# 05: compile-time error
  Ext1("testme") *= 10;                 //# 06: compile-time error

  Ext1("testme") = 12;                  //# 07: compile-time error
  testlib.MySimpleExt("testme") = -33;  //# 08: compile-time error
  Ext1("testme") = null;                //# 09: compile-time error
  testlib.MySimpleExt("testme") = null; //# 10: compile-time error
}
