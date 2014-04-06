;;
;; window appearances
;;
(if (fboundp 'set-scroll-bar-mode)
    (set-scroll-bar-mode 'right))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

(create-fontset-from-ascii-font "Menlo-12:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo"
                  'unicode
                  (font-spec :family "Hiragino Kaku Gothic ProN" :size 12)
                  nil
                  'append)

(setq default-frame-alist
      (append
       '(;(foreground-color . "gray")  ; 前景色
         ;(background-color . "black") ; 背景色
         (cursor-color     . "red")  ; カーソル色
         ; (width            . 224)     ; フレーム幅(文字数)
         ; (height           . 70)      ; フレーム高(文字数)
         (width            . 186)     ; フレーム幅(文字数)
         (height           . 60)      ; フレーム高(文字数)
         (top              . 30)      ; フレームの Y 位置(ピクセル数)
         (left             . 50)      ; フレームの X 位置(ピクセル数)
         (alpha            . (92 85))
         (font . "fontset-menlokakugo")
        )
 default-frame-alist))

(blink-cursor-mode -1)

;;
;; fonts
;;
;(when (eq system-type 'darwin)
;  (setq my-font "-*-*-medium-r-normal--12-*-*-*-*-*-fontset-osaka")
;;;  (setq fixed-width-use-QuickDraw-for-ascii t)
;  (setq mac-allow-anti-aliasing t)
;  (if (= emacs-major-version 22)
;      (require 'carbon-font))
;  (set-default-font my-font)
;  (add-to-list 'default-frame-alist `(font . ,my-font))
;  (when (> emacs-major-version 23)
;    (set-face-attribute 'default nil
;      :family "monaco"
;      :height 140)
;    (set-fontset-font
;      (frame-parameter nil 'font)
;      'japanese-jisx0208
;      '("Hiragino Maru Gothic Pro" . "iso10646-1"))
;    (set-fontset-font
;      (frame-parameter nil 'font)
;      'japanese-jisx0212
;      '("Hiragino Maru Gothic Pro" . "iso10646-1"))
;    (setq face-font-rescale-alist
;	  '(("^-apple-hiragino.*" . 1.2)
;	    (".*osaka-bold.*" . 1.2)
;  	    (".*osaka-medium.*" . 1.2)
;  	    (".*courier-bold-.*-mac-roman" . 1.0)
;  	    (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
;  	    (".*monaco-bold-.*-mac-roman" . 0.9)
;  	    ("-cdac$" . 1.3)))))

