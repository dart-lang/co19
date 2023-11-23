// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion DocumentFragment createFragment(String html,
/// {NodeValidator validator, NodeTreeSanitizer treeSanitizer})
/// Create a DocumentFragment from the HTML fragment and ensure that it
/// follows the sanitization rules specified by the validator or treeSanitizer.
/// The returned tree is guaranteed to only contain nodes and attributes which
/// are allowed by the provided validator.
/// @description Checks that this method call creates text only
/// @issue 43331

import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  IFrameElement x = new IFrameElement();
  var f = x.createFragment('<div foo="foo"><bar id="bar"></bar></div>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.isTrue(f.firstChild is CharacterData);

  var bar = f.querySelector('#bar');
  Expect.isNull(bar);
}
