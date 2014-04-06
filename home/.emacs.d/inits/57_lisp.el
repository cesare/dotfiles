;;
;; Lisp
;;
(setq inferior-lisp-program "/usr/local/bin/sbcl")
;(setq inferior-lisp-program "ccl")

;; enable slime
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

;; enable auto-complete-slime
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;; enalbe popwin
;;(require 'popwin)
;;(setq display-buffer-function 'popwin:display-buffer)

;; Apropos
;;(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
;;(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
;;(push '("*slime-description*") popwin:special-display-config)
;; Compilation
;;(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
;;(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
;;(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
;;(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
;;(push '(slime-connection-list-mode) popwin:special-display-config)



;;
;; Scheme
;;
(modify-coding-system-alist 'process "gosh" '(utf-8 . utf-8))
(setq scheme-program-name "/usr/local/bin/gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
(defun scheme-other-window ()
  "Run Scheme on other window."
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

(define-key global-map
  "\C-cs" 'scheme-other-window)


;;
;; Clojure mode
;;
(setq auto-mode-alist
      (cons (cons "\\.clj$" 'clojure-mode) auto-mode-alist))
(require 'clojure-mode)


;;
;; Nu mode
;;
;;(require 'nu)
;;(add-hook 'nu-mode-hook (lambda () (paredit-mode +1)) t)

