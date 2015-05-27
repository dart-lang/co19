/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description getDistributedNodes() should work out of Document
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container"></div>
    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host = document.createElement('div');
  var shadowRoot = host.createShadowRoot();
  var child = document.createElement('div');
  var rootChild = document.createElement('div');
  var content = document.createElement('content');

  host.append(child);
  rootChild.append(content);
  shadowRoot.append(rootChild);

  debug('getDistributedNodes() should work out of Document');
  shouldBeList(content.getDistributedNodes(), [child]);

  debug('When a content element is disconnected from ShadowRoot, it should not work.');
  rootChild.remove();
  shouldBeList(content.getDistributedNodes(), []);

  debug('Reprojection case');
  shadowRoot.append(rootChild);
  var shadowRoot2 = rootChild.createShadowRoot();
  var content2 = document.createElement('content');
  var rootChildChild = document.createElement('div');
  shadowRoot2.append(content2);
  rootChild.append(rootChildChild);

  shouldBeList(content.getDistributedNodes(), [child]);
  shouldBeList(content2.getDistributedNodes(), [child, rootChildChild]);

  debug('rootChild is disconnected. Now content became inactive, so content element itself should be distributed.');
  rootChild.remove();
  shouldBeList(content.getDistributedNodes(), []);
  shouldBeList(content2.getDistributedNodes(), [content, rootChildChild]);
}
