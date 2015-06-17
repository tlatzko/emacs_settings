;; orgmode


(require 'org)
;(require 'org-latex)
;(require 'ox-latex)

(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)
(setq org-clock-continuously t)
; http://orgmode.org/guide/Activation.html#Activation
; (setq my-org-confirm-babel-evaluate nil)  ; don't ask for python
(setq org-confirm-babel-evaluate nil)


; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))


; And add babel inline code execution
; babel, for executing code in org-mode.
(org-babel-do-load-languages
 'org-babel-load-languages
 ; load all language marked with (lang . t).
 '((C . t)
   (R)
   (asymptote)
   (awk)
   (calc)
   (clojure)
   (comint)
   (css)
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (fortran . t)
   (gnuplot)
   (haskell)
   (io)
   (java)
   (js)
   (latex)
   (ledger)
   (lilypond)
   (lisp . t)
   (matlab)
   (maxima)
   (mscgen)
   (ocaml . t)
   (octave)
   (org . t)
   (perl)
   (picolisp)
   (plantuml)
   (python . t)
   (ref)
   (ruby)
   (sass)
   (scala)
   (scheme)
   (screen)
   (sh . t)
   (shen)
   (sql)
   (sqlite)))

(setq org-export-babel-evaluate nil) ; do not evaluate on export
(setq org-src-window-setup 'current-window)
;; code for syntax highlighting
(setq org-latex-listings 'minted)
(setq org-latex-minted-options
           '(("frame" "lines")
             ("fontsize" "\\scriptsize")
             ("linenos" "")))



(setq org-babel-python-command "ipython --no-banner --classic --no-confirm-exit")
(require 'reftex-cite)
(defun org-mode-reftex-setup ()
  (interactive)
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
        ; Reftex should use the org file as master file. See C-h v TeX-master for infos.
        (setq TeX-master t)
        (turn-on-reftex)
        ; enable auto-revert-mode to update reftex when bibtex file changes on disk
        (global-auto-revert-mode t) ; careful: this can kill the undo
                                    ; history when you change the file
                                    ; on-disk.
        (reftex-parse-all)
        ; add a custom reftex cite format to insert links
        ; This also changes any call to org-citation!
        (reftex-set-cite-format
         '((?c . "\\citet{%l}") ; natbib inline text
           (?i . "\\citep{%l}") ; natbib with parens
           ))))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)
