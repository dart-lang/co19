// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is already a compile-time error for multiple declarations to
/// have the same name in the same scope. This error is checked after part files
/// and augmentations have been applied. In other words, it's an error to
/// declare the same top-level name in a library and a part, the same top-level
/// name in two parts, the same static or instance name inside an introductory
/// declaration and an augmentation on that declaration, or the same static or
/// instance name inside two augmentations of the same declaration.
///
/// @description Checks that members of a declaration are resolved after all
/// part files and augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
part 'scoping_A02_t03_lib.dart';

const name1 = "Top level 1";
const name2 = "Top level 2";

class C {
  static String test1() => name1;
  String test2() => name2;
}

mixin M {
  static String test1() => name1;
  String test2() => name2;
}

class MA = Object with M;

enum E {
  e0;
  static String test1() => name1;
  String test2() => name2;
}

class A {}

extension Ext on A {
  static String test1() => name1;
  String test2() => name2;
}

extension type ET(String id) {
  static String test1() => name1;
  String test2() => name2;
}

main() {
  Expect.equals("Static member", C.test1());
  Expect.equals("Instance member", C().test2());
  Expect.equals("Static member", M.test1());
  Expect.equals("Instance member", MA().test2());
  Expect.equals("Static member", E.test1());
  Expect.equals("Instance member", E.e0.test2());
  Expect.equals("Static member", Ext.test1());
  Expect.equals("Instance member", A().test2());
  Expect.equals("Static member", ET.test1());
  Expect.equals("Instance member", ET("x").test2());
}
