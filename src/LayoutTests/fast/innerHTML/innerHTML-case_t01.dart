/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks to see if innerHTML is outputting in the proper case, i.e. all tags and methods lower-case.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('<div id="test" style="display:none"></div>',
      treeSanitizer: new NullTreeSanitizer());

  var html = "<BR /><br /><HR /><hr /><Br><dIv sTyLe=\"color:bluE;\"></dIv>";
  var expected ='<br><br><hr><hr><br><div style="color:bluE;"></div>';

  var e = document.getElementById("test");
  e.setInnerHtml(html,
      treeSanitizer: new NullTreeSanitizer());

  Expect.equals(expected, e.innerHtml);
}
