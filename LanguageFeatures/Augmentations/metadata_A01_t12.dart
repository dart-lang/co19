// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration. Test constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

library metadata_A01_t12;

import 'dart:mirrors';
import '../../Utils/expect.dart';

class Meta {
  const Meta();
}

class C {
  C() {}
  C._private() {}
  C.redirect() : this();
  factory C.factory1() => C();
  factory C.factory2() = C;
}

augment class C {
  @Meta()
  augment C();
  @Meta()
  augment C._private();
  @Meta()
  augment C.redirect();
  @Meta()
  augment factory C.factory1();
  @Meta()
  augment factory C.factory2();
}

enum E {
  e0;

  const E();
  const E._private();
  const E.redirect() : this();
  factory E.factory1() => E.e0;
}

augment enum E {
  ;
  @Meta()
  augment const E();
  @Meta()
  augment const E._private();
  @Meta()
  augment const E.redirect() : this();
  @Meta()
  augment factory E.factory1();
}

extension type ET._(int id) {
  ET(this.id) {}
  ET._private(this.id) {}
  ET.redirect() : this(0);
  factory ET.factory1() => ET(0);
  factory ET.factory2(int id) = ET;
}

augment extension type ET {
  @Meta()
  augment ET(this.id);
  @Meta()
  augment ET._private(this.id);
  @Meta()
  augment ET.redirect();
  @Meta()
  augment factory ET.factory1();
  @Meta()
  augment factory ET.factory2(int id);
}

main() {
  testType(C);
  testType(E);
  // Extension types cannot be reflected therefore it is not possible to check
  // their metadata.
}

void testType(Type t) {
  Symbol libName = MirrorSystem.getSymbol('metadata_A01_t12');
  LibraryMirror libraryMirror = currentMirrorSystem().findLibrary(libName);
  ClassMirror classMirror = reflectClass(t);
  var names = [
    '$t',
    '$t._private',
    '$t.redirect',
    '$t.factory1',
    if ('$t' != '$E') '$t.factory2',
  ];
  for (var name in names) {
    var symbol = MirrorSystem.getSymbol(name, libraryMirror);
    var m = classMirror.declarations[symbol];
    Expect.equals(
      'metadata_A01_t12.Meta',
      MirrorSystem.getName(m!.metadata[0].type.qualifiedName),
    );
  }
}
