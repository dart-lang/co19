/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The support of click() method on HTMLElement.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var success;
  clickHandler(event) {
    success = true;
  }

  runTests(tagName) {
    success = false;
    var element = document.createElement(tagName);
    element.addEventListener('click', clickHandler, false);

    element.click();
    debug('Testing click on $tagName');
    shouldBeTrue(success);
  }

  var tagNames = ["a","abbr","acronym","address","applet","area","article","aside","audio","b","base","basefont","bdo","bgsound","big","blockquote",
      "body","br","button","canvas","caption","center","cite","code","col","colgroup","command","datalist","dd","del","details","dfn","dir","div","dl","dt",
      "em","embed","fieldset","figcaption","figure","font","footer","form","frame","frameset","h1","h2","h3","h4","h5","h6","head","header","hgroup","hr","html",
      "i","iframe","img","input","ins","isindex","kbd","keygen","label","layer","legend","li","link","listing","main","map","mark","marquee","menu","meta","meter","nav",
      "nobr","noembed","noframes","nolayer","noscript","object","ol","optgroup","option","output","p","param","plaintext","pre","progress","q","rp","rt","ruby","s",
      "samp","script","section","select","small","source","span","strike","strong","style","sub","summary","sup","table","tbody","td","textarea","tfoot","th","thead",
      "title","tr","track","tt","u","ul","var","video","wbr","xmp"];

  for (var i=0 ; i < tagNames.length; i++)
    runTests(tagNames[i]);
}
