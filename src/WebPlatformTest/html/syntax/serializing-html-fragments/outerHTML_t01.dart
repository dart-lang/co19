/**
 * after web-platform-tests/html/syntax/serializing-html-fragments/outerHtml.html
 * @assertion
 * <link rel="help" href="http://www.w3.org/TR/2012/CR-html5-20121217/syntax.html#html-fragment-serialization-algorithm">
 * <link rel="help" href="https://dvcs.w3.org/hg/innerhtml/raw-file/tip/index.html#widl-Element-outerHtml">
 * @description HTML Test: element.outerHtml to verify HTML fragment serialization algorithm
 */
import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
      var element = [
        "a",
        "abbr",
        "address",
        "article",
        "aside",
        "audio",
        "b",
        "bdi",
        "bdo",
        "blockquote",
        "body",
        "button",
        "canvas",
        "caption",
        "cite",
        "code",
        "colgroup",
        "command",
        "datalist",
        "dd",
        "del",
        "details",
        "dfn",
        "dialog",
        "div",
        "dl",
        "dt",
        "em",
        "fieldset",
        "figcaption",
        "figure",
        "footer",
        "form",
        "h1",
        "h2",
        "h3",
        "h4",
        "h5",
        "h6",
        "head",
        "header",
        "hgroup",
        "html",
        "i",
        "iframe",
        "ins",
        "kbd",
        "label",
        "legend",
        "li",
        "map",
        "mark",
        "menu",
        "meter",
        "nav",
        "noscript",
        "object",
        "ol",
        "optgroup",
        "option",
        "output",
        "p",
        "pre",
        "progress",
        "q",
        "rp",
        "rt",
        "ruby",
        "s",
        "samp",
        "script",
        "section",
        "select",
        "small",
        "span",
        "strong",
        "style",
        "sub",
        "summary",
        "sup",
        "table",
        "tbody",
        "td",
        "textarea",
        "tfoot",
        "th",
        "thead",
        "time",
        "title",
        "tr",
        "u",
        "ul",
        "var",
        "video",
        "data",
        //"acronym",
        //"applet",
        //"basefont",
        //"bgsound",
        //"big",
        //"blink",
        //"center",
        //"dir",
        //"font",
        //"frame",
        //"frameset",
        //"isindex",
        //"listing",
        //"marquee",
        //"multicol",
        //"nextid",
        //"nobr",
        //"noembed",
        //"noframes",
        //"plaintext",
        //"rb",
        //"spacer",
        //"strike",
        //"tt",
        //"xmp",
      ];

      var noEndTag = [
        "area",
        "base",
        "br",
        "col",
        "embed",
        "hr",
        "img",
        "input",
        "keygen",
        "link",
        "meta",
        "param",
        "source",
        "track",
        "wbr",
      ];
      
      for (var ele in element) {
          test(() {
            var e = document.createElement(ele);
            assert_equals(e.outerHtml, "<" + ele + "></" + ele + ">", ele + " node created." );
          }, "Node for " + ele);
      }
      
      for (var ele in noEndTag) {
          test(() {
            var e = document.createElement(ele);
            assert_equals(e.outerHtml, "<" + ele + ">", ele + " node created." );
          }, "Node for " + ele);
      }

    checkTestFailures();
}
