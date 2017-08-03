/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, String> attributes
 * All attributes on this element.
 * @description Checks expected attributes values.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  IFrameElement x = new Element.html('<iframe></iframe>');
  Expect.mapEquals({}, x.attributes);

  var y = new Element.html('<iframe id="foo" class="bar"></div>');
  Expect.mapEquals({'id': 'foo', 'class': 'bar'}, y.attributes);

  var z = new Element.html('<iframe custom="foobar"></div>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.mapEquals({'custom': 'foobar'}, z.attributes);
}
