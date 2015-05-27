/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="sandbox"></div>
    <pre id="console"></pre>
    <div id='a'>
        <div id='b'>
            <div id='c'>
            </div>
        </div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  dumpNode(node) {
    if (node == null)
      return null;
    if (node is Element && node.id != '')
      return '#${node.id}';
    return node.runtimeType;
  }

  dumpNodeList(nodeList)
    => nodeList.map((x) => dumpNode(x)).toList();              

  var b = document.getElementById('b');
  b.addEventListener('click', (event) {
    var path = event.path;
    //debug(dumpNodeList(path));

    var expected = ['#b', '#a', BodyElement, HtmlHtmlElement, HtmlDocument];
    shouldBeList(dumpNodeList(path), expected);

    //debug('Makes sure that event.path returns static NodeList.');
    //path[1] = '';
    //debug(dumpNodeList(event.path));
  });

  var clickEvent = new MouseEvent("click", canBubble: true,
      cancelable: false, view: window, detail: 0,
      screenX: 0, screenY: 0, clientX: 0, clientY: 0,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: null);

  b.dispatchEvent(clickEvent);
}
