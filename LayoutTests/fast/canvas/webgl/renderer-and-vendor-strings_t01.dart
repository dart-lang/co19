/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verifies the contents of the RENDERER and VENDOR strings to
 * avoid regressions.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gl = create3DContext();

  // Consensus in the WebGL working group has been to mask the
  // underlying hardware's RENDERER and VENDOR strings, which leak a
  // certain amount of personally identifiable information. This test is
  // intended only to catch accidental regressions, not to enforce the
  // specific strings.

  shouldBe(gl.getParameter(wgl.WebGL.RENDERER), 'WebKit WebGL');
  shouldBe(gl.getParameter(wgl.WebGL.VENDOR), 'WebKit');
}
