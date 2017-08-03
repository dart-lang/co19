/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, String> dataset
 * Allows access to all custom data attributes (data-*) set on this element.
 * Any keys from markup will be converted to camel-cased keys in the map.
 * @description Checks expected attributes values.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new Element.html('<a></a>');
  Expect.mapEquals({}, x.dataset);

  var y = new Element.html('<p id="id" data-foo="0" data-foo-bar="1"></p>',
      treeSanitizer: new NullTreeSanitizer());

  Expect.mapEquals({'foo': '0', 'fooBar': '1'}, y.dataset);
}
