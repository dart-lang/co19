// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentations aren't allowed to replace code, so they mostly add
/// entirely new declarations to the surrounding type. However, function and
/// constructor augmentations can fill in a body for an augmented declaration
/// that is lacks one.
///
/// @description Checks that it is not an error if a body of an abstract static
/// member is provided by an augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
part 'augmenting_declarations_A05_t02_lib.dart';

class C {
  static String abstractMethod();
  static String get abstractGetter;
  static void set abstractSetter(String v);
}

mixin M {
  static String abstractMethod();
  static String get abstractGetter;
  static void set abstractSetter(String v);
}

enum E {
  e0;
  static String abstractMethod();
  static String get abstractGetter;
  static void set abstractSetter(String v);
}

class A {}

extension Ext on A {
  static String abstractMethod();
  static String get abstractGetter;
  static void set abstractSetter(String v);
}

extension type ET(String _) {
  static String abstractMethod();
  static String get abstractGetter;
  static void set abstractSetter(String v);
}

main() {
  Expect.equals("abstractMethod", C.abstractMethod());
  Expect.equals("abstractGetter", C.abstractGetter);
  C.abstractSetter = "a";
  Expect.equals("abstractSetter = a", _log);

  Expect.equals("abstractMethod", M.abstractMethod());
  Expect.equals("abstractGetter", M.abstractGetter);
  M.abstractSetter = "b";
  Expect.equals("abstractSetter = b", _log);

  Expect.equals("abstractMethod", E.abstractMethod());
  Expect.equals("abstractGetter", E.abstractGetter);
  E.abstractSetter = "c";
  Expect.equals("abstractSetter = c", _log);

  Expect.equals("abstractMethod", Ext.abstractMethod());
  Expect.equals("abstractGetter", Ext.abstractGetter);
  Ext.abstractSetter = "d";
  Expect.equals("abstractSetter = d", _log);

  Expect.equals("abstractMethod", ET.abstractMethod());
  Expect.equals("abstractGetter", ET.abstractGetter);
  ET.abstractSetter = "e";
  Expect.equals("abstractSetter = e", _log);
}
