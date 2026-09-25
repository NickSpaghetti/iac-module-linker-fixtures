# scrolling

GitHub renders roughly 210 lines of a file at a time and renders more as you
scroll. The extension re-injects on every scroll pause, so a long file is
where repeated work shows up.

`large.tf` is long enough to need several scroll pauses, with module blocks
spread down it rather than gathered at the top, so new modules come into view
as the benchmark scrolls.

Sources here are local paths and github shorthand. Neither needs a registry
lookup, so the counts stay deterministic and the run stays fast. Serial
registry cost is the `resolution/` axis, not this one.
