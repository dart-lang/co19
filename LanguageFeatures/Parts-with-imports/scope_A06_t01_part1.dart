// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let P be a prefix scope containing all the import prefixes
/// declared by the current file. The parent scope of P is I.
/// ...
/// - If Pname is not `deferred`, and the parent scope in C has a non-deferred
///   prefix import scope with the same name, Cname, then the parent scope of
///   Pname is Cname. A part file can use the same prefix as a prefix that it
///   inherits, because inherited imports are only suggestions. If it adds to
///   that import scope, by importing into it, that can shadow existing
///   declarations, just like in the top-level declaration scope. A deferred
///   prefix import scope cannot be extended, and cannot extend another prefix
///   scope, deferred prefix scopes are always linked to a single import
///   directive.
///
/// @description Check that a part file can use the same prefix as a prefix that
/// it inherits. In this case it shadows inherited declarations.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A06_t01.dart';

import 'parts_lib.dart' as l;

part 'scope_A06_t01_part2.dart';

testPart1() async {
  // From parts_lib.dart
  Expect.equals("libVar", l.libVar);
  Expect.equals("libGetter", l.libGetter);
  l.libSetter = "x";
  Expect.equals("libSetter", l.log);
  Expect.equals("libFunc", l.libFunc);
  Expect.equals("LibClass", l.LibClass.id);
  Expect.equals("LibMixin", l.LibMixin.id);
  Expect.equals("LibEnum", l.LibEnum.id);
  Expect.equals("LibExt", l.LibExt.id);
  Expect.equals("LibET", l.LibET.id);
}
