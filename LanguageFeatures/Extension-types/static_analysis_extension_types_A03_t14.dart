// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is not an error if an extension type declares an
/// instance members with the basename `n` and there is a superinterface with a
/// non-extension static setter with the name `n`.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String _log = "";

class C {
  static void set n(String v) {
    _log = "C.n=$v";
  }
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
  C.n = "x";
  Expect.equals("C.n=x", _log);
  Expect.equals("ET1", ET1(C()).n());
  Expect.equals("ET2", ET2(C()).n);
  ET3(C()).n = "y";
  Expect.equals("ET3.n=y", _log);
}
