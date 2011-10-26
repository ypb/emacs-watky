# What

Fresh look on old code
[breadcrumbs](http://www.emacswiki.org/emacs/BreadcrumbForEmacs)
of a very simple idea.

# TODO

* Clean up and reorganize code.
* Invent better name? "Watky" is a bastardization of "wątki", which means
'threads' in Polish. And if one zqueents hard enough can be read as 'patches'
(I <3 it!). But internally I'm going for less "wacky" `threadmachiny'
with tm- or tmy- prefix, then; or has Emacs finally invented saner ways of
name space isolation?
* Minimize number of required key-bindings further (from 8 down to 4 or less):
    * C-c s (tm-set, tm-set-drag, tm-set-drag-delete)
    * C-c a (tm-goto-current, tm-previous-current, tm-previous-set-current)
    * C-c e (tm-turn-around, tm-branch, tm-cycle?, ...)
    * C-c 0 (tm-context-list)
* Ultimately permit a sort of treeish point of view on sets of breadcrumbs
covered paths of exploration with:
    * 0th look of all roots (think "main" files in different source code
    repositories) on the one hand;
    * middle look (currently implemented UI) showing bookmarks following each
    other as one drilled down into the chains of function calls e.g.,
    with possible "forks" along the way, showing in the:
    * "Nth" look (infinitely away, turned back towards roots) of current "HEADS"...

Codey diagram, because markdown is brain-dead:
```pre
    ?<-0->1->2->N
       0 ALL roots
          1 given branch (current implementation of one persistent branch)
             2 possibley forksing
                N ALL HEADS (of currents)
    ? archived breadcrumbs?
```
I'm probably not making myself clear and nobody is reading this, anyway.

# WHO?

see [TODO](emacs-watky/TODO.md) for details...

# YO!
