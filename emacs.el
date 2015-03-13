;; -*- emacs-lisp -*-
;; 
;; For Emacs 2x.x
;; Copyleft http://yeupou.wordpress.com

;;*********************
;; DOTFILE
;; regenerate the .gnus.elc if .gnus.el is newer
(defun dotemacscheck! ()
  "If .emacs.el exists and is newer than .emacs.elc, recompile it"
  (cond
   ((file-newer-than-file-p "~/.rc/emacs.el" "~/.rc/emacs.elc")
    (let ((mode-line-format "*** Recompiling .emacs.el ***"))
      (sit-for 1)
      (byte-compile-file "~/.rc/emacs.el")
      (message ".emacs.elc recompiled --- reloading...")
      )
    (load "~/.rc/emacs.elc" t t t)
    )))
(dotemacscheck!)


;;*******************
;; Always do UTF8
(prefer-coding-system 'utf-8)


;;*******************
;; COSMETICS

;; Cosmetics
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#3d3d3d" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "unknown"))))
 '(bold-italic ((t (:underline "cyan" :slant italic :weight bold))))
 '(border ((t nil)))
 '(cursor ((t (:background "#73DAE1" :foreground "white"))))
 '(custom-button-face ((((type x w32 mac) (class color)) (:background "#3d3d3d" :foreground "white" :box (:line-width 1 :style released-button)))) t)
 '(custom-button-pressed-face ((((type x w32 mac) (class color)) (:background "#3d3d3d" :foreground "white" :box (:line-width 1 :style pressed-button)))) t)
 '(custom-state-face ((((class color) (background dark)) (:foreground "#90ff75"))) t)
 '(fixed-pitch ((t nil)))
 '(font-lock-comment-face ((((class color) (background dark)) (:background "#4d4d4d" :foreground "chocolate1"))))
 '(fringe ((t (:background "#4d4d4d" :foreground "#b4b4b4"))))
 '(gnus-header-content-face ((t (:foreground "aquamarine" :slant italic))))
 '(gnus-header-from-face ((((class color) (background dark)) (:foreground "spring green"))))
 '(gnus-header-name-face ((((class color) (background dark)) (:foreground "medium aquamarine"))))
 '(gnus-header-subject-face ((((class color) (background dark)) (:foreground "#f3f284"))))
 '(gnus-signature-face ((t (:foreground "#b0b0b0"))))
 '(gnus-summary-normal-ancient-face ((((class color) (background dark)) (:foreground "#a9a9a9"))))
 '(gnus-summary-normal-read-face ((((class color) (background dark)) (:foreground "#a9a9a9"))))
 '(gnus-summary-normal-ticked-face ((((class color) (background dark)) (:foreground "#bce8ff"))))
 '(gnus-summary-normal-undownloaded-face ((t (:foreground "LightGray" :strike-through "#d9d9d9" :weight normal))))
 '(gnus-summary-selected-face ((t (:background "#4d4d4d" :foreground "#fcffa8"))))
 '(header-line ((t (:inherit mode-line :background "#eeeee6" :foreground "grey20" :box nil))))
 '(highlight ((((class color) (background dark)) (:background "aquamarine" :foreground "black"))))
 '(italic ((t (:underline "cyan" :slant italic))))
 '(menu ((((type x-toolkit)) (:background "#eeeee6" :foreground "black"))))
 '(message-cited-text-face ((((class color) (background dark)) (:foreground "sandy brown"))))
 '(message-header-cc-face ((t (:foreground "medium aquamarine" :weight bold))))
 '(message-header-name-face ((((class color) (background dark)) (:foreground "aquamarine"))))
 '(message-header-other-face ((((class color) (background dark)) (:foreground "aquamarine"))))
 '(message-header-subject-face ((((class color) (background dark)) (:foreground "green2" :weight bold))))
 '(message-header-xheader-face ((((class color) (background dark)) (:foreground "khaki"))))
 '(message-mml-face ((((class color) (background dark)) (:foreground "orchid"))))
 '(message-separator-face ((((class color) (background dark)) (:foreground "khaki"))))
 '(mode-line ((((type x w32 mac) (class color)) (:background "#eeeee6" :foreground "black" :box (:line-width -1 :color "#eeeee6" :style released-button)))))
 '(mouse ((t (:background "#73DAE1"))))
 '(region ((t (:background "#73DAE1" :foreground "black"))))
 '(scroll-bar ((t (:background "#3d3d3d" :foreground "#73DAE1"))))
 '(tool-bar ((((type x w32 mac) (class color)) (:background "moccasin" :foreground "black" :box (:line-width 1 :style released-button)))))
 '(variable-pitch ((t nil)))
 '(widget-field ((((class grayscale color) (background light)) (:underline "gray52")))))


;;**********************
;; SHORTCUFS, PREFS
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; Selection related
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(display-time-24hr-format t)
 '(global-font-lock-mode t nil (font-lock))
 '(message-directory "~/.Mail/" t)
 '(mouse-wheel-mode t nil (mwheel))
 '(pc-select-meta-moves-sexps t)
 '(pc-selection-mode t nil (pc-select))
 '(read-mail-command (quote gnus))
 '(save-place t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(spell-command "aspell")
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(x-select-enable-clipboard nil))

;; Also defined in .gnus.el
;; avoid apparition of ~/Mail/.
(setq gnus-directory "~/.News/")
(setq message-directory "~/.Mail/")

;; Ignore startup kind of splash screen
(setq inhibit-startup-message t)

;;*******************
;; MODES
;; Comment-out modes not installed on your computer.

;; Little bar cursor instead of a block. Easier for me.
(require 'bar-cursor)
(bar-cursor-mode 1)

;; Scroll bar to the right, by habbit, by implicit convention.
(set-scroll-bar-mode 'right)

;; recently opened files
(require 'recentf) 
(recentf-mode 1)

;; Use templates
(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory "~/.rc/templates/")
(setq auto-insert-query nil)
(define-auto-insert "\.sh" "template.sh")
(define-auto-insert "\.pl" "template.pl")
(define-auto-insert "\.pm" "template.pl")
(define-auto-insert "\.tex" "template.tex")
(define-auto-insert "\.php" "template.php")
(define-auto-insert "\.css" "c-template.c")
(define-auto-insert "\.c" "c-template.c") 

;;*******************
;; FUNCTIONS

;; Word counts, stats about words
(defun word-count nil
  "Count words in the buffer or active region using wc"
  (interactive)
  (if mark-active
      (shell-command-on-region (point) (mark) "wc -w")
    (shell-command-on-region (point-min) (point-max) "wc -w")))
(defalias 'wc 'word-count)

(message "Loading ~/.emacs.el...")
;; EOF
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
