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
/// public name. Test declaring constructors.
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

class C1({super.p}) extends A1;

class C2 extends A2 {
  this({required super.p});
}

main() {
  Expect.equals("a", C1(p: "a")._p);
  Expect.equals("b", C2(p: "b")._p);
}
