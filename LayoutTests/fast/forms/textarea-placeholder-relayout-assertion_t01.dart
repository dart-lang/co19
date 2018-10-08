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
  document.body.setInnerHtml('''
<p>PASS if not crashed.</p>
><fieldset><fieldset><button><fieldset><fieldset><select>A00000AA0A000<textarea></textarea>
<figure><fieldset>000000AA00A000A0A0A00A0000A0A00AAAAAA00AAAAAAA0A0AA00A00A000A0AA000AA0<textarea id="test" placeholder="default disabled">A0AA000AAA0AA00AAAA0<track><center></center>
      ''', treeSanitizer: new NullTreeSanitizer());

  removeTextArea(_) {
    var child = document.getElementById('test');
    child.remove();
    setTimeout(asyncEnd, 0);
  }

  asyncStart();
  window.onLoad.listen(removeTextArea);
}
