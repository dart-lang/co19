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
 * An extension declaration with a non-private name is included in the library's
 * export scope, and a privately named extension is not. It is a compile-time
 * error to export two declarations, including extensions, with the same name,
 * whether they come from declarations in the library itself or from export
 * declarations (with the usual exception when all but one declaration come from
 * platform libraries). Extension members with private names are simply
 * inaccessible in other libraries.
 *
 * @description Check that it is not a compile-time error to export two
 * declarations, including extensions, with the same name, if one of them
 * (library one) is hidden by other (declared in the current scope)
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
library syntax_scope_lib;
import "my_fancy_list_lib.dart";
export "my_fancy_list_lib.dart";

extension MyFancyList<T> on List<T> {
  int get doubleLength => this.length * 4;
  String get whoAmI => "I'm an extension that hides another one";
}

