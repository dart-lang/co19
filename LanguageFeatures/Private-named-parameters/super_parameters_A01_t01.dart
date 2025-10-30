// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A super parameter generates an implicit argument that forwards to
/// a superclass constructor. The super constructor's argument name is always
/// public, even if the corresponding constructor parameter uses this feature
/// and has a private name. Thus, super parameters continue to always use public
/// names.
///
/// @description Check that private super parameter can be invoked using its
/// public name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters

import '../../Utils/expect.dart';

class A1 {
  String _p;
  A1({this._p = ""});
}

class A2 {
  String _p;
  A2({required this._p});
}

class C1 extends A1 {
  C1({super.p});
  C1.named({super.p});
}

class C2 extends A2 {
  C2({required super.p});
  C2.named({required super.p});
}

class C3 extends A1 {
  C3(String p) : super(p: p);
  C3.named(String p) : super(p: p);
}

class C4 extends A2 {
  C4(String p) : super(p: p);
  C4.named(String p) : super(p: p);
}

main() {
  Expect.equals("a", C1(p: "a")._p);
  Expect.equals("b", C1.named(p: "b")._p);
  Expect.equals("c", C2(p: "c")._p);
  Expect.equals("d", C2.named(p: "d")._p);
  Expect.equals("e", C3("e")._p);
  Expect.equals("f", C3.named("f")._p);
  Expect.equals("g", C4("g")._p);
  Expect.equals("h", C4.named("h")._p);
}
