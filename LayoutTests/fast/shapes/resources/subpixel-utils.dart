library SubPixelLayout;
import "dart:html";

var enabled = null;

bool isEnabled() {
    if (enabled == null) {
        var elem = document.createElement('div');
        elem.style.setProperty('width', '4.5px');
        document.body.append(elem);
        var bounds = elem.getBoundingClientRect();
        enabled = (bounds.width != bounds.width.floor());
        elem.remove();
    }
    return enabled;
}

int snapToLayoutUnit(f) {
    return isEnabled() ? (f * 64).floor() ~/ 64 : f.floor(); // as in LayoutUnit(f).toFloat()
}

int ceilToLayoutUnit(f) {
    return isEnabled() ? (f * 64).ceil() ~/ 64 : f.ceil(); // see ceiledLayoutUnit(), LayoutUnit.h
}

double resolution() {
    return isEnabled() ? 1/64 : 1;
}

