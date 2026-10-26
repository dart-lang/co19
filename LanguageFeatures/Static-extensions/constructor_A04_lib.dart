// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a constructor declaration in an extension which declares a
/// named constructor with name `Name`, it is an error if `Name` is either the
/// name of the extension, or the on-declaration of the extension
///
/// @description Library containing declarations used by the tests that use a
/// prefixed import in the `on` clause of an extension.
/// @author sgrekhov22@gmail.com

class C {
  C.someName();
}

typedef CAlias = C;

mixin M {}

typedef MAlias = M;

class MO = Object with M;

mixin class MC {
  MC.someName();
}

typedef MCAlias = MC;

enum E {
  e0;
}

typedef EAlias = E;

extension type ET.someName(int _) {}

typedef ETAlias = ET;

class G<T> {
  G.someName();
}

typedef GAlias<T> = G<T>;

class CC {
  const CC.someName();
}

typedef CCAlias = CC;
