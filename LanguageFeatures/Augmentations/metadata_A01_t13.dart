// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration (does not replace it). Test constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

library metadata_A01_t13;

import 'dart:mirrors';
import '../../Utils/expect.dart';

class Meta1 {
  const Meta1();
}

class Meta2 {
  const Meta2();
}

class C {
  @Meta1()
  C() {}
  @Meta1()
  C._private() {}
  @Meta1()
  C.redirect() : this();
  @Meta1()
  factory C.factory1() => C();
  @Meta1()
  factory C.factory2() = C;
}

augment class C {
  @Meta2()
  augment C();
  @Meta2()
  augment C._private();
  @Meta2()
  augment C.redirect();
  @Meta2()
  augment factory C.factory1();
  @Meta2()
  augment factory C.factory2();
}

enum E {
  e0;

  @Meta1()
  const E();
  @Meta1()
  const E._private();
  @Meta1()
  const E.redirect() : this();
  @Meta1()
  factory E.factory1() => E.e0;
}

augment enum E {
  ;
  @Meta2()
  augment const E();
  @Meta2()
  augment const E._private();
  @Meta2()
  augment const E.redirect() : this();
  @Meta2()
  augment factory E.factory1();
}

extension type ET._(int id) {
  @Meta1()
  ET(this.id) {}
  @Meta1()
  ET._private(this.id) {}
  @Meta1()
  ET.redirect() : this(0);
  @Meta1()
  factory ET.factory1() => ET(0);
  @Meta1()
  factory ET.factory2(int id) = ET;
}

augment extension type ET {
  @Meta2()
  augment ET(this.id);
  @Meta2()
  augment ET._private(this.id);
  @Meta2()
  augment ET.redirect();
  @Meta2()
  augment factory ET.factory1();
  @Meta2()
  augment factory ET.factory2(int id);
}

main() {
  testType(C);
  testType(E);
  // Extension types cannot be reflected therefore it is not possible to check
  // their metadata.
}

void testType(Type t) {
  LibraryMirror libraryMirror = currentMirrorSystem().findLibrary(
      #metadata_A01_t13
  );
  ClassMirror classMirror = reflectClass(t);
  var names = [
    '$t',
    '$t._private',
    '$t.redirect',
    '$t.factory1',
    //if ('$t' != '$E') '$t.factory2',
  ];
  for (var name in names) {
    var symbol = MirrorSystem.getSymbol(name, libraryMirror);
    var m = classMirror.declarations[symbol]!;
    Expect.equals(
      'metadata_A01_t13.Meta1',
      MirrorSystem.getName(m.metadata[0].type.qualifiedName),
    );
    Expect.equals(
      'metadata_A01_t13.Meta2',
      MirrorSystem.getName(m.metadata[1].type.qualifiedName),
    );
  }
}
