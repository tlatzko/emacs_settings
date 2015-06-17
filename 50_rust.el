;;; 50_rust.el rust settings for emacs
(add-to-list 'load-path "~/git/rust/src")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(setq racer-rust-src-path "~/git/racer/src/")
(setq racer-cmd "~/git/racer/target/release/racer")
(add-to-list 'load-path "~/git/racer/editors/emacs")
(eval-after-load "rust-mode" '(require 'racer))
;;; 
