   Extensions to `info.el'.

 Faces defined here:

   `info-command-ref-item', `info-constant-ref-item', `info-file',
   `info-function-ref-item',`info-macro-ref-item', `info-menu',
   `info-node', `info-quoted-name', `info-reference-item',
   `info-single-quote', `info-special-form-ref-item',
   `info-string', `info-syntax-class-item',
   `info-user-option-ref-item', `info-variable-ref-item',
   `info-xref', `minibuffer-prompt'.

 Options (user variables) defined here:

   `Info-breadcrumbs-in-header-flag' (Emacs 23+),
   `Info-display-node-header-fn', `Info-fit-frame-flag',
   `Info-fontify-angle-bracketed-flag',
   `Info-fontify-quotations-flag',
   `Info-fontify-reference-items-flag',
   `Info-fontify-single-quote-flag', `Info-saved-nodes',
   `Info-subtree-separator'.

 Commands defined here:

   `Info-breadcrumbs-in-mode-line-mode' (Emacs 23+),
   `info-emacs-manual', `Info-follow-nearest-node-new-window',
   `Info-history-clear', `Info-merge-subnodes',
   `Info-mouse-follow-nearest-node-new-window',
   `Info-save-current-node', `Info-set-breadcrumbs-depth' (Emacs
   23+), `Info-toggle-fontify-angle-bracketed',
   `Info-toggle-fontify-quotations',
   `Info-toggle-fontify-single-quote',
   `Info-toggle-breadcrumbs-in-header-line' (Emacs 23+),
   `Info-virtual-book', `menu-bar-read-lispref',
   `menu-bar-read-lispintro',

 Macros defined here:

   `info-user-error'.

 Non-interactive functions defined here:

   `Info-display-node-default-header', `info-fontify-quotations',
   `info-fontify-reference-items',
   `Info-insert-breadcrumbs-in-mode-line' (Emacs 23+),
   `Info-isearch-search-p' (Emacs 23+), `info-quotation-regexp',
   `Info-search-beg' (Emacs 23+), `Info-search-end' (Emacs 23+).

 Internal variables defined here:

   `Info-breadcrumbs-depth-internal' (Emacs 23+),
   `Info-merged-map', `Info-mode-syntax-table',
   `info-quoted+<>-regexp'.


 ***** NOTE: The following standard faces defined in `info.el'
             (Emacs 21+) have been REDEFINED HERE:

 `info-title-1', `info-title-2', `info-title-3', `info-title-4'.


 ***** NOTE: The following standard functions defined in `info.el'
             have been REDEFINED or ADVISED HERE:

 `info-display-manual' - Use completion to input manual name.
 `Info-find-emacs-command-nodes' - Added arg MSGP and message.
 `Info-find-file' (Emacs 23+) - Handle virtual books.
 `Info-find-node', `Info-find-node-2' -
    Call `fit-frame' if `Info-fit-frame-flag'.
    Added optional arg NOMSG.
 `Info-fontify-node' -
    1. Show breadcrumbs in header line and/or mode line.
    2. File name in face `info-file'.
    3. Node names in face `info-node'.
    4. Menu items in face `info-menu'.
    5. Only 5th and 9th menu items have their `*' colored.
    6. Notes in face `info-xref'.
    7. If `Info-fontify-quotations-flag', then fontify `...' in
       face `info-quoted-name' and "..." in face `info-string'.
    8. If `Info-fontify-angle-bracketed-flag' and
       `Info-fontify-quotations-flag' then fontify <...> in face
       `info-quoted-name'.
    9. If `Info-fontify-single-quote-flag' and
       `Info-fontify-quotations-flag', then fontify ' in face
       `info-single-quote'.
 `Info-goto-emacs-command-node' -
    1. Uses `completing-read' in interactive spec, with,
       as default, `symbol-nearest-point'.
    2. Added optional arg MSGP.
    3. Message if single node found.
    4. Returns `num-matches' if found; nil if not.
 `Info-goto-emacs-key-command-node' -
    1. Added optional arg MSGP.
    2. If key's command not found, then `Info-search's for key
       sequence in text and displays message about repeating.
 `Info-history' - A prefix arg clears the history.
 `Info-insert-dir' -
    Added optional arg NOMSG to inhibit showing progress msgs.
 `Info-mode' - Doc string shows all bindings.
 `Info-read-node-name-1' - Treat file name entries, e.g. "(emacs)".
 `Info-search' - 1. Fits frame.
                 2. Highlights found regexp if `search-highlight'.
 `Info-set-mode-line' - Handles breadcrumbs in the mode line.
 `Info-mouse-follow-nearest-node' (Emacs 21+) -
    With prefix arg, show node in new info buffer.
 `Info-isearch-search' - Respect restriction to active region.
 `Info-isearch-wrap' - Respect restriction to active region.


 ***** NOTE: The following behavior defined in `info.el'
             has been changed.

 "*info" has been removed from `same-window-buffer-names', so that
 a separate window can be used if the user so chooses.


 Suggestion: Use a medium-dark background for Info.  Try, for
 example, setting the background to "LightSteelBlue" in your
 `~/.emacs' file.  You can do this as follows:

        (setq special-display-buffer-names
              (cons '("*info*" (background-color . "LightSteelBlue"))
                    special-display-buffer-names))

 Alternatively, you can change the background value of
 `special-display-frame-alist' and set `special-display-regexps' to
 something matching "*info*":

        (setq special-display-frame-alist
              (cons '(background-color . "LightSteelBlue")
                    special-display-frame-alist))
        (setq special-display-regexps '("[ ]?[*][^*]+[*]"))

 If you do use a medium-dark background for Info, consider
 customizing face to a lighter foreground color - I use "Yellow".

 Also, consider customizing face `link' to remove its underline
 attribute.


 The following bindings are made here for Info-mode:

   `?'              `describe-mode' (replaces `Info-summary')
   `+'              `Info-merge-subnodes'
   `.'              `Info-save-current-node'
   `a'              `info-apropos'
   `v'              `Info-virtual-book'
   `mouse-4'        `Info-history-back'
   `mouse-5'        `Info-history-forward'
   `S-down-mouse-2' `Info-mouse-follow-nearest-node-new-window'
   `S-RET'          `Info-follow-nearest-node-new-window'

 The following bindings are made here for merged Info buffers:

   `.'              `beginning-of-buffer'
   `b'              `beginning-of-buffer'
   `q'              `quit-window'
   `s'              `nonincremental-re-search-forward'
   `M-s'            `nonincremental-re-search-forward'
   `TAB'            `Info-next-reference'
   `ESC TAB'        `Info-prev-reference'



 This file should be loaded after loading the standard GNU file
 `info.el'.  So, in your `~/.emacs' file, do this:
 (eval-after-load "info" '(require 'info+))


 Acknowledgement:

   Lennart Borgman and Stefan Monnier for regexp suggestions.
