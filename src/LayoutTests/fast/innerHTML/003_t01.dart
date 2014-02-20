/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;
  var text2 = 'this text should show up twice';
  var text1 = 'this text should show up once';

  body.setInnerHtml('''
<div id="x">$text2</div>
<div id="y"></div>
<div>$text1</div>
''', treeSanitizer: new NullTreeSanitizer());
  
  document.getElementById("y").innerHtml = document.getElementById("x").outerHtml;
  
  Expect.equals(2, text2.allMatches(body.outerHtml).length);
  Expect.equals(1, text1.allMatches(body.outerHtml).length);
}

