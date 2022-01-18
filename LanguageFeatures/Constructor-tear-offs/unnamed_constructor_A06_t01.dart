// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In [dart:mirrors], the name of the constructor is still just [C],
/// not [C.new] (that's not a valid symbol, and we don't want to break existing
/// reflection using code).
///
/// @description Checks that the name of the constructor in [dart::mirrors] is
/// [C].
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";
import 'dart:mirrors';

class C {
  int x;
  C(this.x);

  checkName() {
    bool found = false;
    ClassMirror classMirror = reflect(C(1)).type;
    for (var v in classMirror.declarations.values) {
      String name = MirrorSystem.getName(v.simpleName);
      found = name == "C";
      if(name == "new") {
        Expect.fail("Constructor name is new");
      }
    }
    Expect.isTrue(found);
  }
}

void main() {
  if(!isJS) {
    C(1).checkName();

    C.new(1).checkName();

    var v = C.new;
    v(1).checkName();
  }
}
