# parse

Parsing happens in the service worker and scales with file size, because the
parser reads the whole file out of GitHub's textarea rather than the rendered
lines.

`small.tf` and `large.tf` differ in length and hold the same three modules, so
file size moves and module count does not. Parsing is cpu bound, so the ratio
between the two is meaningful in a way the network bound axes are not.
