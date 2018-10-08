/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
      .firstDivStyle + .secondDivStyle { display: table-footer-group;  }
      .rubyStyle { position: relative; }
      .secondDivStyle { -webkit-appearance: button; }
      .posAbsolute { position: absolute; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>PASS</div>, if no exception or crash in debug
      <div class="firstDivStyle"></div>
      <div class="secondDivStyle"></div>
      <div id="remove"></div>
      <ruby id="ruby" class="rubyStyle"></ruby>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('ruby').innerHtml = '<audio controls="controls" id="aud" src="blah.ogg" class="posAbsolute"></audio>';
  var height = document.body.clientHeight; // Force layout
  document.getElementById('remove').remove(); // Cause anonymous blocks containing 'secondDivStyle' and 'ruby' to be merged
  document.getElementById('aud').style.color = "blue"; // Force style recalc
  setTimeout(asyncEnd, 10);
  asyncStart();
}
