/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin declaration syntax separate from class declarations:
 * mixinDeclaration :
 *   metadata? 'mixin' identifier typeParameters? ('on' types)?
 *     ('implements' types)? '{' mixinMember* '}'
 *
 * @description Checks that mixin declaration above is correct.
 * @author sgrekhov@unipro.ru
 */

class S {}
class T {}
class X extends S {}
class Y extends T {}

mixin M<X extends S, Y extends T>  {}

class MA with M<X, Y>  {}

main() {
  new MA();
}
