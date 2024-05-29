// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is not an error if an extension type declares an
/// instance member with the basename `n` and there is a superinterface with a
/// non-extension static getter with the name `n`.
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
