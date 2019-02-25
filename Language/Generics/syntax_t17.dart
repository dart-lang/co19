/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration, type alias, or function [G] may be generic,
 * that is, [G] may have formal type parameters declared.
 * @description Checks that metadata can be attached to type parameter.
 * @author ilya
 */

const constant = 0;

class Foo {
  const Foo.bar(x);
}

class C <@Foo.bar(0) @constant T, @Foo.bar(1) TT extends List<T>> {}

main() {
  new C();
}
