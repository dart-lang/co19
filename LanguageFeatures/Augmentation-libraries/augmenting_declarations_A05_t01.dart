// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Because of augmentations, non-abstract class, mixin, mixin class,
/// enum, extension type, and extension declarations are now allowed to contain
/// abstract member declarations, as long as those members are equipped with a
/// body by an augmentation declaration.
///
/// @description Checks that it is not an error if a body of an abstract member
/// of a non-abstract class is provided by an augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_declarations_A05_t01_lib.dart';

class C {
  String abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

mixin M {
  String abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

enum E {
  e0;
  String abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

class A {}

extension Ext on A {
  String abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

extension type ET(String _) {
  String abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

class MA = Object with M;

main() {
  Expect.equals("abstractMethod", C().abstractMethod());
  Expect.equals("abstractGetter", C().abstractGetter);
  C().abstractSetter = "a";
  Expect.equals("abstractSetter = a", _log);

  Expect.equals("abstractMethod", MA().abstractMethod());
  Expect.equals("abstractGetter", MA().abstractGetter);
  MA().abstractSetter = "b";
  Expect.equals("abstractSetter = b", _log);

  Expect.equals("abstractMethod", E.e0.abstractMethod());
  Expect.equals("abstractGetter", E.e0.abstractGetter);
  E.e0.abstractSetter = "c";
  Expect.equals("abstractSetter = c", _log);

  Expect.equals("abstractMethod", A().abstractMethod());
  Expect.equals("abstractGetter", A().abstractGetter);
  A().abstractSetter = "d";
  Expect.equals("abstractSetter = d", _log);

  Expect.equals("abstractMethod", ET(0).abstractMethod());
  Expect.equals("abstractGetter", ET(0).abstractGetter);
  ET(0).abstractSetter = "e";
  Expect.equals("abstractSetter = e", _log);
}
