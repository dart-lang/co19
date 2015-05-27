/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style type="text/css">@media screen { }</style>
''';

const String htmlEL2 = r'''
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    var rules = document.styleSheets[document.styleSheets.length-1].cssRules;
    var mediaList = rules[0].media;
    
    // - appendMedium()
    
    test(() {
        mediaList.mediaText = "screen";
        mediaList.appendMedium("tv, screen");
        assert_equals(mediaList.mediaText, "screen");
        // CSSOM 4.1: Parsing media query returns none as
        // there are more than one; terminate steps.
    }, "Add 'tv, screen' to 'screen'");
    
    test(() {
        mediaList.mediaText = "screen";
        mediaList.appendMedium("tv");
        assert_equals(mediaList.mediaText, "screen, tv");
        // The valid media query is appended.
    }, "Add 'tv' to 'screen'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        mediaList.appendMedium("tv");
        assert_equals(mediaList.mediaText, "screen, tv");
        // CSSOM says to ignore if it exists, terminate steps.
    }, "Add 'tv' to 'screen, tv'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        mediaList.appendMedium("screen");
        assert_equals(mediaList.mediaText, "screen, tv");
        // CSSOM says to ignore if it exists, where as
        // CSS 2.1 says to remove existing and then add
        // it to the end.
        // http://dev.w3.org/csswg/cssom/#dom-medialist-appendmedium
        // http://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/stylesheets.html
    }, "Add 'screen' to 'screen, tv'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        mediaList.appendMedium(" ");
        // Ignored; terminate steps.
        assert_equals(mediaList.mediaText, "screen, tv");
    }, "Add ' ' to 'screen, tv'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        mediaList.appendMedium("");
        // Ignored; terminate steps.
        assert_equals(mediaList.mediaText, "screen, tv");
    }, "Add '' to 'screen, tv'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        mediaList.appendMedium(",");
        assert_equals(mediaList.mediaText, "screen, tv");
        // CSSOM 4.1: Parsing media query returns none as
        // there are more than one; terminate steps.
    }, "Add ',' to 'screen, tv'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        mediaList.appendMedium("&invalid");
        assert_equals(mediaList.mediaText, "screen, tv, not all");
        // Ignored; terminate steps.
    }, "Add '&invalid' to 'screen, tv'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        mediaList.appendMedium("not all");
        assert_equals(mediaList.mediaText, "screen, tv, not all");
    }, "Add 'not all' to 'screen, tv'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        mediaList.appendMedium("#?:/");
        assert_equals(mediaList.mediaText, "screen, tv, not all");
        // Ignored; terminate steps.
    }, "Add '#?:/' to 'screen, tv'");
    
    // - deleteMedium()
    
    test(() {
        mediaList.mediaText = "screen, tv, not all";
        mediaList.deleteMedium("&invalid");
        // Ignored; terminate steps.
        assert_equals(mediaList.mediaText, "screen, tv");
    }, "Remove '&invalid' from 'screen, tv, not all'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        Expect.throws(
            () { mediaList.deleteMedium("not all"); },
            (e)=>e.toString().contains("NotFoundError")
        );
        // Not found; throw NotFoundError.
    }, "Remove 'not all' from 'screen, tv'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        Expect.throws(
            () { mediaList.deleteMedium("cow"); },
            (e)=>e.toString().contains("NotFoundError")
        );
        // Not found; throw NotFoundError.
    }, "Remove 'cow' from 'screen, tv'");
    
    test(() {
        mediaList.mediaText = "screen, tv, not all";
        mediaList.deleteMedium("not all");
        assert_equals(mediaList.mediaText, "screen, tv");
        // Remove any media query from the collection of media queries
        // for which comparing the media query returns true.
    }, "Remove 'not all' from 'screen, tv, not all'");
    
    test(() {
        mediaList.mediaText = "screen, tv";
        mediaList.deleteMedium("tv");
        assert_equals(mediaList.mediaText, "screen");
        // Remove any media query from the collection of media queries
        // for which comparing the media query returns true.
    }, "Remove 'tv' from 'screen, tv'");
    
    test(() {
        mediaList.mediaText = "not all, not all, tv, not all";
        mediaList.deleteMedium("not all");
        assert_equals(mediaList.mediaText, "tv");
        // Remove any media query from the collection of media queries
        // for which comparing the media query returns true.
    }, "Remove 'not all' from 'not all, not all, tv, not all'");
    
    test(() {
        mediaList.mediaText = "not all, not all, tv, not all";
        mediaList.deleteMedium("tv");
        assert_equals(mediaList.mediaText, "not all, not all, not all");
        // Remove any media query from the collection of media queries
        // for which comparing the media query returns true.
    }, "Remove 'tv' from 'not all, not all, tv, not all'");
    
    test(() {
        mediaList.mediaText = "tv, print, screen";
        mediaList.deleteMedium("tv, print");
        assert_equals(mediaList.mediaText, "tv, print, screen");
        // CSSOM 4.1: Parsing media query returns none as
        // there are more than one; terminate steps.
    }, "Remove 'tv, print' from 'screen, tv, screen'");
    
    test(() {
        mediaList.mediaText = "screen, tv, not all";
        mediaList.deleteMedium("#?:/");
        // Ignored; terminate steps.
        assert_equals(mediaList.mediaText, "screen, tv");
    }, "Remove '#?:/' from 'screen, tv, not all'");
    
    checkTestFailures();
}
