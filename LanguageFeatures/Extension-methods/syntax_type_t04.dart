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
 * refer to the type parameters of the extension. It can be followed by ? which
 * means that it allows null values. When Dart gets non-nullable types by
 * default (NNBD), this ? syntax is removed and subsumed by nullable types like
 * int? being allowed in the <type> position.
 *
 * @description Check that the type can be any valid Dart type, including a
 * single type variable. Test nullable built-in types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods,non-nullable

extension MyInt on int? {}

extension MyNum on num? {}

extension MyDouble on double? {}

extension MyString on String? {}

extension MyBool on bool? {}

extension MyObject on Object? {}

extension MyFunction on Function? {}

main() {
}
