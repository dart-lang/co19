// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When inferring types for constructs containing the non-const
/// production, in every place where the current specification specifies type
/// inference for one of the forms `T.id`, `T.id<typeArgs>`, `T.id(args)`,
/// `T.id<typeArgs>(args)`, `T.new`, or `T.new(args)`, where `T` is a type
/// literal, we introduce a parallel “or .id…” clause for a similarly shaped
/// `<staticMemberShorthand>`, proceeding to look up `id`/unnamed constructor in
/// the class denoted by the shorthand context assigned to the leading
/// `<staticMemberShorthandHead>`, just as we would have if `.id`/`.new` was
/// preceded by an identifier (or qualified identifier) denoting that
/// declaration.
///
/// @description Checks that shorthand syntax can be used in `T.new` and `T.id`
/// factory constructors redirection.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class A {
  String log = "";

  A() {
    log = "A.new";
  }
  A.id() {
    log = "A.id";
  }
}

class C extends A {
  C() {
    log = "C.new";
  }
  C.id() {
    log = "C.id";
  }
  factory C.f1() = .new;
  factory C.f2() = .id;
}

class D extends C {
  D() {
    log = "D.new";
  }
  D.id() {
    log = "D.id";
  }
}

extension type ET(int v) {
  ET.id(this.v);
  factory ET.f1(int v) = .new;
  factory ET.f2(int v) = .id;
}

main() {
  C c1 = C.f1();
  Expect.equals("C.new", c1.log);

  C c2 = C.f2();
  Expect.equals("C.id", c2.log);

  ET et1 = ET.f1(1);
  Expect.equals(1, et1.v);

  ET et2 = ET.f2(2);
  Expect.equals(2, et2.v);
}
