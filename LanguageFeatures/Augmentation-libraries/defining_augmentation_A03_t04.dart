// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A top-level declaration in an augmentation has the same name as a
///   declaration in the main library or another of its augmentations (unless it
///   is an augmenting declaration)
///
/// @description Checks that it is a compile-time error if a top-level
/// declaration in an augmentation has the same name as a declaration in another
/// augmentation of the same library. Check the case when an entry point
/// (function `main()` is in augment library)
/// @author sgrekhov22@gmail.com
/// @issue 55113

// SharedOptions=--enable-experiment=macros

library augment 'defining_augmentation_A03_t04_main.dart';

class C {}

mixin M {}

enum E {e;}

void foo() {}

typedef void Foo();

typedef StringAlias = String;

int get getter => 42;

void set setter(int _) {}

extension Ext on List {}

extension type ET(int _) {}

var x = 0;

const c = 0;

main() {
  print(C);
  print(M);
  print(E);
  print(foo);
  print(Foo);
  print(StringAlias);
  print(getter);
  setter = 1;
  print(List);
  print(ET);
  print(x);
  print(c);
}
