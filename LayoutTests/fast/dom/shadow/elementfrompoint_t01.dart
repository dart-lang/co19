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
    <div id="host"></div>
    <div id="blockHost"></div>
    <span id="inlineBlockHost" style="display:inline-block;"></span>
    <input type="submit" id="submit">
    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  createBox() {
    var div = document.createElement('div');
    div.style.width = '100px';
    div.style.height = '10px';
    return div;
  }

  centerX(element) {
    return (element.offsetLeft + element.offsetWidth / 2).round();
  }

  centerY(element) {
    return (element.offsetTop + element.offsetHeight / 2).round();
  }

  var host = document.getElementById('host');
  var shadowRoot = host.createShadowRoot();
  var box11 = createBox();
  var box12 = createBox();
  var box13 = createBox();
  shadowRoot.append(box11);
  shadowRoot.append(box12);
  shadowRoot.append(box13);

  var nestedHost = document.createElement('div');
  var nestedShadowRoot = nestedHost.createShadowRoot();
  var box21 = createBox();
  var box22 = createBox();
  var box23 = createBox();
  nestedShadowRoot.append(box21);
  nestedShadowRoot.append(box22);
  nestedShadowRoot.append(box23);

  shadowRoot.append(nestedHost);

  var x12 = centerX(box12);
  var y12 = centerY(box12);
  var x22 = centerX(box22);
  var y22 = centerY(box22);

  shouldBe(shadowRoot.elementFromPoint(x12, y12), box12);
  shouldBe(nestedShadowRoot.elementFromPoint(x22, y22), box22);
  shouldBe(shadowRoot.elementFromPoint(x22, y22), nestedHost);
  shouldBe(document.elementFromPoint(x22, y22), host);

  var blockHost = document.getElementById('blockHost');
  var root3 = blockHost.createShadowRoot();
  root3.append(new Text('text1'));
  var inlineBlockHost = document.getElementById('inlineBlockHost');
  var root4 = inlineBlockHost.createShadowRoot();
  root4.append(new Text('text2'));
  shouldBeNull(root3.elementFromPoint(centerX(blockHost),
        centerY(blockHost)));
  shouldBe(document.elementFromPoint(centerX(blockHost),
        centerY(blockHost)), blockHost);
  shouldBeNull(root4.elementFromPoint(centerX(inlineBlockHost),
        centerY(inlineBlockHost)));
  shouldBe(document.elementFromPoint(centerX(inlineBlockHost),
        centerY(inlineBlockHost)), inlineBlockHost);
  var submit = document.getElementById('submit');
  shouldBe(document.elementFromPoint(centerX(submit), centerY(submit)),
      submit);
}
