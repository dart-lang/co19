// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a function declaration does not declare a return type
/// explicitly, its return type is dynamic, unless it is a constructor, in which
/// case it is not considered to have a return type, or it is a setter or
/// operator []=, in which case its return type is void
///
/// @description Checks that return type of a constructor is the immediately
/// enclosing class.
/// @author sgrekhov22@gmail.com

import "../../../Utils/static_type_helper.dart";

class C {
  C() {}
  C.n() {}
}

main() {
  C.new.expectStaticType<Exactly<C Function()>>();
  C.n.expectStaticType<Exactly<C Function()>>();
}
