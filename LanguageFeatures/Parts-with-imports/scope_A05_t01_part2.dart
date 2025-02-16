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

part of 'scope_A05_t01_part1.dart';

import 'scope_lib2.dart' deferred as l2;

testPart2() async {
  // From scope_lib1.dart
  Expect.equals("scope_lib1 libVar", l1.libVar);
  Expect.equals("scope_lib1 libGetter", l1.libGetter);
  l1.libSetter = "x";
  Expect.equals("scope_lib1 libFunc", l1.libFunc());
  Expect.equals("scope_lib1 LibClass", l1.LibClass.id);
  Expect.equals("scope_lib1 LibMixin", l1.LibMixin.id);
  Expect.equals("scope_lib1 LibEnum", l1.LibEnum.id);
  Expect.equals("scope_lib1 LibET", l1.LibET.id);

  // From scope_lib2.dart
  Expect.throws(() {print(l2.libId);});
  Expect.throws(() {print(l2.lib2Func());});

  await l2.loadLibrary();

  Expect.equals("scope_lib2", l2.libId);
  Expect.equals("scope_lib2 lib2Func", l2.lib2Func());

  await l1.loadLibrary(); // Not an error
  await l2.loadLibrary(); // Not an error
}
