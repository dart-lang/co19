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
  var index;

  setFavIcon(iconURL) {
    HeadElement docHead = document.getElementsByTagName("head")[0];

    // set up a new node for the new iconURL
    LinkElement newLink = document.createElement("link");
    newLink.type = "image/x-icon";
    newLink.rel = "shortcut icon";
    newLink.href = iconURL;

    //var links = docHead.getElementsByTagName("link"); // no such in dart
    List links = docHead.querySelectorAll("link");
    for (var i = index; i < links.length; ++i) {
      var oldLink = links[i];
      if (oldLink.type=="image/x-icon" && oldLink.rel=="shortcut icon") {
        // if we find the child, replace it with the new node.
        oldLink.replaceWith(newLink);
        return; // Assuming only one match at most.
      }
    }

    // if we didn't find the icon URL link, add it now.
    docHead.append(newLink);
  }

  // test framefork may have some links
  index = (document.getElementsByTagName("head")[0] as HeadElement).
      querySelectorAll("link").length;

  document.head.append(new DocumentFragment.html('''
    <link rel="shortcut icon" type="image/x-icon" href="http://test.com/oldfavicon.ico"/>
    <link rel="shortcut icon" type="image/x-icon" href="http://test.com/foofavicon.ico"/>
    <link rel="shortcut icon" type="image/x-icon" href="http://test.com/barfavicon.ico"/>
    ''', treeSanitizer: new NullTreeSanitizer()));

  asyncStart();
  window.onLoad.first.then((_) {
    var iconURL =
        (document.getElementsByTagName("link")[index] as LinkElement).href;
    debug('Original iconURL is: ' + iconURL);
    shouldBe(iconURL, 'http://test.com/oldfavicon.ico');

    // change icon to new icon
    var newURL = 'http://test.com/newfavicon.ico';
    debug('Setting new icon URL to: ' + newURL);
    setFavIcon(newURL);
    iconURL = (document.getElementsByTagName("link")[index] as LinkElement).href;
    debug('New iconURL is: ' + iconURL);
    shouldBe(iconURL, 'http://test.com/newfavicon.ico');
    asyncEnd();
  });
}
