// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a function declaration does not declare a return type
/// explicitly, its return type is dynamic, unless it is a constructor, in which
/// case it is not considered to have a return type, or it is a setter or
/// operator []=, in which case its return type is void
///
/// @description Checks that if a function declaration does not declare a return
/// type then its return type is dynamic
/// @author msyabro

import "../../../Utils/expect.dart";

f() {}
g() => 1;

main() {
  Expect.throws(() { f().someMethod(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { f().x;            }, (e) => e is NoSuchMethodError);
  Expect.throws(() { g().someMethod(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { g().x;            }, (e) => e is NoSuchMethodError);
}
