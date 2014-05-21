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
    <div contenteditable='true' id='div'>
    ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.getElementById('div');
  div.focus();
  document.body.contentEditable = 'true';

  crash(_) {
    var embed = document.createElement('embed');
    embed.setAttribute('type', 'text/foo');
    document.body.append(embed);
    document.body.clone(true);
  }

  removeContent(_) {
    document.body.innerHtml = """Tests that we don't crash due to incorrect load event firing during clone. <br />
      PASS""";
  }

  window.addEventListener('load', removeContent, false);
  document.addEventListener('DOMContentLoaded', crash, false);
}
