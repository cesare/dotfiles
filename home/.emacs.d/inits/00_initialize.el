;; -*- mode: emacs-lisp; coding: utf-8 -*-
;;
;;

;;
;; Environment variables
;;
(let ((home-bin (expand-file-name "~/bin")))
  (setq exec-path (list "/usr/local/scala/bin"
                        "/usr/local/mysql/bin"
                        "/usr/local/bin"
                        "/usr/bin"
                        "/bin"
                        "/usr/sbin"
                        "/sbin"
                        "/Applications/Emacs.app/Contents/MacOS/bin"
                        home-bin)))
(setenv "PATH" (mapconcat 'identity exec-path ":"))


;;
;; Custom variables
;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ruby-deep-indent-paren nil)
 '(c-basic-offset 2)
 '(cua-mode nil)
 '(scala-default-interpreter "/usr/local/scala/bin/scala")
 '(nush-program-name "/usr/local/bin/nush")
 '(clojure-inferior-lisp-program (expand-file-name "~/bin/clj"))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:background "Gray30"))))
 '(flymake-warnline ((((class color)) (:background "Gray20"))))
 )

(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "gray25")
(set-face-foreground 'show-paren-match-face "SkyBlue")

;;
;; disable splash
;;
(setq inhibit-startup-message t)

;;
;; set Command key as Meta-key
;;
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;;
;; disable ANNOYING beep
;;
(setq ring-bell-function 'ignore)

;;
;; Auto revert
;;
(global-auto-revert-mode 1)

;;
;; highlight current line
;;
(defface hlline-face
  '((((class color)
      (background dark))
     ;;(:background "dark state gray"))
     (:background "gray10"
                  :underline nil))
    (((class color)
      (background light))
     (:background "white"
                  :underline nil))
    (t ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;;
;; Always show line numbers
;;
(global-linum-mode t)

;;
;;
;;
(define-key global-map "\C-h" 'delete-backward-char)

;;
;; stop auto saving
;;
(setq auto-save-default nil)

;;
;; Tabs
;;
(setq-default indent-tabs-mode nil)

;;
;; Set Home
;;
(defun cd-to-homedir-all-buffers ()
  "Change every current directory of all buffers to the home directory."
  (mapc
   (lambda (buf) (set-buffer buf) (cd (expand-file-name "~"))) (buffer-list)))
(add-hook 'after-init-hook 'cd-to-homedir-all-buffers)

;;
;; Go
;;
;;(require 'go-mode-load)


;;
;; character set
;;
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)

;;
;; font-lock mode
;;
(global-font-lock-mode 1)
(setq font-lock-support-mode 'jit-lock-mode)


;;
;; enable electric-pair-mode (to auto complete parens)
;;
(electric-pair-mode +1)

;;
;;
(setq oz-prefix "/Applications/Mozart.app/Contents/Resources")
(require 'oz)

;;
;; Git mode
;;
;(require 'git)
(delete 'Git vc-handled-backends)

;;
;; wdired
;;
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;
;; tramp
;;
(require 'tramp)
(setq tramp-default-method "ssh")

;;
;; color-moccur, moccur-edit
;;
(require 'color-moccur)
(load "moccur-edit")

(put 'narrow-to-region 'disabled nil)

;;
;; auto-complete
;;
(global-auto-complete-mode t)
