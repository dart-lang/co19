/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests the computed value of unicode-bidi property.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="container"></div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var container = document.getElementById('container');

  styleOf(name, attributes) {
    var element = document.createElement('div');
    for (var name in attributes.keys) {
      var value = attributes[name];
      element.setAttribute(name, value);
    }
    container.append(element);
    return getComputedStyle(element);
  }

  var tests = [
    ['span', {}, 'normal'],
    ['span', {'style': 'unicode-bidi: embed;'}, 'embed'],
    ['span', {'style': 'unicode-bidi: isolate;'}, 'isolate'],
    ['span', {'style': 'unicode-bidi: bidi-override;'}, 'bidi-override'],
    ['span', {'style': 'unicode-bidi: plaintext;'}, 'plaintext'],
    ['span', {'style': 'unicode-bidi: bad-value;'}, 'normal'],
    ['span', {'style': 'unicode-bidi: embed embed;'}, 'normal'],
    ['span', {'style': 'unicode-bidi: embed -webkit-plain-text;'}, 'normal'],
    ['span', {'style': 'unicode-bidi: bidi-override isolate;'}, 'normal'],
    ['span', {'style': 'unicode-bidi: isolate bidi-override;'}, 'normal'],
    ['span', {'style': 'unicode-bidi: isolate-override;'}, 'isolate-override'],
    ['span', {'style': 'unicode-bidi: bidi-override isolate bidi-override;'}, 'normal'],
    ['span', {'style': 'unicode-bidi: bidi-override isolate isolate;'}, 'normal'],
    ['span', {'style': 'unicode-bidi: bidi-override bad-value;'}, 'normal'],
    ['span', {'style': 'unicode-bidi: bidi-override embed;'}, 'normal'],
    ].forEach((test) {
      shouldBe(styleOf(test[0], test[1]).unicodeBidi, test[2]);
    });
}
