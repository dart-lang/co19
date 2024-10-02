// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension `E` is applicable to a simple or composite member
/// invocation with corresponding member basename m and target expression `e`,
/// where `e` has static type `S`, if
/// ...
/// - The type S does not have an instance member with the basename m. For this,
///   the type `dynamic` is considered as having all member names, and an
///   expression of type `Never` or `void` cannot occur as the target of a
///   member invocation, so none of these can ever have applicable extensions.
///   Function types and the type `Function` are considered as having a `call`
///   member. This ensure that if there is an applicable extension, the existing
///   invocation would otherwise be a compile-time error. Members of `Object`
///   exists on all types, so they can never be the target of implicit member
///   invocations (they can also not be declared as extension members).
///
/// @description Check that an extension member with the basename `m` is
/// applicable if on type has a static member with the same name.
/// @author sgrekhov22@gmail.com
/// @issue 56818

import '../../Utils/expect.dart';

String _log = "";

class C {
  static String get m1 => "m1";
  static String m2() => "m2";
  static void set m3(String _) {
    _log = "m3";
  }
}

extension Ext on C {
  String get m1 => "Ext.m1";
  String m2() => "Ext.m2";
  void set m3(String _) {
    _log = "Ext.m3";
  }
}

main() {
  Expect.equals("Ext.m1", C().m1);
  Expect.equals("Ext.m2", C().m2());
  C().m3 = "";
  Expect.equals("Ext.m3", _log);
}
