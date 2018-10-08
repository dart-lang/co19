/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check if changing flexbox's content doesn't change the state of
 * scroll. See this bug for detail:
 * https://bugs.webkit.org/show_bug.cgi?id=15135
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <div style="display: -webkit-box;-webkit-box-orient: vertical; height: 69px;">
          <div id="vertical" style="overflow-y: scroll; outline: none; width: 80px; -webkit-box-flex:1;">
              <br><br><br><br><br><br><br><br><br>Lorem ipsum
          </div>
      </div>
      <div style="display: -webkit-box;-webkit-box-orient: horizontal; width: 69px;">
          <pre id="horizontal" style="overflow-x: scroll; outline: none; height: 80px; -webkit-box-flex:1;">
      fooooooooooooooo Lorem ipsum
          </pre>
      </div>
      <div style="display: -webkit-box;-webkit-box-orient: vertical; height: 69px;">
      <div style="display: -webkit-box; height: 69px; width: 80px;">
          <div id="nest" style="overflow-y: scroll; outline: none; width: 80px; -webkit-box-flex:1;">
              <br><br><br><br><br><br><br><br><br>Lorem ipsum
          </div>
      </div>
      </div>
      <div style="display: -webkit-box;-webkit-box-orient: vertical; height: 69px;">
      <div style="height: 69px; width: 80px;">
          <div id="nest2" style="overflow-y: scroll; outline: none; width: 80px; height: 69px; -webkit-box-flex:1;">
              <br><br><br><br><br><br><br><br><br>Lorem ipsum
          </div>
      </div>
      </div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var element = null;

  element = document.getElementById("vertical");
  element.scrollTop = 108;
  element.lastChild.data='meroL ipsum';
  shouldBe(element.scrollTop, 108);

  element = document.getElementById("horizontal");
  element.scrollLeft = 108;
  element.lastChild.data='fooooooooooooooo meroL ipsum';
  shouldBe(element.scrollLeft, 108);

  element = document.getElementById("nest");
  element.scrollTop = 108;
  element.lastChild.data='meroL ipsum';
  shouldBe(element.scrollTop, 108);

  element = document.getElementById("nest2");
  element.scrollTop = 108;
  element.lastChild.data='meroL ipsum';
  shouldBe(element.scrollTop, 108);
}
