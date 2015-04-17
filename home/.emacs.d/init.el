;; -*- mode: emacs-lisp; coding: utf-8 -*-
;;
;;
(require 'cask "/usr/local/share/emacs/site-lisp/cask.el")
(cask-initialize)

(setq load-path
      (append
       (list
         (expand-file-name "~/.emacs.d/site-lisp"))
       load-path))

(require 'init-loader "~/.emacs.d/init-loader.el")
(setq init-loader-show-log-after-init nil)
(init-loader-load)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(clojure-inferior-lisp-program (expand-file-name "~/bin/clj"))
 '(cua-mode nil nil (cua-base))
 '(haskell-mode-hook (quote (turn-on-haskell-decl-scan turn-on-haskell-doc turn-on-haskell-indentation)))
 '(nush-program-name "/usr/local/bin/nush")
 '(ruby-deep-indent-paren nil)
 '(scala-default-interpreter "/usr/local/scala/bin/scala")
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:background "Gray30"))))
 '(flymake-warnline ((((class color)) (:background "Gray20")))))
