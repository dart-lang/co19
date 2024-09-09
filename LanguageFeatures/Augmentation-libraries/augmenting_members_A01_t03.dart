// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An augmenting declaration uses `augmented` when the augmented
/// declaration has no concrete implementation. Note that all external
/// declarations are assumed to have an implementation provided by another
/// external source, and otherwise they will throw a runtime error when called.
///
/// @description Checks that it is a not an error if an augmenting
/// declaration uses `augmented` when the augmented declaration is an external.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_members_A01_t03_lib.dart';

class C {
  external String externalMethod();
  external String get externalGetter;
  external void set externalSetter(String v);
  external String externalVariable;
  external final String externalFinalVariable;
}

mixin M {
  external String externalMethod();
  external String get externalGetter;
  external void set externalSetter(String v);
  external String externalVariable;
  external final String externalFinalVariable;
}

enum E {
  e0;
  external String externalMethod();
  external String get externalGetter;
  external void set externalSetter(String v);
  external final String externalFinalVariable;
}

class A {}

extension Ext on A {
  external String externalMethod();
  external String get externalGetter;
  external void set externalSetter(String v);
}

extension type ET(String _) {
  external String externalMethod();
  external String get externalGetter;
  external void set externalSetter(String v);
}

class MA = Object with M;

main() {
  Expect.equals("Augmented", C().externalMethod());
  Expect.equals("Augmented", C().externalGetter);
  C().externalSetter = "a";
  Expect.equals("externalSetter = a", _log);
  Expect.equals("Augmented", C().externalVariable);
  C().externalVariable = "b";
  Expect.equals("externalVariable = b", _log);
  Expect.equals("Augmented", C().externalFinalVariable);

  Expect.equals("Augmented", MA().externalMethod());
  Expect.equals("Augmented", MA().externalGetter);
  C().externalSetter = "c";
  Expect.equals("externalSetter = c", _log);
  Expect.equals("Augmented", MA().externalVariable);
  C().externalVariable = "d";
  Expect.equals("externalVariable = d", _log);
  Expect.equals("Augmented", MA().externalFinalVariable);

  Expect.equals("Augmented", E.e0.externalMethod());
  Expect.equals("Augmented", E.e0.externalGetter);
  E.e0.externalSetter = "e";
  Expect.equals("externalSetter = e", _log);
  Expect.equals("Augmented", E.e0.externalFinalVariable);

  Expect.equals("Augmented", A().externalMethod());
  Expect.equals("Augmented", A().externalGetter);
  A().externalSetter = "f";
  Expect.equals("externalSetter = f", _log);

  Expect.equals("Augmented", ET("").externalMethod());
  Expect.equals("Augmented", ET("").externalGetter);
  ET("").externalSetter = "g";
  Expect.equals("externalSetter = g", _log);
}
