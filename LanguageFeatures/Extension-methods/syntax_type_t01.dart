/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion an extension declaration is a top-level declaration with a grammar
 * similar to:
 * <extension> ::=
 *   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
 *     memberDeclaration*
 *   `}'
 * ...
 * The type can be any valid Dart type, including a single type variable. It can
 * refer to the type parameters of the extension.
 *
 * @description Check that the type can be any valid Dart type, including a
 * single type variable
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
class C<T> {}

extension MyC<T> on C<T> {}

extension MyT<T extends C> on T {}

extension MyC2<X extends C, Y> on C<Y> {}

main() {
}
