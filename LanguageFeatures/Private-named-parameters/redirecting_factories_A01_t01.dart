// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting factory declares a formal parameter list which must
/// correspond to the formal parameter list of the redirectee.
/// ...
/// With this feature, the treatment of named parameters is modified:
/// A private named parameter `p` in the redirectee corresponds to
// a named parameter `p1` in the redirecting constructor whose name
// is the corresponding public name of the name in `p`.
///
/// @description Check that it is not an error when a redirecting factory
/// constructor `k` has a redirectee `k1`, where `k1` declares a private named
/// parameter and `k` declares a named parameter with the corresponding public
/// name.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

class A {
  factory({int p}) = B;
}

class B({final int _p = 0}) implements A;

class C {
  String _p;

  C._({this._p = '_p'});
  factory({required String p}) = C._;
}

extension type ET._(String _p) {
  ET({this._p = '_p'});
  factory named({String p}) = ET.new;
}

main() {
  Expect.equals(0, (A() as B)._p);
  Expect.equals(1, (A(p: 1) as B)._p);
  Expect.equals('C', C(p: 'C')._p);
  Expect.equals('_p', ET.named()._p);
  Expect.equals('ET', ET(p: 'ET')._p);
}
