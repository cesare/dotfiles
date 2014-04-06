;;
;; Haskell mode
;;
(load "haskell-site-file")
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hi$"     . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
   "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
   "Major mode for editing literate Haskell scripts." t)


(defun my-haskell-add-hook ()
  (turn-on-haskell-indentation)
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-decl-scan)
  (font-lock-mode)
  )

(setq haskell-literate-default 'latex)
(setq haskell-doc-idle-delay 0)
(setq haskell-program-name "/usr/bin/ghci")
(setq haskell-indent-offset 2)

