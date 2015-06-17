(add-hook 'c-mode-common-hook
          (lambda ()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (cppcm-reload-all)
              )
            (local-set-key (kdb "C-c C-b") #'cppcm-compile)

            ))
;; OPTIONAL, somebody reported that they can use this package with Fortran
(add-hook 'c90-mode-hook (lambda () (cppcm-reload-all)))
;; OPTIONAL, avoid typing full path when starting gdb
(global-set-key (kbd "C-c C-g")
                '(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))
;; OPTIONAL, some users need specify extra flags forwarded to compiler
(setq cppcm-extra-preprocss-flags-from-user '("-I/usr/src/linux/include" "-DNDEBUG"))


(defun my-cpp-mode-hook ()
  (setq tab-width 4)
  (semantic-mode 1)
  (guru-mode -1)
  (setq flycheck-clang-language-standard "c++11"))

(add-hook 'c++-mode-hook 'my-cpp-mode-hook)

; start flymake-google-cpplint-load
; let's define a function for flymake initialization
(defun my:flymake-google-init () 
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/home/latzko/work/devenv/bin/cpplint"))
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)



(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
