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
 * single type variable. Test built-in types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "dart:async";

extension MyInt on int {}

extension MyNum on num {}

extension MyDouble on double {}

extension MyNull on Null {}

extension MyString on String {}

extension MyVoid on void {}

extension MyDynamic on dynamic {}

extension MyBool on bool {}

extension MyObject on Object {}

extension MyFunction on Function {}

extension MyFuture<T> on Future<T> {}

extension MyFutureOr<T> on FutureOr<T> {}

extension MyIterable<T> on Iterable<T> {}

main() {
}
