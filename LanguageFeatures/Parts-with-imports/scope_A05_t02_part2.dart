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
/// before `loadLibrary()` completes successfully. Test the case when
/// `loadLibrary()` is called from another part file.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A05_t02_part1.dart';

testPart2() async {
  // From scope_lib1.dart
  Expect.throws(() {print(l1.libVar);});
  Expect.throws(() {print(l1.libGetter);});
  Expect.throws(() {l1.libSetter = "x";});
  Expect.throws(() {print(l1.libFunc);});
  Expect.throws(() {print(l1.LibClass.id);});
  Expect.throws(() {print(l1.LibMixin.id);});
  Expect.throws(() {print(l1.LibEnum.id);});
  Expect.throws(() {print(l1.LibExt.id);});
  Expect.throws(() {print(l1.LibET.id);});

  await l1.loadLibrary();

  Expect.equals("scope_lib1 libVar", l1.libVar);
  Expect.equals("scope_lib1 libGetter", l1.libGetter);
  l1.libSetter = "x";
  Expect.equals("scope_lib1 libFunc", l1.libFunc);
  Expect.equals("scope_lib1 LibClass", l1.LibClass.id);
  Expect.equals("scope_lib1 LibMixin", l1.LibMixin.id);
  Expect.equals("scope_lib1 LibEnum", l1.LibEnum.id);
  Expect.equals("scope_lib1 LibExt", l1.LibExt.id);
  Expect.equals("scope_lib1 LibET", l1.LibET.id);

  await l1.loadLibrary(); // Not an error
}
