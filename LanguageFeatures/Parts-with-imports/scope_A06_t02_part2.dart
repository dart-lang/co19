// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `P`, the combined import scope of `F`, be a scope with `I` as
/// enclosing scope and a namespace containing every import prefix declared by
/// an import declaration of `F`.
/// ...
/// - If `Pname` is not `deferred`, and the enclosing scope in `C` has a
///   non-deferred prefix import scope with the same name, `Cname`, then the
///   enclosing scope of `Pname` is `Cname`. A part file can have an import with
///   the same prefix as a prefix that it inherits. The new import's
///   declarations will all be available through the prefix, but any declaration
///   of the inherited prefix which isn't shadowed by a new import, will also be
///   available. The imported declarations will shadow the parent file's import
///   scope declarations, just like imports in the top-level import scope will
///   shadow top-level imports with the same name inherited from parent files.
///
///   Deferred prefix scopes always correspond to a single import directive, in
///   a single library, which can be loaded independently of any other import.
///
/// @description Check that a part file can use the same deferred import prefix
/// as a prefix that it inherits. In this case it shadows inherited declarations
/// @author sgrekhov22@gmail.com
/// @issue 61806

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A06_t02_part1.dart';

import 'scope_lib1.dart' deferred as l hide LibExt;

testPart2() async {
  await l.loadLibrary();
  // From scope_lib1.dart
  Expect.equals("scope_lib1 libVar", l.libVar);
  Expect.equals("scope_lib1 libGetter", l.libGetter);
  l.libSetter = "x";
  Expect.equals("libSetter", l.log);
  Expect.equals("scope_lib1 libFunc", l.libFunc());
  Expect.equals("scope_lib1 LibClass", l.LibClass.id);
  Expect.equals("scope_lib1 LibMixin", l.LibMixin.id);
  Expect.equals("scope_lib1 LibEnum", l.LibEnum.id);
  Expect.equals("scope_lib1 LibET", l.LibET.id);
  // From parts_lib.dart
  Expect.equals(0, l.counter);
}
