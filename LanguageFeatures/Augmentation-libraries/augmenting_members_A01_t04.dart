// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An augmenting declaration uses `augmented` when the augmented
/// declaration has no concrete implementation. Note that all external
/// declarations are assumed to have an implementation provided by another
/// external source, and otherwise they will throw a runtime error when called.
/// An `abstract` variable introduces no implementation.
///
/// @description Checks that it is a not an error if an augmenting
/// declaration uses `augmented` when the augmented declaration is an external
/// static.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_members_A01_t04_lib.dart';
import '../../Utils/expect.dart';

class C {
  external static String externalMethod();
  external static String get externalGetter;
  external static void set externalSetter(String v);
  external static String externalVariable;
  external static final String externalFinalVariable;
}

mixin M {
  external static String externalMethod();
  external static String get externalGetter;
  external static void set externalSetter(String v);
  external static String externalVariable;
  external static final String externalFinalVariable;
}

enum E {
  e0;
  external static String externalMethod();
  external static String get externalGetter;
  external static void set externalSetter(String v);
  external static String externalVariable;
  external static final String externalFinalVariable;
}

class A {}

extension Ext on A {
  external static String externalMethod();
  external static String get externalGetter;
  external static void set externalSetter(String v);
  external static String externalVariable;
  external static final String externalFinalVariable;
}

extension type ET(String _) {
  external static String externalMethod();
  external static String get externalGetter;
  external static void set externalSetter(String v);
  external static String externalVariable;
  external static final String externalFinalVariable;
}

main() {
  Expect.equals("Augmented", C.externalMethod());
  Expect.equals("Augmented", C.externalGetter);
  C.externalSetter = "a";
  Expect.equals("externalSetter = a", _log);
  Expect.equals("Augmented", C.externalVariable);
  C.externalVariable = "b";
  Expect.equals("externalVariable = b", _log);
  Expect.equals("Augmented", C.externalFinalVariable);

  Expect.equals("Augmented", M.externalMethod());
  Expect.equals("Augmented", M.externalGetter);
  M.externalSetter = "c";
  Expect.equals("externalSetter = c", _log);
  Expect.equals("Augmented", M.externalVariable);
  M.externalVariable = "d";
  Expect.equals("externalVariable = d", _log);
  Expect.equals("Augmented", M.externalFinalVariable);

  Expect.equals("Augmented", E.externalMethod());
  Expect.equals("Augmented", E.externalGetter);
  E.externalSetter = "e";
  Expect.equals("externalSetter = e", _log);
  Expect.equals("Augmented", E.externalVariable);
  E.externalVariable = "f";
  Expect.equals("externalVariable = f", _log);
  Expect.equals("Augmented", E.externalFinalVariable);

  Expect.equals("Augmented", Ext.externalMethod());
  Expect.equals("Augmented", Ext.externalGetter);
  Ext.externalSetter = "g";
  Expect.equals("externalSetter = g", _log);
  Expect.equals("Augmented", Ext.externalVariable);
  Ext.externalVariable = "h";
  Expect.equals("externalVariable = h", _log);
  Expect.equals("Augmented", Ext.externalFinalVariable);

  Expect.equals("Augmented", ET.externalMethod());
  Expect.equals("Augmented", ET.externalGetter);
  ET.externalSetter = "i";
  Expect.equals("externalSetter = i", _log);
  Expect.equals("Augmented", ET.externalVariable);
  ET.externalVariable = "j";
  Expect.equals("externalVariable = j", _log);
  Expect.equals("Augmented", ET.externalFinalVariable);
}
