// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We propose the following to also be allowed:
///
/// enum Name<T> with Mixin1, Mixin2 implements Interface1, Interface2 {
///   id1<int>(args1), id2<String>(args2), id3<bool>(args3);
///   memberDeclaration*
///   const Name(params) : initList;
/// }
/// where memberDeclaration* is any sequence of static and instance member
/// declarations and/or an unnamed generative const constructor declaration.
///
/// The ; after the identifier list is optional if there is nothing else in the
/// declaration, required if there is any member declaration after it. The
/// identifier list may have a trailing comma (like now).
///
/// @description Check that if there is a ; after the identifier list and there
/// is no any class member then it is not an error
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum Time1<T> {
  hour<int>(),
  day<String>(),
  week<bool>();
}

enum Time2<T> {
  hour<int>(),
  day<String>(),
  week<bool>(),;
}

main() {
  Time1.week;
  Time2.week;
}
