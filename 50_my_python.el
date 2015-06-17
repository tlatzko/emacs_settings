;;; setting up python mode
;;; code:


; enable ipython in the classic mode
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args " --classic"
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(autoload 'jedi:setup "jedi" nil t)
; (setq jedi:setup-keys t)
(add-hook 'python-mode-hook
          (lambda()
            (auto-complete-mode 1)
            (jedi:setup)
            (jedi:ac-setup)
            (python-cell-mode 1)
            (guru-mode -1)
            (linum-mode 1)))
