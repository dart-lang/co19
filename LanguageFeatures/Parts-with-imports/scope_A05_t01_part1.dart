// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let P be a prefix scope containing all the import prefixes
/// declared by the current file. The parent scope of P is I.
/// ...
/// - If an import is `deferred`, its Pname is a deferred scope which
///   has an extra `loadLibrary` member added, as usual, and the import has an
///   implicit `hide  loadLibrary` modifier.
///
/// @description Check that if an import is deferred an extra `loadLibrary`
/// member is added and it is a runtime error to access any of its members
/// before `loadLibrary()` completes successfully.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A05_t01.dart';

import 'scope_lib1.dart' deferred as l;

part 'scope_A05_t01_part2.dart'

testPart1() async {
  Expect.throws(() {print(l.libVar);});
  Expect.throws(() {print(l.libGetter);});
  Expect.throws(() {l.libSetter = "x";});
  Expect.throws(() {print(l.libFunc);});
  Expect.throws(() {print(l.LibClass.id);});
  Expect.throws(() {print(l.LibMixin.id);});
  Expect.throws(() {print(l.LibEnum.id);});
  Expect.throws(() {print(l.LibExt.id);});
  Expect.throws(() {print(l.LibET.id);});

  await l.loadLibrary();

  Expect.equals("scope_lib1 libVar", l.libVar);
  Expect.equals("scope_lib1 libGetter", l.libGetter);
  l.libSetter = "x";
  Expect.equals("scope_lib1 libFunc", l.libFunc);
  Expect.equals("scope_lib1 LibClass", l.LibClass.id);
  Expect.equals("scope_lib1 LibMixin", l.LibMixin.id);
  Expect.equals("scope_lib1 LibEnum", l.LibEnum.id);
  Expect.equals("scope_lib1 LibExt", l.LibExt.id);
  Expect.equals("scope_lib1 LibET", l.LibET.id);

  await l.loadLibrary(); // Not an error
}
