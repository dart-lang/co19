// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an extension type declaration DV has a non-extension
/// type member named n in the case where DV does not declare a member named n,
/// and one of the following criteria is satisfied:
/// - DV has a direct extension type superinterface V that has a non-extension
///   type member with signature m and name n, and DV does not declare a member
///   that precludes m.
/// - DV has a direct non-extension type superinterface whose interface contains
///   a member signature m named n, and DV does not declare a member that
///   precludes m.
///
/// @description Checks that an instance members don't preclude a non-extension
/// static getter
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String _log = "";

class C {
  static String get n => "C";
}

extension type ET1(C _) implements C {
  String n() => "ET1";
}

extension type ET2(C _) implements C {
  String get n => "ET2";
}

extension type ET3(C _) implements C {
  void set n(String v) {
    _log = "ET3.n=$v";
  }
}

main() {
  Expect.equals("C", C.n);
  Expect.equals("ET1", ET1(C()).n());
  Expect.equals("ET2", ET2(C()).n);
  ET3(C()).n = "x";
  Expect.equals("ET3.n=x", _log);
}
