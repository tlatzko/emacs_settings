;;; misc settings mot global
;; my own stuff
;; setup
;(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(setq projectile-completion-system 'grizzl)
;; (setq langtool-language-tool-jar "/usr/local/languagetool/languagetool-commandline.jar")

;; activate yasnippet global
(yas-global-mode 1)

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))


(eval-after-load "ispell"
  '(add-to-list 'ispell-dictionary-alist
                '("deutsch8"
                  "[a-zA-ZäöüßÄÖÜ]" "[^a-zA-ZäöüßÄÖÜ]" "[']" t
                  ("-C" "-d" "de_DE-neu.multi")
                  "~latin1" iso-8859-1)))

;; switch from german to english for the dictionary
(defun fd-switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
    	 (change (if (string= dic "deutsch8") "english" "deutsch8")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)
    ))

(global-set-key (kbd "<f8>")   'fd-switch-dictionary)
; set global lin num mode to show linenumbers every where
(global-linum-mode 1)
; flx ido threshold
(setq flx-ido-threshold 1000)

;(global-auto-complete-mode t)

(setq prelude-whitespace nil)

(global-hl-line-mode 0)
;; Inline auto completion and suggestions
(powerline-default-theme)

;aspell und flyspell
(setq-default ispell-program-name "aspell")
; use key chords invoke commands
(key-chord-mode 1)
; buffer actions
(key-chord-define-global "vg"     'eval-region)
(key-chord-define-global "vb"     'eval-buffer)
(key-chord-define-global "cy"     'yank-pop)

; frame actions
; (key-chord-define-global "nn"     'other-window);
(key-chord-define-global "b1"     'delete-other-windows)
(key-chord-define-global "b0"     'delete-window)
(defun kill-this-buffer-if-not-modified ()
  (interactive)
  ; taken from menu-bar.el
  (if (menu-bar-non-minibuffer-window-p)
      (kill-buffer-if-not-modified (current-buffer))
    (abort-recursive-edit)))
(key-chord-define-global "kb"     'kill-this-buffer-if-not-modified)
; file actions
(key-chord-define-global "bf"     'ido-switch-buffer)
(key-chord-define-global "cf"     'ido-find-file)
(key-chord-define-global "vc"     'vc-next-action)



(key-chord-define-global "JJ" 'prelude-switch-to-previous-buffer)
(key-chord-define-global "uu" 'undo-tree-visualize)
(key-chord-define-global "xx" 'execute-extended-command)
(key-chord-define-global "yy" 'browse-kill-ring)

;(define-key global-map (kbd "C-j") 'newline-and-indent)
;;; 50_my_setting.el ends here

(add-hook 'doc-view-mode-hook
          (lambda ()
            (linum-mode -1)
            ))
