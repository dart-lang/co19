/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description getMatchedCssRules returns CSSStyleRules with correct parent
 * stylesheet.
 */
import "dart:html";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var links = new DocumentFragment.html('''
    <link media="all and (min-device-width: 20px)" rel="stylesheet" href="$root/resources/matched-rules-import-stylesheet.css"/>
    <link media="all and (min-device-width: 120px)" rel="stylesheet" href="$root/resources/matched-rules-import-stylesheet.css"/>
    <link media="all and (min-device-width: 220px)" rel="stylesheet" href="$root/resources/matched-rules-import-stylesheet.css"/>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(links);

  var style = new Element.html('''
    <style>
        .test-element {
            color: red;
        }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <p>Test getMatchedCssRules to correctly setup CSSStyleRule parent stylesheet.</p>
    <span class="test-element">This span should have border and be written in red.</span>
    ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    var cssStyleRules = window.getMatchedCssRules(
        document.querySelector(".test-element"), '');
    var styleSheetsMedias = [];
    for (var i = 0; i < cssStyleRules.length; ++i) {
      styleSheetsMedias.add("parentStyleSheet media: '" + cssStyleRules[i].parentStyleSheet.media.mediaText + "'");
    }

    styleSheetsMedias.sort();

    shouldBe(styleSheetsMedias[0],
      "parentStyleSheet media: ''");
    shouldBe(styleSheetsMedias[1],
      "parentStyleSheet media: '(min-device-width: 120px)'");
    shouldBe(styleSheetsMedias[2],
      "parentStyleSheet media: '(min-device-width: 20px)'");
    shouldBe(styleSheetsMedias[3],
      "parentStyleSheet media: '(min-device-width: 220px)'");

    var span = document.body.querySelector('span');
    shouldBe(span.getComputedStyle().getPropertyValue('border'),
        '2px solid rgb(0, 0, 0)');
    shouldBe(span.getComputedStyle().getPropertyValue('color'),
        'rgb(255, 0, 0)');

    asyncEnd();
  });
}
