// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// ...
/// - The instance variable initialized by the parameter (and declared by it, if
///   the parameter is a field parameter), has the private name `p`.
///
/// @description Check that redirectee of a redirecting constructor uses a
/// public name of a private named parameter.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

class C {
  String _p;

  C({this._p = '_p'});
  C.named({required String v}) : this(p: v);
}

extension type ET._(String _p) {
  ET({this._p = '_p'});
  ET.named({required String v}) : this(p: v);
}

enum E {
  e0, e1(p: "one"), e2.named(v: "1");

  final String _p;

  const E({this._p = "_p"});
  const E.named({required String v}) : this(p: v);
}

main() {
  Expect.equals("_p", C()._p);
  Expect.equals("one", C(p: "one")._p);
  Expect.equals("1", C.named(v: "1")._p);

  Expect.equals("_p", ET()._p);
  Expect.equals("one", ET(p: "one")._p);
  Expect.equals("two", ET.named(v: "two")._p);

  Expect.equals("_p", E.e0._p);
  Expect.equals("one", E.e1._p);
  Expect.equals("1", E.e2._p);
}
